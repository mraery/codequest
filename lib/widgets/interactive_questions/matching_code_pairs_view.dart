import 'package:flutter/material.dart';
import '../../models/curriculum_models.dart';

class MatchingCodePairsView extends StatelessWidget {
  final Question question;
  final Map<String, String> selectedPairs;
  final String? activeLeft;
  final bool isAnswerChecked;
  final ValueChanged<String> onLeftClick;
  final ValueChanged<String> onRightClick;
  final VoidCallback onReset;

  const MatchingCodePairsView({
    super.key,
    required this.question,
    required this.selectedPairs,
    required this.activeLeft,
    required this.isAnswerChecked,
    required this.onLeftClick,
    required this.onRightClick,
    required this.onReset,
  });

  @override
  Widget build(BuildContext context) {
    final pairs = question.matchingPairs ?? [];
    final leftItems = pairs.map((p) => p.left).toList();
    // Sağ sütunu sabit veya karıştırılmış gösterebiliriz
    final rightItems = pairs.map((p) => p.right).toList();

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  question.prompt,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              if (!isAnswerChecked && selectedPairs.isNotEmpty)
                TextButton.icon(
                  onPressed: onReset,
                  icon: const Icon(Icons.refresh_rounded, size: 16, color: Color(0xFF94A3B8)),
                  label: const Text('Sıfırla', style: TextStyle(color: Color(0xFF94A3B8), fontSize: 12)),
                ),
            ],
          ),
          const SizedBox(height: 16),

          // Two columns
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left Column (Code Tokens)
              Expanded(
                child: Column(
                  children: leftItems.map((left) {
                    final isPaired = selectedPairs.containsKey(left);
                    final isActive = activeLeft == left;

                    Color bg = const Color(0xFF1E293B);
                    Color border = const Color(0xFF334155);

                    if (isActive) {
                      bg = const Color(0xFF2563EB);
                      border = const Color(0xFF60A5FA);
                    } else if (isPaired) {
                      bg = const Color(0xFF0F766E).withValues(alpha: 0.4);
                      border = const Color(0xFF14B8A6);
                    }

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: InkWell(
                        onTap: isAnswerChecked ? null : () => onLeftClick(left),
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                          decoration: BoxDecoration(
                            color: bg,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: border, width: 2),
                          ),
                          child: Text(
                            left,
                            style: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'monospace',
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),

              const SizedBox(width: 12),

              // Right Column (Descriptions)
              Expanded(
                child: Column(
                  children: rightItems.map((right) {
                    final pairedLeft = selectedPairs.entries
                        .where((e) => e.value == right)
                        .map((e) => e.key)
                        .firstOrNull;

                    Color bg = const Color(0xFF1E293B);
                    Color border = const Color(0xFF334155);

                    if (pairedLeft != null) {
                      bg = const Color(0xFF0F766E).withValues(alpha: 0.4);
                      border = const Color(0xFF14B8A6);
                    }

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: InkWell(
                        onTap: isAnswerChecked ? null : () => onRightClick(right),
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                          decoration: BoxDecoration(
                            color: bg,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: border, width: 2),
                          ),
                          child: Text(
                            right,
                            style: const TextStyle(
                              color: Color(0xFFE2E8F0),
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
