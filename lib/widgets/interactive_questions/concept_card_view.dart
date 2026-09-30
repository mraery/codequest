import 'package:flutter/material.dart';
import '../../models/curriculum_models.dart';
import '../syntax_code_view.dart';

class ConceptCardView extends StatelessWidget {
  final Question question;

  const ConceptCardView({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Title Badge
          Row(
            children: [
              Text(
                question.iconEmoji ?? '💡',
                style: const TextStyle(fontSize: 26),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  question.conceptTitle ?? 'Hap Kod Bilgisi',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Rule Card
          if (question.rule != null)
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF1E293B),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFF38BDF8).withValues(alpha: 0.3), width: 1.2),
              ),
              child: Text(
                question.rule!,
                style: const TextStyle(
                  color: Color(0xFFE2E8F0),
                  fontSize: 15,
                  height: 1.45,
                ),
              ),
            ),

          // Code Example
          if (question.codeExample != null) ...[
            const SizedBox(height: 14),
            SyntaxCodeView(
              code: question.codeExample!,
              showLineNumbers: true,
            ),
          ],

          // Senior Dev Tip
          if (question.devTip != null) ...[
            const SizedBox(height: 14),
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: const Color(0xFF064E3B).withValues(alpha: 0.6),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: const Color(0xFF10B981).withValues(alpha: 0.4)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('⚡', style: TextStyle(fontSize: 20)),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'SENIOR DEV İPUCU',
                          style: TextStyle(
                            color: Color(0xFF34D399),
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          question.devTip!,
                          style: const TextStyle(
                            color: Color(0xFFD1FAE5),
                            fontSize: 13,
                            height: 1.35,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
