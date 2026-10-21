import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/curriculum_models.dart';
import '../data/codequest_achievements.dart';

final userProfileProvider =
    StateNotifierProvider<UserProfileNotifier, UserProfile>((ref) {
  return UserProfileNotifier();
});

class UserProfileNotifier extends StateNotifier<UserProfile> {
  UserProfileNotifier() : super(const UserProfile()) {
    _loadFromPrefs();
  }

  static const String _keyHearts = 'cq_hearts';
  static const String _keyStreak = 'cq_streak';
  static const String _keyXp = 'cq_xp';
  static const String _keyGems = 'cq_gems';
  static const String _keyCompletedLessons = 'cq_completed_lessons';
  static const String _keyLessonScores = 'cq_lesson_scores';
  static const String _keyLastDate = 'cq_last_date';
  static const String _keyPremium = 'cq_is_premium';
  static const String _keyQuestionsAnswered = 'cq_questions_answered';
  static const String _keyClaimedAchievements = 'cq_claimed_achievements';
  static const String _keyCheat = 'cq_is_cheat_unlocked';

  Future<void> _loadFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    if (!mounted) return;

    final hearts = prefs.getInt(_keyHearts) ?? 5;
    final streak = prefs.getInt(_keyStreak) ?? 1;
    final xp = prefs.getInt(_keyXp) ?? 120;
    final gems = prefs.getInt(_keyGems) ?? 150;
    final completed = prefs.getStringList(_keyCompletedLessons)?.toSet() ?? {};
    final lastDate = prefs.getString(_keyLastDate) ?? _todayString();
    final isPremium = prefs.getBool(_keyPremium) ?? false;
    final isCheat = prefs.getBool(_keyCheat) ?? false;
    final questionsAnswered = prefs.getInt(_keyQuestionsAnswered) ?? 12;
    final claimed = prefs.getStringList(_keyClaimedAchievements)?.toSet() ?? {};

    Map<String, double> scores = {};
    final scoresJson = prefs.getString(_keyLessonScores);
    if (scoresJson != null && scoresJson.isNotEmpty) {
      try {
        final decoded = jsonDecode(scoresJson) as Map<String, dynamic>;
        scores = decoded.map((k, v) => MapEntry(k, (v as num).toDouble()));
      } catch (_) {}
    } else {
      for (final id in completed) {
        scores[id] = 100.0;
      }
    }

