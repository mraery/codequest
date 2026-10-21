import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/game_provider.dart';
import '../widgets/stats_bar.dart';

import '../models/curriculum_models.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  String _selectedCategory = 'Tümü';

  @override
  Widget build(BuildContext context) {
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
          const SizedBox(height: 18),

          // Promo Code Banner
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: profile.isCheatUnlocked
                    ? [const Color(0xFF7C3AED), const Color(0xFF4C1D95)]
                    : [const Color(0xFF1E293B), const Color(0xFF0F172A)],
              ),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: profile.isCheatUnlocked ? Colors.amber : const Color(0xFF334155),
                width: 1.5,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  profile.isCheatUnlocked ? Icons.stars_rounded : Icons.card_giftcard_rounded,
                  color: profile.isCheatUnlocked ? Colors.amber : const Color(0xFFA855F7),
                  size: 28,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        profile.isCheatUnlocked ? '🔥 Kagan Hile Modu Aktif' : 'Promosyon & Hile Kodu',
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                      Text(
                        profile.isCheatUnlocked
                            ? 'Sınırsız Can, 300 Elmas ve OTO-ÇÖZ açık'
                            : 'Özel kodunu girerek avantajları kap',
                        style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 12),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFA855F7),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  onPressed: () => _showPromoDialog(context),
                  child: Text(profile.isCheatUnlocked ? 'Yönet' : 'Kod Gir'),
                ),
              ],
            ),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Başarımlar & Rozetler',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFF10B981).withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFF10B981).withValues(alpha: 0.4)),
                ),
                child: Text(
                  '${achievements.where((a) => a.isUnlocked).length} / ${achievements.length} 🏆',
                  style: const TextStyle(
                    color: Color(0xFF34D399),
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),

          // Kategori Filtreleme Çipleri
          SizedBox(
            height: 36,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                'Tümü',
                'Dersler',
                'XP',
                'Elmas',
                'Seri',
                'Diller',
                'Özel',
              ].map((cat) {
                final isSelected = (_selectedCategory == cat);
                return Padding(
                  padding: const EdgeInsets.only(right: 6.0),
                  child: FilterChip(
                    label: Text(cat),
                    selected: isSelected,
                    backgroundColor: const Color(0xFF1E293B),
                    selectedColor: const Color(0xFF0284C7),
                    labelStyle: TextStyle(
                      color: isSelected ? Colors.white : Colors.white70,
                      fontSize: 11.5,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    onSelected: (val) {
                      setState(() {
                        _selectedCategory = cat;
                      });
                    },
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 12),

          ...achievements.where((ach) {
            if (_selectedCategory == 'Tümü') return true;
            if (_selectedCategory == 'Dersler') return ach.category == AchievementCategory.lessons;
            if (_selectedCategory == 'XP') return ach.category == AchievementCategory.xp;
            if (_selectedCategory == 'Elmas') return ach.category == AchievementCategory.gems;
            if (_selectedCategory == 'Seri') return ach.category == AchievementCategory.streak;
            if (_selectedCategory == 'Diller') return ach.category == AchievementCategory.languages;
            if (_selectedCategory == 'Özel') return ach.category == AchievementCategory.special;
            return true;
          }).map((ach) {
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
                        'v1.1.0 Mega • 10 Patika • 16.000 Soru & Açıklama',
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

  void _showPromoDialog(BuildContext context) {
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
                          result.success ? 'Tebrikler!' : 'Bilgi',
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
}
