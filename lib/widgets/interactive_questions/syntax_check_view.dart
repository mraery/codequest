import 'package:flutter/material.dart';
import '../../models/curriculum_models.dart';
import '../syntax_code_view.dart';

class SyntaxCheckView extends StatelessWidget {
  final Question question;
  final bool? selectedTrueFalse;
  final bool isAnswerChecked;
  final ValueChanged<bool> onSelect;

  const SyntaxCheckView({
    super.key,
    required this.question,
    required this.selectedTrueFalse,
    required this.isAnswerChecked,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.amber.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text('🔍', style: TextStyle(fontSize: 20)),
              ),
              const SizedBox(width: 10),
              const Text(
                'HATA DEDEKTİFİ',
                style: TextStyle(
                  color: Colors.amber,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            question.prompt,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.bold,
              height: 1.35,
            ),
          ),
          const SizedBox(height: 12),

          if (question.codeSnippet != null)
            SyntaxCodeView(
              code: question.codeSnippet!,
              showLineNumbers: true,
            ),

          const SizedBox(height: 20),

          // True Card (✅ Evet, Hatasız Çalışır)
          _buildOptionCard(
            label: '✅ Evet / Doğru (Hatasız Çalışır)',
            value: true,
          ),
          const SizedBox(height: 12),

          // False Card (❌ Hayır, Hata / Bug Var)
          _buildOptionCard(
            label: '❌ Hayır / Yanlış (Hata Verir)',
            value: false,
          ),
        ],
      ),
    );
  }

  Widget _buildOptionCard({required String label, required bool value}) {
    final isSelected = selectedTrueFalse == value;
    final isCorrect = value == question.isTrue;

    Color bg = const Color(0xFF1E293B);
    Color border = const Color(0xFF334155);

    if (isAnswerChecked) {
      if (isCorrect) {
        bg = const Color(0xFF065F46);
        border = const Color(0xFF10B981);
      } else if (isSelected) {
        bg = const Color(0xFF881337);
        border = const Color(0xFFEF4444);
      }
    } else if (isSelected) {
      bg = const Color(0xFF1E3A8A);
      border = const Color(0xFF3B82F6);
    }

    return InkWell(
      onTap: isAnswerChecked ? null : () => onSelect(value),
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: border, width: 2),
        ),
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
