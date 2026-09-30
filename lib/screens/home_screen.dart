import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/curriculum_models.dart';
import '../models/code_track_model.dart';
import '../providers/game_provider.dart';
import '../providers/track_provider.dart';
import '../widgets/stats_bar.dart';
import '../widgets/byte_mascot_widget.dart';
import '../widgets/code_path_node.dart';
import '../widgets/cheat_sheet_sheet.dart';
import 'quiz_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trackConfig = ref.watch(currentTrackConfigProvider);
    final allUnits = ref.watch(currentUnitsProvider);
    final userProfile = ref.watch(userProfileProvider);
    final selectedCategory = ref.watch(selectedCategoryFilterProvider);

    final filteredUnits = selectedCategory == 'Tümü'
        ? allUnits
        : allUnits.where((u) => u.category == selectedCategory).toList();

    return Scaffold(
      backgroundColor: const Color(0xFF0B1120), // Koyu Derin IDE Siyahı
      appBar: const StatsBar(),
      body: CustomScrollView(
        slivers: [
          // Filter Chips Header
          SliverToBoxAdapter(
            child: Container(
              height: 48,
              margin: const EdgeInsets.only(top: 8, bottom: 4),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 14),
                itemCount: trackConfig.categories.length,
                itemBuilder: (context, index) {
                  final cat = trackConfig.categories[index];
                  final isSelected = selectedCategory == cat;
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ChoiceChip(
                      label: Text(cat),
                      selected: isSelected,
                      selectedColor: trackConfig.primaryColor,
                      backgroundColor: const Color(0xFF1E293B),
                      labelStyle: TextStyle(
                        color: isSelected ? Colors.white : const Color(0xFF94A3B8),
                        fontSize: 12.5,
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                      ),
                      side: BorderSide(
                        color: isSelected ? trackConfig.primaryColor : const Color(0xFF334155),
                      ),
                      onSelected: (_) {
                        ref.read(selectedCategoryFilterProvider.notifier).state = cat;
                      },
                    ),
                  );
                },
              ),
            ),
          ),

          // Byte Mascot Coach Card
          SliverToBoxAdapter(
            child: ByteMascotWidget(
              speechText: trackConfig.mascotGreeting,
              trackColor: trackConfig.primaryColor,
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('🤖 Byte: "${trackConfig.shortTitle} kodlayarak bugün bir adım öndesin!"'),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
            ),
          ),

          // Units & Winding Path
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, unitIndex) {
                final unit = filteredUnits[unitIndex];
                return _buildUnitSection(context, unit, trackConfig, userProfile, ref, allUnits);
              },
              childCount: filteredUnits.length,
            ),
          ),

          const SliverToBoxAdapter(
            child: SizedBox(height: 80),
          ),
        ],
      ),
    );
  }

  Widget _buildUnitSection(
    BuildContext context,
    LearningUnit unit,
    CodeTrackConfig track,
    UserProfile profile,
    WidgetRef ref,
    List<LearningUnit> allUnits,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF0F172A),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFF1E293B), width: 1.5),
      ),
      child: Column(
        children: [
          // Unit Banner
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(unit.colorHex).withValues(alpha: 0.85),
                  Color(unit.colorHex).withValues(alpha: 0.55),
                ],
              ),
              borderRadius: const BorderRadius.vertical(top: Radius.circular(23)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ÜNİTE ${unit.unitNumber}',
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 11,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1.2,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        unit.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                // Cheat Sheet Button
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black.withValues(alpha: 0.35),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  icon: const Icon(Icons.menu_book_rounded, size: 16),
                  label: const Text('ÖZET', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (_) => CheatSheetSheet(unit: unit),
                    );
                  },
                ),
              ],
            ),
          ),

          // Winding Lesson Path Nodes
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Column(
              children: List.generate(unit.lessons.length, (lIndex) {
                final lesson = unit.lessons[lIndex];
                final isCompleted = profile.completedLessonIds.contains(lesson.id);
                final isUnlocked = ref.read(userProfileProvider.notifier).isLessonUnlocked(lesson.id, allUnits);
                final isCurrent = isUnlocked && !isCompleted;
                final score = profile.lessonScores[lesson.id] ?? 0.0;

                // Winding zigzag offsets: 0: center, 1: right (+45), 2: center, 3: left (-45)
                final alignmentOptions = [
                  Alignment.center,
                  const Alignment(0.45, 0),
                  Alignment.center,
                  const Alignment(-0.45, 0),
                ];
                final alignment = alignmentOptions[lIndex % alignmentOptions.length];

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Align(
                    alignment: alignment,
                    child: CodePathNode(
                      lesson: lesson,
                      isCompleted: isCompleted,
                      isCurrent: isCurrent,
                      isLocked: !isUnlocked,
                      score: score,
                      trackColor: Color(unit.colorHex),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => QuizScreen(lesson: lesson),
                          ),
                        );
                      },
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
