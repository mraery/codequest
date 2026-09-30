import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/curriculum_models.dart';

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
}

final achievementsProvider = Provider<List<Achievement>>((ref) {
  final profile = ref.watch(userProfileProvider);
  final completedCount = profile.completedLessonIds.length;

  return [
    Achievement(
      id: 'first_code',
      title: 'İlk Kod Satırı',
      desc: 'İlk yazılım dersini başarıyla tamamla.',
      iconEmoji: '🌱',
      category: AchievementCategory.lessons,
      currentProgress: completedCount,
      maxProgress: 1,
      tier: 1,
      gemReward: 20,
      xpReward: 50,
      isUnlocked: completedCount >= 1,
      isClaimed: profile.claimedAchievementIds.contains('first_code'),
    ),
    Achievement(
      id: 'python_apprentice',
      title: 'Python Çırağı',
      desc: '3 Python dersini tamamla ve print ustası ol.',
      iconEmoji: '🐍',
      category: AchievementCategory.languages,
      currentProgress: profile.completedLessonIds.where((id) => id.startsWith('py_')).length,
      maxProgress: 3,
      tier: 1,
      gemReward: 30,
      xpReward: 80,
      isUnlocked: profile.completedLessonIds.where((id) => id.startsWith('py_')).length >= 3,
      isClaimed: profile.claimedAchievementIds.contains('python_apprentice'),
    ),
    Achievement(
      id: 'streak_3',
      title: 'Alev Alan Parmaklar',
      desc: '3 günlük aralıksız kodlama serisine ulaş.',
      iconEmoji: '🔥',
      category: AchievementCategory.streak,
      currentProgress: profile.streak,
      maxProgress: 3,
      tier: 1,
      gemReward: 40,
      xpReward: 100,
      isUnlocked: profile.streak >= 3,
      isClaimed: profile.claimedAchievementIds.contains('streak_3'),
    ),
    Achievement(
      id: 'null_hunter',
      title: 'Null Avcısı',
      desc: 'Kotlin Null-Safety ünitesini başarıyla geç.',
      iconEmoji: '🛡️',
      category: AchievementCategory.languages,
      currentProgress: profile.completedLessonIds.where((id) => id.startsWith('kt_')).length,
      maxProgress: 2,
      tier: 1,
      gemReward: 35,
      xpReward: 90,
      isUnlocked: profile.completedLessonIds.where((id) => id.startsWith('kt_')).length >= 2,
      isClaimed: profile.claimedAchievementIds.contains('null_hunter'),
    ),
    Achievement(
      id: 'csharp_architect',
      title: 'C# Mimarı',
      desc: 'C# OOP ve LINQ derslerini başarıyla tamamla.',
      iconEmoji: '⚙️',
      category: AchievementCategory.languages,
      currentProgress: profile.completedLessonIds.where((id) => id.startsWith('cs_')).length,
      maxProgress: 2,
      tier: 1,
      gemReward: 35,
      xpReward: 90,
      isUnlocked: profile.completedLessonIds.where((id) => id.startsWith('cs_')).length >= 2,
      isClaimed: profile.claimedAchievementIds.contains('csharp_architect'),
    ),
    Achievement(
      id: 'xp_500',
      title: 'Senior Yolunda',
      desc: 'Toplam 500 XP puanı topla.',
      iconEmoji: '⭐',
      category: AchievementCategory.xp,
      currentProgress: profile.xp,
      maxProgress: 500,
      tier: 2,
      gemReward: 50,
      xpReward: 150,
      isUnlocked: profile.xp >= 500,
      isClaimed: profile.claimedAchievementIds.contains('xp_500'),
    ),
  ];
});
