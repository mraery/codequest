import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/curriculum_models.dart';
import '../providers/track_provider.dart';
import '../widgets/stats_bar.dart';
import '../widgets/cheat_sheet_sheet.dart';
import 'quiz_screen.dart';

class PracticeScreen extends ConsumerWidget {
  const PracticeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allUnits = ref.watch(currentUnitsProvider);
    final track = ref.watch(currentTrackConfigProvider);
    final stats = ref.watch(totalQuestionsStatsProvider);

    return Scaffold(
      backgroundColor: const Color(0xFF0B1120),
      appBar: const StatsBar(),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Mega Question Bank Stats Banner
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  track.primaryColor.withValues(alpha: 0.25),
                  const Color(0xFF1E293B),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: track.primaryColor.withValues(alpha: 0.5), width: 1.5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(track.mascotEmoji, style: const TextStyle(fontSize: 24)),
                        const SizedBox(width: 8),
                        Text(
                          '${track.shortTitle} Soru Bankası',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color(0xFF10B981).withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: const Color(0xFF10B981)),
                      ),
                      child: Text(
                        '${stats['totalQuestions']}+ TOPLAM SORU',
                        style: const TextStyle(
                          color: Color(0xFF10B981),
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    _buildStatPill('10', 'Yazılım Alanı'),
                    const SizedBox(width: 8),
                    _buildStatPill('540', '${track.shortTitle} Sorusu'),
                    const SizedBox(width: 8),
                    _buildStatPill('30', 'Kapsamlı Ders'),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          const Text(
            'Antrenman & Tekrar Modları',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Hatalarını temizle, rastgele sprint yap veya soru havuzunda gezin!',
            style: TextStyle(color: Color(0xFF94A3B8), fontSize: 13),
          ),
          const SizedBox(height: 16),

          // 1. Rastgele 10 Soruluk Mega Sprint
          _buildPracticeCard(
            icon: '⚡',
            title: '${track.shortTitle} Rastgele 10 Soruluk Sprint',
            description: '540 soru arasından rastgele 10 soru ile kendini sına!',
            badgeText: 'HIZLI TEST',
            badgeColor: const Color(0xFFF59E0B),
            onTap: () {
              final randomLesson = _generateRandomSprintLesson(allUnits, track.shortTitle);
              if (randomLesson != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => QuizScreen(lesson: randomLesson),
                  ),
                );
              }
            },
          ),
          const SizedBox(height: 14),

          // 2. Can Kazanma Alıştırması
          _buildPracticeCard(
            icon: '❤️',
            title: 'Can Kazanma Alıştırması',
            description: 'Hızlı alıştırma yaparak anında ücretsiz 1 can kazan.',
            badgeText: 'CAN YENİLEME',
            badgeColor: const Color(0xFFEF4444),
            onTap: () {
              if (allUnits.isNotEmpty && allUnits.first.lessons.isNotEmpty) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => QuizScreen(lesson: allUnits.first.lessons.first),
                  ),
                );
              }
            },
          ),
          const SizedBox(height: 14),

          // 3. Soru Havuzu Gezgini
          _buildPracticeCard(
            icon: '🔍',
            title: '${track.shortTitle} Soru Havuzu Gezgini',
            description: 'Tüm soruları, çözümleri ve mülakat açıklamalarını incele.',
            badgeText: '540 SORU GEZGİNİ',
            badgeColor: const Color(0xFF06B6D4),
            onTap: () {
              _showQuestionBankExplorer(context, allUnits, track.title);
            },
          ),
          const SizedBox(height: 14),

          // 4. Hile Kağıtları Kütüphanesi
          _buildPracticeCard(
            icon: '📚',
            title: '${track.shortTitle} Sözdizimi & Hile Kağıtları',
            description: 'Tüm ünitelerin hile kağıtlarını ve özet formüllerini incele.',
            badgeText: 'KOD REHBERİ',
            badgeColor: const Color(0xFF8B5CF6),
            onTap: () {
              if (allUnits.isNotEmpty) {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (_) => CheatSheetSheet(unit: allUnits.first),
                );
              }
            },
          ),
          const SizedBox(height: 80),
        ],
      ),
    );
  }

  Lesson? _generateRandomSprintLesson(List<LearningUnit> units, String trackName) {
    if (units.isEmpty) return null;
    final allQuestions = <Question>[];
    for (final u in units) {
      for (final l in u.lessons) {
        allQuestions.addAll(l.questions);
      }
    }
    if (allQuestions.isEmpty) return null;

    final rand = Random();
    allQuestions.shuffle(rand);
    final selectedQuestions = allQuestions.take(10).toList();

    return Lesson(
      id: 'sprint_${DateTime.now().millisecondsSinceEpoch}',
      title: '$trackName 10-Soru Hızlı Sprint',
      description: 'Havuzdan rastgele seçilmiş karma sorular',
      xpReward: 60,
      gemReward: 20,
      questions: selectedQuestions,
    );
  }

  void _showQuestionBankExplorer(
    BuildContext context,
    List<LearningUnit> units,
    String trackTitle,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: const Color(0xFF0F172A),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        final allQuestions = <Question>[];
        for (final u in units) {
          for (final l in u.lessons) {
            allQuestions.addAll(l.questions);
          }
        }

        return SafeArea(
          child: Container(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.85,
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: const Color(0xFF475569),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  '🔍 $trackTitle Soru Havuzu',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Toplam ${allQuestions.length} soru arasından rastgele örnekleri inceleyin.',
                  style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 13),
                ),
                const SizedBox(height: 14),
                Expanded(
                  child: ListView.builder(
                    itemCount: min(50, allQuestions.length),
                    itemBuilder: (context, index) {
                      final q = allQuestions[index];
                      return Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1E293B),
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: const Color(0xFF334155)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF3B82F6).withValues(alpha: 0.2),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Text(
                                    'Soru #${index + 1}',
                                    style: const TextStyle(
                                      color: Color(0xFF38BDF8),
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  q.type.name,
                                  style: const TextStyle(color: Color(0xFF64748B), fontSize: 11),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              q.prompt.isNotEmpty ? q.prompt : (q.conceptTitle ?? 'Konu Kartı'),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 13.5,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            if (q.explanation.isNotEmpty) ...[
                              const SizedBox(height: 6),
                              Text(
                                '💡 Açıklama: ${q.explanation}',
                                style: const TextStyle(
                                  color: Color(0xFF10B981),
                                  fontSize: 12,
                                  height: 1.3,
                                ),
                              ),
                            ],
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildStatPill(String value, String label) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: const Color(0xFF0F172A).withValues(alpha: 0.6),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color(0xFF334155)),
        ),
        child: Column(
          children: [
            Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              label,
              style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPracticeCard({
    required String icon,
    required String title,
    required String description,
    required String badgeText,
    required Color badgeColor,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: const Color(0xFF0F172A),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xFF1E293B), width: 1.5),
        ),
        child: Row(
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: badgeColor.withValues(alpha: 0.15),
                shape: BoxShape.circle,
                border: Border.all(color: badgeColor.withValues(alpha: 0.4)),
              ),
              child: Center(child: Text(icon, style: const TextStyle(fontSize: 26))),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: badgeColor.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      badgeText,
                      style: TextStyle(
                        color: badgeColor,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    description,
                    style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 12),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios_rounded, color: Color(0xFF475569), size: 16),
          ],
        ),
      ),
    );
  }
}
