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
import '../data/flutter_curriculum.dart';
import '../data/codequest_bank_expander.dart';

final selectedTrackProvider = StateProvider<CodeLanguage>((ref) {
  return CodeLanguage.flutter; // Varsayılan olarak popüler Flutter ile başla
});

final currentTrackConfigProvider = Provider<CodeTrackConfig>((ref) {
  final lang = ref.watch(selectedTrackProvider);
  return CodeTrackConfig.fromLanguage(lang);
});

final Map<CodeLanguage, List<LearningUnit>> _cachedExpandedTracks = {};

List<LearningUnit> _getRawUnits(CodeLanguage lang) {
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
    case CodeLanguage.flutter:
      return flutterUnits;
  }
}

List<LearningUnit> getExpandedUnitsForLanguage(CodeLanguage lang) {
  if (!_cachedExpandedTracks.containsKey(lang)) {
    final raw = _getRawUnits(lang);
    _cachedExpandedTracks[lang] = expandTrackWithQuestionBank(lang, raw);
  }
  return _cachedExpandedTracks[lang]!;
}

final currentUnitsProvider = Provider<List<LearningUnit>>((ref) {
  final lang = ref.watch(selectedTrackProvider);
  return getExpandedUnitsForLanguage(lang);
});

/// Tüm parçalardaki toplam soru sayısı (11 Yazılım Dalı)
final totalQuestionsStatsProvider = Provider<Map<String, int>>((ref) {
  const tracksCount = 11;
  const questionsPerTrack = 10240; // 64 ders x 160 soru
  const totalQuestions = tracksCount * questionsPerTrack;

  return {
    'totalQuestions': totalQuestions,
    'questionsPerTrack': questionsPerTrack,
    'totalTracks': tracksCount,
    'totalUnits': tracksCount * 8,
    'totalLessons': tracksCount * 64,
  };
});

final selectedCategoryFilterProvider = StateProvider<String>((ref) {
  return 'Tümü';
});