    state = state.copyWith(
      hearts: hearts,
      streak: streak,
      xp: xp,
      gems: gems,
      completedLessonIds: completed,
      lessonScores: scores,
      lastActiveDate: lastDate,
      isPremium: isPremium,
      isCheatUnlocked: isCheat,
      questionsAnsweredCount: questionsAnswered,
      claimedAchievementIds: claimed,
    );
  }

  String _todayString() {
    final now = DateTime.now();
    return '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}';
  }

  Future<void> _saveToPrefs() async {
    final current = state;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_keyHearts, current.hearts);
    await prefs.setInt(_keyStreak, current.streak);
    await prefs.setInt(_keyXp, current.xp);
    await prefs.setInt(_keyGems, current.gems);
    await prefs.setStringList(_keyCompletedLessons, current.completedLessonIds.toList());
    await prefs.setStringList(_keyClaimedAchievements, current.claimedAchievementIds.toList());
    await prefs.setString(_keyLessonScores, jsonEncode(current.lessonScores));
    await prefs.setString(_keyLastDate, current.lastActiveDate);
    await prefs.setBool(_keyPremium, current.isPremium);
    await prefs.setBool(_keyCheat, current.isCheatUnlocked);
    await prefs.setInt(_keyQuestionsAnswered, current.questionsAnsweredCount);
  }

  void loseHeart() {
    if (state.isPremium) return;
    if (state.hearts > 0) {
      state = state.copyWith(hearts: state.hearts - 1);
      _saveToPrefs();
    }
  }

  void refillHearts({int cost = 50}) {
    if (state.gems >= cost) {
      state = state.copyWith(
        hearts: state.maxHearts,
        gems: state.gems - cost,
      );
      _saveToPrefs();
    }
  }

  void completeLesson({
    required String lessonId,
    required int xpEarned,
    required int gemsEarned,
    required double score,
  }) {
    final newCompleted = Set<String>.from(state.completedLessonIds)..add(lessonId);
    final newScores = Map<String, double>.from(state.lessonScores)..[lessonId] = score;

    final today = _todayString();
    int newStreak = state.streak;
    if (state.lastActiveDate != today) {
      newStreak += 1;
    }

    state = state.copyWith(
      completedLessonIds: newCompleted,
      lessonScores: newScores,
      xp: state.xp + xpEarned,
      gems: state.gems + gemsEarned,
      streak: newStreak,
      lastActiveDate: today,
    );
    _saveToPrefs();
  }

  void addXp(int amount) {
    if (amount > 0) {
      state = state.copyWith(xp: state.xp + amount);
      _saveToPrefs();
    }
  }

  void addGems(int amount) {
    if (amount > 0) {
      state = state.copyWith(gems: state.gems + amount);
      _saveToPrefs();
    }
  }

  void claimAchievement(String achievementId, int gemReward, int xpReward) {
    if (state.claimedAchievementIds.contains(achievementId)) return;
    final newClaimed = Set<String>.from(state.claimedAchievementIds)..add(achievementId);
    state = state.copyWith(
      claimedAchievementIds: newClaimed,
      gems: state.gems + gemReward,
      xp: state.xp + xpReward,
    );
    _saveToPrefs();
  }

  bool isLessonUnlocked(String lessonId, List<LearningUnit> units) {
    List<String> allLessonIds = [];
    for (final u in units) {
      for (final l in u.lessons) {
        allLessonIds.add(l.id);
      }
    }
    final index = allLessonIds.indexOf(lessonId);
    if (index <= 0) return true; // İlk ders her zaman açık
    // Önceki ders tamamlanmış mı?
    final prevId = allLessonIds[index - 1];
    return state.completedLessonIds.contains(prevId);
  }

  void rewardHeartFromAd() {
    state = state.copyWith(hearts: (state.hearts + 1).clamp(0, state.maxHearts));
    _saveToPrefs();
  }

  void activateFreeProPass() {
    state = state.copyWith(isPremium: true, hearts: state.maxHearts);
    _saveToPrefs();
  }

  PromoResult applyPromoCode(String rawCode) {
    final code = rawCode.trim().toLowerCase();
    if (code.isEmpty) {
      return const PromoResult(
        success: false,
        message: 'Lütfen bir promosyon veya indirim kodu girin.',
      );
    }

    // 🚀 KULLANICININ ÖZEL HİLE & PREMİUM KODU: kagan
    if (code == 'kagan' || code == 'kagan123') {
      if (state.isCheatUnlocked || state.isPremium) {
        state = state.copyWith(
          isCheatUnlocked: false,
          isPremium: false,
          hearts: state.maxHearts,
        );
        _saveToPrefs();
        return const PromoResult(
          success: true,
          isCheat: false,
          message: '🛡️ Kagan Hile & Premium Kapatıldı!\n'
              '❤️ Tekrardan 5 can ile normal canlı moda döndün.\n'
              '⚡ Otomatik kod çözme ve sınırsız can kapatıldı.',
        );
      } else {
        state = state.copyWith(
          hearts: state.maxHearts,
          gems: 300,
          isPremium: true,
          isCheatUnlocked: true,
        );
        _saveToPrefs();
        return PromoResult(
          success: true,
          isCheat: true,
          hearts: state.maxHearts,
          gems: 300,
          message: '🔥 Kagan Özel Geliştirici Hilesi Devreye Girdi!\n'
              '❤️ Sınırsız Can & Pro Pass Aktif Edildi!\n'
              '💎 300 Elmas Hesabına Yüklendi!\n'
              '⚡ Quizlerde OTO-ÇÖZ Hile Butonu Aktif Edildi!\n'
              '(Kapatmak için tekrar "kagan" veya "kapat" yazabilirsin)',
        );
      }
    }

    if (code == 'kapat' || code == 'premium kapat' || code == 'hilekapat') {
      state = state.copyWith(
        isPremium: false,
        isCheatUnlocked: false,
        hearts: state.maxHearts,
      );
      _saveToPrefs();
      return const PromoResult(
        success: true,
        isCheat: false,
        message: '🔒 Hileler ve Premium Kapatıldı. Standart canlı moda geçildi.',
      );
    }

    return const PromoResult(
      success: false,
      message: 'Geçersiz promosyon kodu. Doğru kodu girdiğinizden emin olun.',
    );
  }
}

final achievementsProvider = Provider<List<Achievement>>((ref) {
  final profile = ref.watch(userProfileProvider);
  return buildAllAchievements(profile);
});
