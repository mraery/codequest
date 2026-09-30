import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/code_track_model.dart';
import '../providers/game_provider.dart';
import '../providers/track_provider.dart';

class StatsBar extends ConsumerWidget implements PreferredSizeWidget {
  const StatsBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(userProfileProvider);
    final currentTrack = ref.watch(currentTrackConfigProvider);

    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 6,
        left: 14,
        right: 14,
        bottom: 8,
      ),
      decoration: const BoxDecoration(
        color: Color(0xFF0F172A),
        border: Border(
          bottom: BorderSide(color: Color(0xFF334155), width: 1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Language Switcher Pill
          InkWell(
            onTap: () => _showTrackPickerModal(context, ref),
            borderRadius: BorderRadius.circular(16),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFF1E293B),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: currentTrack.primaryColor, width: 1.5),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    currentTrack.badgeText,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Icon(Icons.keyboard_arrow_down_rounded, color: Colors.white70, size: 18),
                ],
              ),
            ),
          ),

          // Stats Chips: Streak, Gems, Hearts
          Row(
            children: [
              // Streak 🔥
              _buildStatChip(
                icon: '🔥',
                count: '${profile.streak}',
                color: const Color(0xFFF97316),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('🔥 ${profile.streak} günlük seri! Her gün en az 1 ders tamamlayarak serini koru.'),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                },
              ),
              const SizedBox(width: 8),

              // Gems 💎
              _buildStatChip(
                icon: '💎',
                count: '${profile.gems}',
                color: const Color(0xFF06B6D4),
                onTap: () => _showHeartRefillDialog(context, ref),
              ),
              const SizedBox(width: 8),

              // Hearts ❤️
              _buildStatChip(
                icon: '❤️',
                count: profile.isPremium ? '∞' : '${profile.hearts}',
                color: const Color(0xFFEF4444),
                onTap: () => _showHeartRefillDialog(context, ref),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatChip({
    required String icon,
    required String count,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        decoration: BoxDecoration(
          color: const Color(0xFF1E293B),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: color.withValues(alpha: 0.3), width: 1),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(icon, style: const TextStyle(fontSize: 14)),
            const SizedBox(width: 4),
            Text(
              count,
              style: TextStyle(
                color: color,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showTrackPickerModal(BuildContext context, WidgetRef ref) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: const Color(0xFF0F172A),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        final currentLang = ref.watch(selectedTrackProvider);
        return SafeArea(
          child: Container(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.75,
            ),
            padding: const EdgeInsets.only(top: 16, left: 20, right: 20, bottom: 12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
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
                const Text(
                  'Öğrenilecek Yazılım Dilini Seç',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  '10 Farklı Alanda 5.400+ Soru seni bekliyor. İstediğin zaman geçiş yapabilirsin.',
                  style: TextStyle(color: Color(0xFF94A3B8), fontSize: 13),
                ),
                const SizedBox(height: 14),
                Expanded(
                  child: ListView.builder(
                    itemCount: CodeTrackConfig.allTracks.length,
                    itemBuilder: (context, index) {
                      final track = CodeTrackConfig.allTracks[index];
                      final isCurrent = currentLang == track.language;
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: InkWell(
                          onTap: () {
                            ref.read(selectedTrackProvider.notifier).state = track.language;
                            ref.read(selectedCategoryFilterProvider.notifier).state = 'Tümü';
                            Navigator.pop(context);
                          },
                          borderRadius: BorderRadius.circular(16),
                          child: Container(
                            padding: const EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              color: isCurrent ? track.primaryColor.withValues(alpha: 0.15) : const Color(0xFF1E293B),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: isCurrent ? track.primaryColor : const Color(0xFF334155),
                                width: isCurrent ? 2 : 1,
                              ),
                            ),
                            child: Row(
                              children: [
                                Text(track.mascotEmoji, style: const TextStyle(fontSize: 28)),
                                const SizedBox(width: 14),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        track.title,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        track.description,
                                        style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ),
                                if (isCurrent)
                                  Icon(Icons.check_circle_rounded, color: track.primaryColor, size: 22),
                              ],
                            ),
                          ),
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

  void _showHeartRefillDialog(BuildContext context, WidgetRef ref) {
    final profile = ref.read(userProfileProvider);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF1E293B),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: const Row(
            children: [
              Text('❤️ Can Durumu', style: TextStyle(color: Colors.white, fontSize: 18)),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Mevcut Canın: ${profile.hearts} / ${profile.maxHearts}',
                style: const TextStyle(color: Color(0xFFE2E8F0), fontSize: 15, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Yanlış cevap verdiğinde 1 can kaybedersin. 50 Elmas 💎 karşılığında tüm canlarını hemen yenileyebilirsin!',
                style: TextStyle(color: Color(0xFF94A3B8), fontSize: 13),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Kapat', style: TextStyle(color: Color(0xFF94A3B8))),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFEF4444),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: profile.gems >= 50 && profile.hearts < profile.maxHearts
                  ? () {
                      ref.read(userProfileProvider.notifier).refillHearts(cost: 50);
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('❤️ Canların tamamen yenilendi!'),
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    }
                  : null,
              child: const Text('50 💎 ile Doldur', style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }
}
