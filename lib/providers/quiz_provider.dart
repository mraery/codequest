import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/curriculum_models.dart';
import 'game_provider.dart';

class QuizState {
  final Lesson lesson;
  final int currentQuestionIndex;
  final int? selectedOptionIndex;
  final String? selectedBlankAnswer;
  final Map<String, String> selectedPairs; // left -> right
  final String? activePairLeft;
  final bool? selectedTrueFalse;
  final bool isAnswerChecked;
  final bool isCorrect;
  final int correctAnswersCount;
  final int wrongAnswersCount;
  final bool isLessonFinished;

  const QuizState({
    required this.lesson,
    this.currentQuestionIndex = 0,
    this.selectedOptionIndex,
    this.selectedBlankAnswer,
    this.selectedPairs = const {},
    this.activePairLeft,
    this.selectedTrueFalse,
    this.isAnswerChecked = false,
    this.isCorrect = false,
    this.correctAnswersCount = 0,
    this.wrongAnswersCount = 0,
    this.isLessonFinished = false,
  });

  Question get currentQuestion => lesson.questions[currentQuestionIndex];
  int get totalQuestions => lesson.questions.length;
  double get progress => totalQuestions > 0 ? currentQuestionIndex / totalQuestions : 0.0;

  bool get canCheckAnswer {
    if (isAnswerChecked) return false;
    final q = currentQuestion;
    switch (q.type) {
      case QuestionType.conceptCard:
        return true;
      case QuestionType.multipleChoice:
      case QuestionType.codeOutput:
        return selectedOptionIndex != null;
      case QuestionType.fillInTheBlank:
        return selectedBlankAnswer != null;
      case QuestionType.trueFalse:
        return selectedTrueFalse != null;
      case QuestionType.matching:
        final neededPairs = q.matchingPairs?.length ?? 0;
        return selectedPairs.length == neededPairs;
    }
  }

  QuizState copyWith({
    Lesson? lesson,
    int? currentQuestionIndex,
    int? selectedOptionIndex,
    bool clearSelectedOption = false,
    String? selectedBlankAnswer,
    bool clearSelectedBlank = false,
    Map<String, String>? selectedPairs,
    String? activePairLeft,
    bool clearActivePair = false,
    bool? selectedTrueFalse,
    bool clearTrueFalse = false,
    bool? isAnswerChecked,
    bool? isCorrect,
    int? correctAnswersCount,
    int? wrongAnswersCount,
    bool? isLessonFinished,
  }) {
    return QuizState(
      lesson: lesson ?? this.lesson,
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
      selectedOptionIndex: clearSelectedOption ? null : (selectedOptionIndex ?? this.selectedOptionIndex),
      selectedBlankAnswer: clearSelectedBlank ? null : (selectedBlankAnswer ?? this.selectedBlankAnswer),
      selectedPairs: selectedPairs ?? this.selectedPairs,
      activePairLeft: clearActivePair ? null : (activePairLeft ?? this.activePairLeft),
      selectedTrueFalse: clearTrueFalse ? null : (selectedTrueFalse ?? this.selectedTrueFalse),
      isAnswerChecked: isAnswerChecked ?? this.isAnswerChecked,
      isCorrect: isCorrect ?? this.isCorrect,
      correctAnswersCount: correctAnswersCount ?? this.correctAnswersCount,
      wrongAnswersCount: wrongAnswersCount ?? this.wrongAnswersCount,
      isLessonFinished: isLessonFinished ?? this.isLessonFinished,
    );
  }
}

final quizProvider = StateNotifierProvider.family<QuizNotifier, QuizState, Lesson>((ref, lesson) {
  return QuizNotifier(ref, lesson);
});

class QuizNotifier extends StateNotifier<QuizState> {
  final Ref _ref;

  QuizNotifier(this._ref, Lesson lesson) : super(QuizState(lesson: prepareSessionLesson(lesson)));

  static Lesson prepareSessionLesson(Lesson rawLesson) {
    if (rawLesson.questions.length <= 10) {
      return rawLesson;
    }

    // Varsa 1 adet hap bilgi/kural kartı ekle
    final conceptCards = rawLesson.questions
        .where((q) => q.type == QuestionType.conceptCard)
        .toList();
    final practicalQuestions = rawLesson.questions
        .where((q) => q.type != QuestionType.conceptCard)
        .toList()
      ..shuffle();

    final sessionQuestions = <Question>[];
    if (conceptCards.isNotEmpty) {
      sessionQuestions.add(conceptCards.first);
    }

    final needed = 10 - sessionQuestions.length;
    sessionQuestions.addAll(practicalQuestions.take(needed));

    return rawLesson.copyWith(questions: sessionQuestions);
  }

  void selectOption(int index) {
    if (state.isAnswerChecked) return;
    state = state.copyWith(selectedOptionIndex: index);
  }

  void selectBlank(String word) {
    if (state.isAnswerChecked) return;
    state = state.copyWith(selectedBlankAnswer: word);
  }

  void selectTrueFalse(bool value) {
    if (state.isAnswerChecked) return;
    state = state.copyWith(selectedTrueFalse: value);
  }

