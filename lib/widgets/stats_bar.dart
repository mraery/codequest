import 'premium_purchase_sheet.dart';
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
              const SizedBox(width: 8),

              // Promosyon & Hile Kodu Butonu
              InkWell(
                onTap: () => _showPromoCodeDialog(context, ref),
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF7C3AED), Color(0xFF9333EA)],
                    ),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF7C3AED).withValues(alpha: 0.3),
                        blurRadius: 6,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.card_giftcard_rounded, color: Colors.white, size: 14),
                      SizedBox(width: 4),
                      Text(
                        'KOD',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 11,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                ),
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

  void _showPromoCodeDialog(BuildContext context, WidgetRef ref) {
    final controller = TextEditingController();

    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          backgroundColor: const Color(0xFF1E293B),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: const Row(
            children: [
              Icon(Icons.card_giftcard_rounded, color: Color(0xFFA855F7), size: 24),
              SizedBox(width: 8),
              Text('Promosyon & Hile Kodu', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Özel etkinlik, geliştirici veya indirim kodunuzu girerek anında sınırsız can, elmas veya hile modunu aktif edin:',
                style: TextStyle(color: Color(0xFF94A3B8), fontSize: 13),
              ),
              const SizedBox(height: 14),
              TextField(
                controller: controller,
                autofocus: true,
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  hintText: 'Örn: kagan',
                  hintStyle: const TextStyle(color: Color(0xFF64748B)),
                  filled: true,
                  fillColor: const Color(0xFF0F172A),
                  prefixIcon: const Icon(Icons.key_rounded, color: Color(0xFFA855F7), size: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: const BorderSide(color: Color(0xFF334155)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: const BorderSide(color: Color(0xFFA855F7), width: 2),
                  ),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('İptal', style: TextStyle(color: Color(0xFF94A3B8))),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFA855F7),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: () {
                final text = controller.text.trim();
                final result = ref.read(userProfileProvider.notifier).applyPromoCode(text);
                Navigator.pop(dialogContext);

                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    backgroundColor: const Color(0xFF1E293B),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                    title: Row(
                      children: [
                        Icon(
                          result.success ? Icons.stars_rounded : Icons.info_outline_rounded,
                          color: result.success ? Colors.amber : Colors.redAccent,
                          size: 26,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          result.success ? 'Tebrikler!' : 'Hata',
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    content: Text(
                      result.message,
                      style: const TextStyle(color: Color(0xFFE2E8F0), fontSize: 14, height: 1.4),
                    ),
                    actions: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: result.success ? const Color(0xFF10B981) : const Color(0xFF64748B),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                        onPressed: () => Navigator.pop(ctx),
                        child: const Text('Tamam', style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                );
              },
              child: const Text('Uygula', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ],
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
              Text('❤️ Can & Elmas Mağazası', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Mevcut Canın: ${profile.isPremium ? 'Sınırsız (∞)' : '${profile.hearts} / ${profile.maxHearts}'}  •  Elmas: ${profile.gems} 💎',
                style: const TextStyle(color: Color(0xFFE2E8F0), fontSize: 14.5, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              // Reklam İzle Seçeneği
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                  showDialog(
                    context: context,
                    builder: (adCtx) => AlertDialog(
                      backgroundColor: const Color(0xFF1E293B),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      title: const Row(
                        children: [
                          Icon(Icons.ondemand_video_rounded, color: Colors.amber),
                          SizedBox(width: 8),
                          Text('Sponsorlu Video', style: TextStyle(color: Colors.white, fontSize: 16)),
                        ],
                      ),
                      content: const Text(
                        'Reklam izlendi! +1 Can hesabına eklendi.',
                        style: TextStyle(color: Color(0xFFCBD5E1)),
                      ),
                      actions: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF10B981)),
                          onPressed: () {
                            ref.read(userProfileProvider.notifier).rewardHeartFromAd();
                            Navigator.pop(adCtx);
                          },
                          child: const Text('Ödülü Al', style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                  );
                },
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0F172A),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.amber.withValues(alpha: 0.5)),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.ondemand_video_rounded, color: Colors.amber, size: 24),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('📺 Video Reklam İzle', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13.5)),
                            Text('+1 Can Ücretsiz Kazan', style: TextStyle(color: Color(0xFF94A3B8), fontSize: 11.5)),
                          ],
                        ),
                      ),
                      Text('+1 ❤️', style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              // 50 Elmas ile Doldur
              InkWell(
                onTap: profile.gems >= 50 && profile.hearts < profile.maxHearts
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
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0F172A),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFF334155)),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.favorite_rounded, color: Color(0xFFEF4444), size: 24),
                      const SizedBox(width: 10),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Tüm Canları Doldur', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13.5)),
                            Text('5 Canına anında kavuş', style: TextStyle(color: Color(0xFF94A3B8), fontSize: 11.5)),
                          ],
                        ),
                      ),
                      Text('50 💎', style: TextStyle(color: profile.gems >= 50 ? const Color(0xFF06B6D4) : Colors.grey, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              // CodeQuest Pro VIP
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                  PremiumPurchaseSheet.show(context, ref);
                },
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF0284C7), Color(0xFF0369A1)],
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.workspace_premium_rounded, color: Colors.white, size: 24),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('CodeQuest Pro VIP 👑', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13.5)),
                            Text('Sınırsız Can & Sıfır Reklam', style: TextStyle(color: Color(0xFFBAE6FD), fontSize: 11.5)),
                          ],
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios_rounded, color: Colors.white, size: 16),
                    ],
                  ),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Kapat', style: TextStyle(color: Color(0xFF94A3B8))),
            ),
          ],
        );
      },
    );
  }
}
