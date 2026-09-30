import 'package:flutter/material.dart';
import '../models/curriculum_models.dart';

class CodePathNode extends StatefulWidget {
  final Lesson lesson;
  final bool isCompleted;
  final bool isCurrent;
  final bool isLocked;
  final double score;
  final Color trackColor;
  final VoidCallback onTap;

  const CodePathNode({
    super.key,
    required this.lesson,
    required this.isCompleted,
    required this.isCurrent,
    required this.isLocked,
    this.score = 0.0,
    required this.trackColor,
    required this.onTap,
  });

  @override
  State<CodePathNode> createState() => _CodePathNodeState();
}

class _CodePathNodeState extends State<CodePathNode> with SingleTickerProviderStateMixin {
  late AnimationController _pulseController;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isUnitExam = widget.lesson.isUnitExam;

    Color nodeBg;
    Color nodeBorder;
    Color iconColor;
    IconData iconData;

    if (widget.isLocked) {
      nodeBg = const Color(0xFF1E293B);
      nodeBorder = const Color(0xFF334155);
      iconColor = const Color(0xFF64748B);
      iconData = Icons.lock_rounded;
    } else if (widget.isCompleted) {
      nodeBg = widget.trackColor;
      nodeBorder = Colors.white.withValues(alpha: 0.85);
      iconColor = Colors.white;
      iconData = isUnitExam ? Icons.emoji_events_rounded : Icons.check_rounded;
    } else {
      // Aktif Ders
      nodeBg = widget.trackColor;
      nodeBorder = Colors.amber;
      iconColor = Colors.white;
      iconData = isUnitExam ? Icons.star_rounded : Icons.play_arrow_rounded;
    }

    final double nodeSize = isUnitExam ? 76.0 : 66.0;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Pulsing / Glow Indicator for current
        AnimatedBuilder(
          animation: _pulseController,
          builder: (context, child) {
            final pulseScale = widget.isCurrent ? (1.0 + _pulseController.value * 0.08) : 1.0;
            return Transform.scale(
              scale: pulseScale,
              child: child,
            );
          },
          child: GestureDetector(
            onTap: widget.isLocked ? null : widget.onTap,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // 3D Shadow Ring
                Container(
                  width: nodeSize,
                  height: nodeSize + 6,
                  decoration: BoxDecoration(
                    color: widget.isLocked ? const Color(0xFF0F172A) : widget.trackColor.withValues(alpha: 0.4),
                    shape: BoxShape.circle,
                  ),
                ),
                // Main Node Body
                Container(
                  width: nodeSize,
                  height: nodeSize,
                  decoration: BoxDecoration(
                    color: nodeBg,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: nodeBorder,
                      width: widget.isCurrent ? 3.5 : 2.5,
                    ),
                    boxShadow: widget.isCurrent
                        ? [
                            BoxShadow(
                              color: widget.trackColor.withValues(alpha: 0.6),
                              blurRadius: 16,
                              spreadRadius: 2,
                            ),
                          ]
                        : null,
                  ),
                  child: Center(
                    child: Icon(
                      iconData,
                      color: iconColor,
                      size: isUnitExam ? 34 : 30,
                    ),
                  ),
                ),
                // Crown / Star badge for completed unit exam
                if (widget.isCompleted && isUnitExam)
                  Positioned(
                    top: -2,
                    right: -2,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Colors.amber,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.star_rounded, color: Colors.black, size: 14),
                    ),
                  ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        // Lesson Title Badge
        Container(
          constraints: const BoxConstraints(maxWidth: 160),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: widget.isLocked ? const Color(0xFF1E293B) : const Color(0xFF0F172A),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: widget.isCurrent ? widget.trackColor : const Color(0xFF334155),
              width: 1,
            ),
          ),
          child: Text(
            widget.lesson.title,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: widget.isLocked ? const Color(0xFF64748B) : Colors.white,
              fontSize: 12,
              fontWeight: widget.isCurrent ? FontWeight.bold : FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
