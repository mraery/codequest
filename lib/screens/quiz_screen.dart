import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/curriculum_models.dart';
import '../providers/game_provider.dart';
import '../providers/quiz_provider.dart';
import '../widgets/duo_button.dart';
import '../widgets/interactive_questions/concept_card_view.dart';
import '../widgets/interactive_questions/multiple_choice_view.dart';
import '../widgets/interactive_questions/fill_in_blank_view.dart';
import '../widgets/interactive_questions/matching_code_pairs_view.dart';
import '../widgets/interactive_questions/syntax_check_view.dart';
import 'lesson_complete_screen.dart';

class QuizScreen extends ConsumerWidget {
  final Lesson lesson;

  const QuizScreen({super.key, required this.lesson});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizState = ref.watch(quizProvider(lesson));
    final quizNotifier = ref.read(quizProvider(lesson).notifier);
    final userProfile = ref.watch(userProfileProvider);

    // Ders bittiğinde yönlendirme
    ref.listen<QuizState>(quizProvider(lesson), (prev, next) {
      if (next.isLessonFinished && !(prev?.isLessonFinished ?? false)) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => LessonCompleteScreen(
              lesson: lesson,
              earnedXp: lesson.xpReward,
              earnedGems: lesson.gemReward,
              score: (next.correctAnswersCount / next.totalQuestions) * 100,
            ),
          ),
        );
      }
    });

    final currentQ = quizState.currentQuestion;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        _showExitConfirmation(context);
      },
      child: Scaffold(
        backgroundColor: const Color(0xFF0F172A),
        appBar: AppBar(
          backgroundColor: const Color(0xFF0F172A),
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.close_rounded, color: Colors.white70),
            onPressed: () => _showExitConfirmation(context),
          ),
          title: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: quizState.progress,
              minHeight: 10,
              backgroundColor: const Color(0xFF334155),
              valueColor: ColorTween(
                begin: const Color(0xFF3B82F6),
                end: const Color(0xFF10B981),
              ).animate(AlwaysStoppedAnimation(quizState.progress)),
            ),
          ),
          actions: [
            // Soru Sayacı (örn. 3 / 10)
            Padding(
              padding: const EdgeInsets.only(right: 4),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E293B),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFF334155)),
                ),
                child: Text(
                  '${quizState.currentQuestionIndex + 1} / ${quizState.totalQuestions}',
                  style: const TextStyle(
                    color: Color(0xFF94A3B8),
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16, left: 4),
              child: Row(
                children: [
                  const Text('❤️', style: TextStyle(fontSize: 16)),
                  const SizedBox(width: 4),
                  Text(
                    userProfile.isPremium ? '∞' : '${userProfile.hearts}',
                    style: const TextStyle(
                      color: Color(0xFFEF4444),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: _buildQuestionContent(currentQ, quizState, quizNotifier),
                ),
              ),

              // Bottom Sheet Feedback / Button
              _buildBottomBar(context, quizState, quizNotifier, userProfile, ref),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuestionContent(
    Question q,
    QuizState state,
    QuizNotifier notifier,
  ) {
    switch (q.type) {
      case QuestionType.conceptCard:
        return ConceptCardView(question: q);
      case QuestionType.multipleChoice:
      case QuestionType.codeOutput:
        return MultipleChoiceView(
          question: q,
          selectedIndex: state.selectedOptionIndex,
          isAnswerChecked: state.isAnswerChecked,
          onSelect: notifier.selectOption,
        );
      case QuestionType.fillInTheBlank:
        return FillInBlankView(
          question: q,
          selectedBlank: state.selectedBlankAnswer,
          isAnswerChecked: state.isAnswerChecked,
          onSelect: notifier.selectBlank,
        );
      case QuestionType.matching:
        return MatchingCodePairsView(
          question: q,
          selectedPairs: state.selectedPairs,
          activeLeft: state.activePairLeft,
          isAnswerChecked: state.isAnswerChecked,
          onLeftClick: notifier.clickMatchingLeft,
          onRightClick: notifier.clickMatchingRight,
          onReset: notifier.resetMatchingPairs,
        );
      case QuestionType.trueFalse:
        return SyntaxCheckView(
          question: q,
          selectedTrueFalse: state.selectedTrueFalse,
          isAnswerChecked: state.isAnswerChecked,
          onSelect: notifier.selectTrueFalse,
        );
    }
  }

  Widget _buildBottomBar(
    BuildContext context,
    QuizState state,
    QuizNotifier notifier,
    UserProfile userProfile,
    WidgetRef ref,
  ) {
    if (state.isAnswerChecked) {
      final isCorrect = state.isCorrect;
      final q = state.currentQuestion;

      return Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: isCorrect ? const Color(0xFF064E3B) : const Color(0xFF881337),
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
          border: Border(
            top: BorderSide(
              color: isCorrect ? const Color(0xFF10B981) : const Color(0xFFEF4444),
              width: 2,
            ),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Icon(
                  isCorrect ? Icons.check_circle_rounded : Icons.cancel_rounded,
                  color: isCorrect ? const Color(0xFF34D399) : const Color(0xFFFDA4AF),
                  size: 28,
                ),
                const SizedBox(width: 10),
                Text(
                  isCorrect ? 'Harika Çözüm! 🎯' : 'Hata Tespit Edildi!',
                  style: TextStyle(
                    color: isCorrect ? const Color(0xFF34D399) : const Color(0xFFFDA4AF),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            if (q.explanation.isNotEmpty) ...[
              const SizedBox(height: 8),
              Text(
                q.explanation,
                style: const TextStyle(
                  color: Color(0xFFE2E8F0),
                  fontSize: 13.5,
                  height: 1.35,
                ),
              ),
            ],
            const SizedBox(height: 16),
            DuoButton(
              text: 'DEVAM ET',
              backgroundColor: isCorrect ? const Color(0xFF10B981) : const Color(0xFFEF4444),
              shadowColor: isCorrect ? const Color(0xFF059669) : const Color(0xFFB91C1C),
              onPressed: () {
                if (!isCorrect && userProfile.hearts <= 0 && !userProfile.isPremium) {
                  _showOutOfHeartsDialog(context, ref);
                } else {
                  notifier.nextQuestion();
                }
              },
            ),
          ],
        ),
      );
    }

    // Cevap Henüz Kontrol Edilmedi
    final bool isConceptCard = state.currentQuestion.type == QuestionType.conceptCard;
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Color(0xFF0F172A),
        border: Border(
          top: BorderSide(color: Color(0xFF334155), width: 1),
        ),
      ),
      child: isConceptCard
          ? DuoButton(
              text: 'DEVAM ET',
              backgroundColor: const Color(0xFF10B981),
              shadowColor: const Color(0xFF059669),
              onPressed: notifier.checkAnswer,
            )
          : Row(
              children: [
                if (userProfile.isCheatUnlocked) ...[
                  // OTO-ÇÖZ HİLE BUTONU (Sadece kagan promosyon koduyla aktif olur!)
                  Expanded(
                    flex: 2,
                    child: GestureDetector(
                      onTap: () {
                        notifier.autoSolve();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('⚡ [Kagan Hilesi] Doğru cevap otomatik çözüldü!'),
                            duration: Duration(seconds: 1),
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Color(0xFF7C3AED),
                          ),
                        );
                      },
                      child: Container(
                        height: 54,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFF7C3AED), Color(0xFF9333EA)],
                          ),
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: Colors.amber, width: 1.5),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF7C3AED).withValues(alpha: 0.4),
                              blurRadius: 8,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: const Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.bolt_rounded, color: Colors.amber, size: 18),
                              SizedBox(width: 4),
                              Text(
                                'OTO-ÇÖZ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 12.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                ],
                // GEÇ Butonu
                Expanded(
                  flex: 2,
                  child: GestureDetector(
                    onTap: () => _showSkipConfirmation(context, notifier, ref),
                    child: Container(
                      height: 54,
                      decoration: BoxDecoration(
                        color: const Color(0xFF1E293B),
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: const Color(0xFF475569), width: 1.5),
                      ),
                      child: const Center(
                        child: Text(
                          'GEÇ ⏭',
                          style: TextStyle(
                            color: Color(0xFF94A3B8),
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                // KONTROL ET Butonu
                Expanded(
                  flex: 4,
                  child: DuoButton(
                    text: 'KONTROL ET',
                    backgroundColor: const Color(0xFF10B981),
                    shadowColor: const Color(0xFF059669),
                    onPressed: state.canCheckAnswer ? notifier.checkAnswer : null,
                  ),
                ),
              ],
            ),
    );
  }

  void _showSkipConfirmation(BuildContext context, QuizNotifier notifier, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: const Color(0xFF1E293B),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Row(
          children: [
            Text('⏭️ Soruyu Geç?', style: TextStyle(color: Colors.white, fontSize: 18)),
          ],
        ),
        content: const Text(
          'Bu soruyu geçersen yanlış sayılır ve bir can kaybedersin. Yine de geçmek istiyor musun?',
          style: TextStyle(color: Color(0xFF94A3B8), fontSize: 14),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('İptal', style: TextStyle(color: Color(0xFF94A3B8))),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFF59E0B),
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(ctx);
              notifier.skipQuestion();
            },
            child: const Text('Geç ⏭'),
          ),
        ],
      ),
    );
  }

  void _showExitConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF1E293B),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text('Dersten Çıkılsın mı?', style: TextStyle(color: Colors.white)),
        content: const Text(
          'Şimdi çıkarsan bu dersteki ilerlemen ve kazanacağın puanlar kaybolur.',
          style: TextStyle(color: Color(0xFF94A3B8)),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Devam Et', style: TextStyle(color: Color(0xFF10B981))),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: const Text('Çık', style: TextStyle(color: Color(0xFFEF4444))),
          ),
        ],
      ),
    );
  }

  void _showOutOfHeartsDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF1E293B),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Row(
          children: [
            Text('💔 Canların Bitti!', style: TextStyle(color: Colors.white, fontSize: 18)),
          ],
        ),
        content: const Text(
          'Tüm canlarını tükettin. 50 Elmas 💎 harcayarak canlarını yenileyebilir veya pratik moduna geçebilirsin.',
          style: TextStyle(color: Color(0xFF94A3B8), fontSize: 14),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Dialog
              Navigator.pop(context); // Quiz Screen
            },
            child: const Text('Ana Sayfaya Dön', style: TextStyle(color: Color(0xFF94A3B8))),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFEF4444),
            ),
            onPressed: () {
              ref.read(userProfileProvider.notifier).refillHearts(cost: 50);
              Navigator.pop(context);
            },
            child: const Text('50 💎 ile Doldur', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
