import 'package:flutter/material.dart';
import '../../models/curriculum_models.dart';
import '../syntax_code_view.dart';

class MultipleChoiceView extends StatelessWidget {
  final Question question;
  final int? selectedIndex;
  final bool isAnswerChecked;
  final ValueChanged<int> onSelect;

  const MultipleChoiceView({
    super.key,
    required this.question,
    required this.selectedIndex,
    required this.isAnswerChecked,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    final options = question.options ?? [];

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Prompt
          Text(
            question.prompt,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              height: 1.35,
            ),
          ),
          const SizedBox(height: 12),

          // Optional Code Snippet
          if (question.codeSnippet != null)
            SyntaxCodeView(
              code: question.codeSnippet!,
              showLineNumbers: true,
            ),

          const SizedBox(height: 16),

          // Options List
          ...List.generate(options.length, (index) {
            final optionText = options[index];
            final isSelected = selectedIndex == index;
            final isCorrect = index == question.correctIndex;

            Color bgColor = const Color(0xFF1E293B);
            Color borderColor = const Color(0xFF334155);
            Color textColor = const Color(0xFFE2E8F0);

            if (isAnswerChecked) {
              if (isCorrect) {
                bgColor = const Color(0xFF065F46);
                borderColor = const Color(0xFF10B981);
                textColor = Colors.white;
              } else if (isSelected) {
                bgColor = const Color(0xFF881337);
                borderColor = const Color(0xFFEF4444);
                textColor = Colors.white;
              }
            } else if (isSelected) {
              bgColor = const Color(0xFF1E3A8A);
              borderColor = const Color(0xFF3B82F6);
              textColor = Colors.white;
            }

            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: InkWell(
                onTap: isAnswerChecked ? null : () => onSelect(index),
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: borderColor, width: 2),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: borderColor.withValues(alpha: 0.3),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            String.fromCharCode(65 + index), // A, B, C, D
                            style: TextStyle(
                              color: textColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Text(
                          optionText,
                          style: TextStyle(
                            color: textColor,
                            fontSize: 15,
                            fontFamily: optionText.contains('(') || optionText.contains(';') ? 'monospace' : null,
                            fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
