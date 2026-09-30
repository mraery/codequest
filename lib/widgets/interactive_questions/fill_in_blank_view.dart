import 'package:flutter/material.dart';
import '../../models/curriculum_models.dart';
import '../syntax_code_view.dart';

class FillInBlankView extends StatelessWidget {
  final Question question;
  final String? selectedBlank;
  final bool isAnswerChecked;
  final ValueChanged<String> onSelect;

  const FillInBlankView({
    super.key,
    required this.question,
    required this.selectedBlank,
    required this.isAnswerChecked,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    final blankOptions = question.blankOptions ?? [];
    final codeWithBlank = question.codeSnippet?.replaceAll(
          '___',
          selectedBlank != null ? '[ $selectedBlank ]' : '[  ?  ]',
        ) ??
        '';

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            question.prompt,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              height: 1.35,
            ),
          ),
          const SizedBox(height: 14),

          // Code Preview with dynamic slot
          SyntaxCodeView(
            code: codeWithBlank,
            showLineNumbers: true,
          ),

          const SizedBox(height: 20),
          const Text(
            'Eksik koda yerleştirmek için bir anahtar kelime seç:',
            style: TextStyle(color: Color(0xFF94A3B8), fontSize: 13, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 12),

          // Chips Pool
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: blankOptions.map((token) {
              final isSelected = selectedBlank == token;
              final isCorrect = token == question.correctBlankAnswer;

              Color bg = const Color(0xFF1E293B);
              Color border = const Color(0xFF334155);
              Color text = Colors.white;

              if (isAnswerChecked) {
                if (isCorrect) {
                  bg = const Color(0xFF065F46);
                  border = const Color(0xFF10B981);
                } else if (isSelected) {
                  bg = const Color(0xFF881337);
                  border = const Color(0xFFEF4444);
                }
              } else if (isSelected) {
                bg = const Color(0xFF2563EB);
                border = const Color(0xFF60A5FA);
              }

              return InkWell(
                onTap: isAnswerChecked ? null : () => onSelect(token),
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                  decoration: BoxDecoration(
                    color: bg,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: border, width: 2),
                  ),
                  child: Text(
                    token,
                    style: TextStyle(
                      color: text,
                      fontFamily: 'monospace',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
