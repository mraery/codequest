import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/code_track_model.dart';
import '../models/curriculum_models.dart';
import '../data/git_curriculum.dart';
import '../data/godot_curriculum.dart';
import '../data/c_curriculum.dart';
import '../data/python_curriculum.dart';
import '../data/csharp_curriculum.dart';
import '../data/kotlin_curriculum.dart';
import '../data/linux_curriculum.dart';
import '../data/javascript_curriculum.dart';
import '../data/sql_curriculum.dart';
import '../data/algorithms_curriculum.dart';

final selectedTrackProvider = StateProvider<CodeLanguage>((ref) {
  return CodeLanguage.git; // Varsayılan olarak Git ile başla
});

final currentTrackConfigProvider = Provider<CodeTrackConfig>((ref) {
  final lang = ref.watch(selectedTrackProvider);
  return CodeTrackConfig.fromLanguage(lang);
});

final currentUnitsProvider = Provider<List<LearningUnit>>((ref) {
  final lang = ref.watch(selectedTrackProvider);
  switch (lang) {
    case CodeLanguage.git:
      return gitUnits;
    case CodeLanguage.godot:
      return godotUnits;
    case CodeLanguage.c:
      return cUnits;
    case CodeLanguage.python:
      return pythonUnits;
    case CodeLanguage.csharp:
      return csharpUnits;
    case CodeLanguage.kotlin:
      return kotlinUnits;
    case CodeLanguage.linux:
      return linuxUnits;
    case CodeLanguage.javascript:
      return javascriptUnits;
    case CodeLanguage.sql:
      return sqlUnits;
    case CodeLanguage.algorithms:
      return algorithmsUnits;
  }
});

/// Tüm parçalardaki toplam soru sayısı (5400+)
final totalQuestionsStatsProvider = Provider<Map<String, int>>((ref) {
  final allTracksList = [
    gitUnits,
    godotUnits,
    cUnits,
    pythonUnits,
    csharpUnits,
    kotlinUnits,
    linuxUnits,
    javascriptUnits,
    sqlUnits,
    algorithmsUnits,
  ];

  int totalQ = 0;
  for (final trackUnits in allTracksList) {
    for (final unit in trackUnits) {
      for (final lesson in unit.lessons) {
        totalQ += lesson.questions.length;
      }
    }
  }

  return {
    'totalQuestions': totalQ,
    'totalTracks': allTracksList.length,
    'totalUnits': allTracksList.length * 5,
    'totalLessons': allTracksList.length * 30,
  };
});

final selectedCategoryFilterProvider = StateProvider<String>((ref) {
  return 'Tümü';
});