  void clickMatchingLeft(String left) {
    if (state.isAnswerChecked) return;
    if (state.selectedPairs.containsKey(left)) return;
    state = state.copyWith(activePairLeft: left);
  }

  void clickMatchingRight(String right) {
    if (state.isAnswerChecked) return;
    final left = state.activePairLeft;
    if (left == null) return;

    final newPairs = Map<String, String>.from(state.selectedPairs)..[left] = right;
    state = state.copyWith(
      selectedPairs: newPairs,
      clearActivePair: true,
    );
  }

  void resetMatchingPairs() {
    if (state.isAnswerChecked) return;
    state = state.copyWith(selectedPairs: {}, clearActivePair: true);
  }

  void checkAnswer() {
    if (state.isAnswerChecked) return;
    final q = state.currentQuestion;
    bool correct = false;

    switch (q.type) {
      case QuestionType.conceptCard:
        correct = true;
        break;
      case QuestionType.multipleChoice:
      case QuestionType.codeOutput:
        correct = state.selectedOptionIndex == q.correctIndex;
        break;
      case QuestionType.fillInTheBlank:
        correct = state.selectedBlankAnswer == q.correctBlankAnswer;
        break;
      case QuestionType.trueFalse:
        correct = state.selectedTrueFalse == q.isTrue;
        break;
      case QuestionType.matching:
        correct = true;
        for (final pair in q.matchingPairs ?? []) {
          if (state.selectedPairs[pair.left] != pair.right) {
            correct = false;
            break;
          }
        }
        break;
    }

    if (!correct) {
      _ref.read(userProfileProvider.notifier).loseHeart();
    }

    state = state.copyWith(
      isAnswerChecked: true,
      isCorrect: correct,
      correctAnswersCount: correct ? state.correctAnswersCount + 1 : state.correctAnswersCount,
      wrongAnswersCount: !correct ? state.wrongAnswersCount + 1 : state.wrongAnswersCount,
    );
  }

  /// Otomatik doğru cevabı işaretler ve kontrol eder (Hile Modu)
  void autoSolve() {
    if (state.isAnswerChecked) return;
    final q = state.currentQuestion;
    switch (q.type) {
      case QuestionType.conceptCard:
        checkAnswer();
        break;
      case QuestionType.multipleChoice:
      case QuestionType.codeOutput:
        if (q.correctIndex != null) {
          selectOption(q.correctIndex!);
          checkAnswer();
        }
        break;
      case QuestionType.fillInTheBlank:
        if (q.correctBlankAnswer != null) {
          selectBlank(q.correctBlankAnswer!);
          checkAnswer();
        }
        break;
      case QuestionType.trueFalse:
        if (q.isTrue != null) {
          selectTrueFalse(q.isTrue!);
          checkAnswer();
        }
        break;
      case QuestionType.matching:
        if (q.matchingPairs != null) {
          final pairs = <String, String>{};
          for (final pair in q.matchingPairs!) {
            pairs[pair.left] = pair.right;
          }
          state = state.copyWith(selectedPairs: pairs, clearActivePair: true);
          checkAnswer();
        }
        break;
    }
  }

  /// Soruyu geçer — yanlış sayılır, can düşer, sonraki soruya geçer
  void skipQuestion() {
    if (state.isAnswerChecked) return;
    // Can düş
    _ref.read(userProfileProvider.notifier).loseHeart();
    // Yanlış sayısı artar
    final nextIndex = state.currentQuestionIndex + 1;
    if (nextIndex >= state.totalQuestions) {
      final total = state.totalQuestions;
      final correct = state.correctAnswersCount;
      final score = total > 0 ? (correct / total) * 100 : 0.0;
      _ref.read(userProfileProvider.notifier).completeLesson(
        lessonId: state.lesson.id,
        xpEarned: state.lesson.xpReward,
        gemsEarned: state.lesson.gemReward,
        score: score,
      );
      state = state.copyWith(
        wrongAnswersCount: state.wrongAnswersCount + 1,
        isLessonFinished: true,
      );
    } else {
      state = state.copyWith(
        currentQuestionIndex: nextIndex,
        wrongAnswersCount: state.wrongAnswersCount + 1,
        clearSelectedOption: true,
        clearSelectedBlank: true,
        clearTrueFalse: true,
        selectedPairs: {},
        clearActivePair: true,
        isAnswerChecked: false,
        isCorrect: false,
      );
    }
  }

  void nextQuestion() {
    final nextIndex = state.currentQuestionIndex + 1;
    if (nextIndex >= state.totalQuestions) {
      // Ders tamamlandı!
      final total = state.totalQuestions;
      final correct = state.correctAnswersCount;
      final score = total > 0 ? (correct / total) * 100 : 100.0;

      _ref.read(userProfileProvider.notifier).completeLesson(
        lessonId: state.lesson.id,
        xpEarned: state.lesson.xpReward,
        gemsEarned: state.lesson.gemReward,
        score: score,
      );

      state = state.copyWith(isLessonFinished: true);
    } else {
      state = state.copyWith(
        currentQuestionIndex: nextIndex,
        clearSelectedOption: true,
        clearSelectedBlank: true,
        clearTrueFalse: true,
        selectedPairs: {},
        clearActivePair: true,
        isAnswerChecked: false,
        isCorrect: false,
      );
    }
  }
}
