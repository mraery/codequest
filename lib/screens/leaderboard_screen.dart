import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/game_provider.dart';
import '../widgets/stats_bar.dart';

class LeaderboardScreen extends ConsumerWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(userProfileProvider);

    final mockLeaders = [
      {'rank': 1, 'name': 'Emre Coder', 'lang': '🐍 Python', 'xp': 1420, 'avatar': '👨‍💻'},
      {'rank': 2, 'name': 'Zeynep Android', 'lang': '📱 Kotlin', 'xp': 1280, 'avatar': '👩‍💻'},
      {'rank': 3, 'name': 'Burak .NET', 'lang': '⚙️ C#', 'xp': 1150, 'avatar': '🚀'},
      {'rank': 4, 'name': 'Sen (Geliştirici)', 'lang': '🔥 Karışık', 'xp': profile.xp, 'avatar': '🤖', 'isYou': true},
      {'rank': 5, 'name': 'Defne Algo', 'lang': '🐍 Python', 'xp': 640, 'avatar': '⚡'},
      {'rank': 6, 'name': 'Caner Mobile', 'lang': '📱 Kotlin', 'xp': 590, 'avatar': '🎯'},
      {'rank': 7, 'name': 'Ece Backend', 'lang': '⚙️ C#', 'xp': 480, 'avatar': '💡'},
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF0B1120),
      appBar: const StatsBar(),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // League Banner
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFFF59E0B), Color(0xFFD97706)],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Row(
              children: [
                Text('🏆', style: TextStyle(fontSize: 40)),
                SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ALTIN YAZILIMCI LİGİ',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          letterSpacing: 0.5,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'İlk 3 sıradaki yazılımcılar Elmas Ligi\'ne terfi eder! Kalan süre: 2 gün.',
                        style: TextStyle(color: Colors.white70, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Leaderboard list
          ...mockLeaders.map((leader) {
            final isYou = leader['isYou'] == true;
            final rank = leader['rank'] as int;

            Color rankColor = const Color(0xFF94A3B8);
            if (rank == 1) rankColor = Colors.amber;
            if (rank == 2) rankColor = const Color(0xFFE2E8F0);
            if (rank == 3) rankColor = const Color(0xFFF97316);

            return Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                color: isYou ? const Color(0xFF1E3A8A).withValues(alpha: 0.5) : const Color(0xFF0F172A),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: isYou ? const Color(0xFF3B82F6) : const Color(0xFF1E293B),
                  width: isYou ? 2 : 1,
                ),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 28,
                    child: Text(
                      '#$rank',
                      style: TextStyle(
                        color: rankColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(leader['avatar'] as String, style: const TextStyle(fontSize: 24)),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          leader['name'] as String,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: isYou ? FontWeight.bold : FontWeight.w500,
                          ),
                        ),
                        Text(
                          leader['lang'] as String,
                          style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 11),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    '${leader['xp']} XP',
                    style: TextStyle(
                      color: isYou ? const Color(0xFF60A5FA) : const Color(0xFFF59E0B),
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
