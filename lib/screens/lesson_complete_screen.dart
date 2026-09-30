import 'package:flutter/material.dart';
import '../models/curriculum_models.dart';
import '../widgets/duo_button.dart';

class LessonCompleteScreen extends StatelessWidget {
  final Lesson lesson;
  final int earnedXp;
  final int earnedGems;
  final double score;

  const LessonCompleteScreen({
    super.key,
    required this.lesson,
    required this.earnedXp,
    required this.earnedGems,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              // Trophy / Mascot
              Container(
                width: 110,
                height: 110,
                decoration: BoxDecoration(
                  color: Colors.amber.withValues(alpha: 0.15),
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.amber, width: 3),
                ),
                child: const Center(
                  child: Text('🏆', style: TextStyle(fontSize: 54)),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Ders Tamamlandı!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                lesson.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFF94A3B8),
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 32),

              // Stats Row
              Row(
                children: [
                  Expanded(
                    child: _buildRewardCard(
                      icon: '⭐',
                      value: '+$earnedXp',
                      label: 'XP KAZANDIN',
                      color: const Color(0xFFF59E0B),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildRewardCard(
                      icon: '🎯',
                      value: '%${score.toInt()}',
                      label: 'DOĞRULUK',
                      color: const Color(0xFF10B981),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildRewardCard(
                      icon: '💎',
                      value: '+$earnedGems',
                      label: 'ELMAS',
                      color: const Color(0xFF06B6D4),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Streak bump card
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E293B),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFF97316).withValues(alpha: 0.4)),
                ),
                child: const Row(
                  children: [
                    Text('🔥', style: TextStyle(fontSize: 28)),
                    SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Kodlama Serisi Korundu!',
                            style: TextStyle(
                              color: Color(0xFFF97316),
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            'Her gün en az 1 ders çözerek serini yükselt.',
                            style: TextStyle(color: Color(0xFF94A3B8), fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const Spacer(),

              DuoButton(
                text: 'DEVAM ET',
                backgroundColor: const Color(0xFF10B981),
                shadowColor: const Color(0xFF059669),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRewardCard({
    required String icon,
    required String value,
    required String label,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withValues(alpha: 0.3), width: 1.5),
      ),
      child: Column(
        children: [
          Text(icon, style: const TextStyle(fontSize: 24)),
          const SizedBox(height: 6),
          Text(
            value,
            style: TextStyle(
              color: color,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFF94A3B8),
              fontSize: 10,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}
