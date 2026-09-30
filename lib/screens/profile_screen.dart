import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/game_provider.dart';
import '../widgets/stats_bar.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(userProfileProvider);
    final achievements = ref.watch(achievementsProvider);

    return Scaffold(
      backgroundColor: const Color(0xFF0B1120),
      appBar: const StatsBar(),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // User Avatar & Title
          Center(
            child: Column(
              children: [
                Container(
                  width: 86,
                  height: 86,
                  decoration: BoxDecoration(
                    color: const Color(0xFF3B82F6).withValues(alpha: 0.2),
                    shape: BoxShape.circle,
                    border: Border.all(color: const Color(0xFF3B82F6), width: 3),
                  ),
                  child: const Center(
                    child: Text('👨‍💻', style: TextStyle(fontSize: 44)),
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'CodeQuest Geliştiricisi',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Kıdem: Junior -> Senior Yolunda',
                  style: TextStyle(color: Color(0xFF94A3B8), fontSize: 13),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Stats Grid
          Row(
            children: [
              Expanded(
                child: _buildStatTile('🔥 Günlük Seri', '${profile.streak} Gün', const Color(0xFFF97316)),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatTile('⭐ Toplam XP', '${profile.xp} Puan', const Color(0xFFF59E0B)),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _buildStatTile('💎 Elmaslar', '${profile.gems}', const Color(0xFF06B6D4)),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatTile('✅ Tamamlanan', '${profile.completedLessonIds.length} Ders', const Color(0xFF10B981)),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Language Masteries
          const Text(
            'Dil İlerleme Durumu',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          _buildLanguageProgress(
            name: 'Python 🐍',
            color: const Color(0xFF3B82F6),
            completed: profile.completedLessonIds.where((id) => id.startsWith('py_')).length,
            total: 6,
          ),
          const SizedBox(height: 10),
          _buildLanguageProgress(
            name: 'Kotlin 📱',
            color: const Color(0xFF8B5CF6),
            completed: profile.completedLessonIds.where((id) => id.startsWith('kt_')).length,
            total: 4,
          ),
          const SizedBox(height: 10),
          _buildLanguageProgress(
            name: 'C# ⚙️',
            color: const Color(0xFF6366F1),
            completed: profile.completedLessonIds.where((id) => id.startsWith('cs_')).length,
            total: 5,
          ),

          const SizedBox(height: 28),

          // Achievements List
          const Text(
            'Başarımlar & Rozetler',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          ...achievements.map((ach) {
            return Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: const Color(0xFF0F172A),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: ach.isUnlocked ? const Color(0xFF10B981) : const Color(0xFF1E293B),
                ),
              ),
              child: Row(
                children: [
                  Text(ach.iconEmoji, style: const TextStyle(fontSize: 30)),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ach.title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          ach.desc,
                          style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 12),
                        ),
                        const SizedBox(height: 6),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: LinearProgressIndicator(
                            value: ach.progressRatio,
                            minHeight: 6,
                            backgroundColor: const Color(0xFF334155),
                            valueColor: const AlwaysStoppedAnimation(Color(0xFF10B981)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  if (ach.isClaimed)
                    const Text('Alındı ✅', style: TextStyle(color: Color(0xFF10B981), fontSize: 12))
                  else if (ach.isUnlocked)
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF10B981),
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      ),
                      onPressed: () {
                        ref.read(userProfileProvider.notifier).claimAchievement(
                              ach.id,
                              ach.gemReward,
                              ach.xpReward,
                            );
                      },
                      child: Text('+${ach.gemReward} 💎', style: const TextStyle(fontSize: 12)),
                    )
                  else
                    Text(
                      '${ach.currentProgress}/${ach.maxProgress}',
                      style: const TextStyle(color: Color(0xFF64748B), fontSize: 12),
                    ),
                ],
              ),
            );
          }),
          const SizedBox(height: 24),
          // App Info & Icon Card
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF0F172A),
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: const Color(0xFF1E293B)),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Image.asset(
                    'assets/images/app_icon.png',
                    width: 56,
                    height: 56,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 14),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'CodeQuest',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 3),
                      Text(
                        'v1.0.0 Pro • 10 Patika • 11.520 Soru',
                        style: TextStyle(
                          color: Color(0xFF94A3B8),
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'Yazılımcılar için interaktif kodlama macerası',
                        style: TextStyle(
                          color: Color(0xFF64748B),
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildStatTile(String label, String value, Color color) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF0F172A),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF1E293B)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 12)),
          const SizedBox(height: 6),
          Text(
            value,
            style: TextStyle(
              color: color,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLanguageProgress({
    required String name,
    required Color color,
    required int completed,
    required int total,
  }) {
    final ratio = total > 0 ? (completed / total).clamp(0.0, 1.0) : 0.0;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF0F172A),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFF1E293B)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(name, style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold)),
              Text('$completed / $total Ders (%${(ratio * 100).toInt()})', style: TextStyle(color: color, fontSize: 12)),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: LinearProgressIndicator(
              value: ratio,
              minHeight: 8,
              backgroundColor: const Color(0xFF334155),
              valueColor: AlwaysStoppedAnimation(color),
            ),
          ),
        ],
      ),
    );
  }
}
