import 'code_track_model.dart';

enum QuestionType {
  conceptCard,
  multipleChoice,
  fillInTheBlank,
  matching,
  trueFalse,
  codeOutput,
}

class MatchingPair {
  final String left;
  final String right;

  const MatchingPair({required this.left, required this.right});
}

class Question {
  final String id;
  final QuestionType type;
  final String prompt;
  final String? codeSnippet;
  final String? passage;
  final List<String>? options;
  final int? correctIndex;
  final String explanation;
  final List<MatchingPair>? matchingPairs;
  final bool? isTrue;

  // Boşluk Doldurma
  final List<String>? blankOptions;
  final String? correctBlankAnswer;

  // Hap Bilgi / Konu Anlatım Kartı
  final String? conceptTitle;
  final String? rule;
  final String? codeExample;
  final List<String>? examples;
  final String? devTip;
  final String? iconEmoji;

  const Question({
    required this.id,
    required this.type,
    this.prompt = '',
    this.codeSnippet,
    this.passage,
    this.options,
    this.correctIndex,
    this.explanation = '',
    this.matchingPairs,
    this.isTrue,
    this.blankOptions,
    this.correctBlankAnswer,
    this.conceptTitle,
    this.rule,
    this.codeExample,
    this.examples,
    this.devTip,
    this.iconEmoji,
  });
}

class Lesson {
  final String id;
  final String title;
  final String description;
  final int xpReward;
  final int gemReward;
  final List<Question> questions;
  final bool isUnitExam;

  const Lesson({
    required this.id,
    required this.title,
    required this.description,
    this.xpReward = 50,
    this.gemReward = 15,
    required this.questions,
    this.isUnitExam = false,
  });
}

class LearningUnit {
  final String id;
  final int unitNumber;
  final String title;
  final CodeLanguage language;
  final String category;
  final int colorHex;
  final List<Lesson> lessons;
  final String cheatSheetTitle;
  final String cheatSheetContent;

  const LearningUnit({
    required this.id,
    required this.unitNumber,
    required this.title,
    required this.language,
    required this.category,
    required this.colorHex,
    required this.lessons,
    required this.cheatSheetTitle,
    required this.cheatSheetContent,
  });
}

enum AchievementCategory {
  streak,
  lessons,
  xp,
  languages,
  gems,
  special,
}

class Achievement {
  final String id;
  final String title;
  final String desc;
  final String iconEmoji;
  final AchievementCategory category;
  final int currentProgress;
  final int maxProgress;
  final int tier;
  final int gemReward;
  final int xpReward;
  final bool isUnlocked;
  final bool isClaimed;

  const Achievement({
    required this.id,
    required this.title,
    required this.desc,
    required this.iconEmoji,
    required this.category,
    required this.currentProgress,
    required this.maxProgress,
    this.tier = 1,
    this.gemReward = 25,
    this.xpReward = 60,
    required this.isUnlocked,
    this.isClaimed = false,
  });

  double get progressRatio =>
      maxProgress > 0 ? (currentProgress / maxProgress).clamp(0.0, 1.0) : 0.0;
}

class UserProfile {
  final int hearts;
  final int maxHearts;
  final int streak;
  final String lastActiveDate;
  final int xp;
  final int gems;
  final Set<String> completedLessonIds;
  final Map<String, double> lessonScores;
  final bool isPremium;
  final int questionsAnsweredCount;
  final Set<String> claimedAchievementIds;

  const UserProfile({
    this.hearts = 5,
    this.maxHearts = 5,
    this.streak = 1,
    this.lastActiveDate = '',
    this.xp = 120,
    this.gems = 150,
    this.completedLessonIds = const {},
    this.lessonScores = const {},
    this.isPremium = false,
    this.questionsAnsweredCount = 0,
    this.claimedAchievementIds = const {},
  });

  UserProfile copyWith({
    int? hearts,
    int? maxHearts,
    int? streak,
    String? lastActiveDate,
    int? xp,
    int? gems,
    Set<String>? completedLessonIds,
    Map<String, double>? lessonScores,
    bool? isPremium,
    int? questionsAnsweredCount,
    Set<String>? claimedAchievementIds,
  }) {
    return UserProfile(
      hearts: hearts ?? this.hearts,
      maxHearts: maxHearts ?? this.maxHearts,
      streak: streak ?? this.streak,
      lastActiveDate: lastActiveDate ?? this.lastActiveDate,
      xp: xp ?? this.xp,
      gems: gems ?? this.gems,
      completedLessonIds: completedLessonIds ?? this.completedLessonIds,
      lessonScores: lessonScores ?? this.lessonScores,
      isPremium: isPremium ?? this.isPremium,
      questionsAnsweredCount: questionsAnsweredCount ?? this.questionsAnsweredCount,
      claimedAchievementIds: claimedAchievementIds ?? this.claimedAchievementIds,
    );
  }
}
