import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:codequest/models/code_track_model.dart';
import 'package:codequest/models/curriculum_models.dart';
import 'package:codequest/providers/game_provider.dart';
import 'package:codequest/data/python_curriculum.dart';
import 'package:codequest/data/kotlin_curriculum.dart';
import 'package:codequest/data/csharp_curriculum.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  group('CodeQuest GameProvider Tests', () {
    test('User starts with 5 hearts and can lose/refill hearts', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final notifier = container.read(userProfileProvider.notifier);
      expect(container.read(userProfileProvider).hearts, 5);

      notifier.loseHeart();
      expect(container.read(userProfileProvider).hearts, 4);

      notifier.refillHearts(cost: 50);
      expect(container.read(userProfileProvider).hearts, 5);
      expect(container.read(userProfileProvider).gems, 100); // 150 - 50 = 100
    });

    test('Completing a lesson updates XP, gems and completed status', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final notifier = container.read(userProfileProvider.notifier);
      final initialXp = container.read(userProfileProvider).xp;
      final initialGems = container.read(userProfileProvider).gems;

      notifier.completeLesson(
        lessonId: 'py_u1_l1',
        xpEarned: 50,
        gemsEarned: 15,
        score: 100.0,
      );

      final updated = container.read(userProfileProvider);
      expect(updated.xp, initialXp + 50);
      expect(updated.gems, initialGems + 15);
      expect(updated.completedLessonIds.contains('py_u1_l1'), isTrue);
      expect(updated.lessonScores['py_u1_l1'], 100.0);
    });

    test('Claiming achievement awards bonus gems and xp', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final notifier = container.read(userProfileProvider.notifier);
      final initialGems = container.read(userProfileProvider).gems;
      final initialXp = container.read(userProfileProvider).xp;

      notifier.claimAchievement('first_code', 20, 50);

      final updated = container.read(userProfileProvider);
      expect(updated.claimedAchievementIds.contains('first_code'), isTrue);
      expect(updated.gems, initialGems + 20);
      expect(updated.xp, initialXp + 50);
    });
  });

  group('Track & Curriculum Integrity Tests', () {
    test('Track configurations are defined properly for all 10 tracks including Git, Godot and C', () {
      expect(CodeTrackConfig.allTracks.length, 10);
      expect(CodeTrackConfig.git.language, CodeLanguage.git);
      expect(CodeTrackConfig.godot.language, CodeLanguage.godot);
      expect(CodeTrackConfig.c.language, CodeLanguage.c);
      expect(CodeTrackConfig.python.language, CodeLanguage.python);
      expect(CodeTrackConfig.kotlin.language, CodeLanguage.kotlin);
      expect(CodeTrackConfig.csharp.language, CodeLanguage.csharp);
    });

    test('All curriculum units have lessons with valid questions and answers', () {
      final allUnits = [...pythonUnits, ...kotlinUnits, ...csharpUnits];
      expect(allUnits.isNotEmpty, isTrue);

      for (final unit in allUnits) {
        expect(unit.title.isNotEmpty, isTrue);
        expect(unit.lessons.isNotEmpty, isTrue);
        expect(unit.cheatSheetContent.isNotEmpty, isTrue);

        for (final lesson in unit.lessons) {
          expect(lesson.title.isNotEmpty, isTrue);
          expect(lesson.questions.isNotEmpty, isTrue);

          for (final q in lesson.questions) {
            expect(q.id.isNotEmpty, isTrue);
            if (q.type == QuestionType.multipleChoice || q.type == QuestionType.codeOutput) {
              expect(q.options, isNotNull);
              expect(q.correctIndex, isNotNull);
              expect(q.correctIndex! >= 0 && q.correctIndex! < q.options!.length, isTrue);
            } else if (q.type == QuestionType.fillInTheBlank) {
              expect(q.blankOptions, isNotNull);
              expect(q.correctBlankAnswer, isNotNull);
              expect(q.blankOptions!.contains(q.correctBlankAnswer), isTrue);
            } else if (q.type == QuestionType.matching) {
              expect(q.matchingPairs, isNotNull);
              expect(q.matchingPairs!.isNotEmpty, isTrue);
            } else if (q.type == QuestionType.trueFalse) {
              expect(q.isTrue, isNotNull);
            } else if (q.type == QuestionType.conceptCard) {
              expect(q.conceptTitle != null || q.rule != null, isTrue);
            }
          }
        }
      }
    });
  });
}
