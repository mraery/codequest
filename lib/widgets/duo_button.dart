import 'package:flutter/material.dart';

class DuoButton extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final Color textColor;
  final Color shadowColor;
  final IconData? icon;
  final bool isFullWidth;
  final double height;
  final double fontSize;

  const DuoButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = const Color(0xFF10B981),
    this.textColor = Colors.white,
    this.shadowColor = const Color(0xFF059669),
    this.icon,
    this.isFullWidth = true,
    this.height = 54,
    this.fontSize = 17,
  });

  @override
  State<DuoButton> createState() => _DuoButtonState();
}

class _DuoButtonState extends State<DuoButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final bool isEnabled = widget.onPressed != null;
    final double pushDepth = 4.0;

    final bg = isEnabled ? widget.backgroundColor : const Color(0xFF334155);
    final shadow = isEnabled ? widget.shadowColor : const Color(0xFF1E293B);
    final txt = isEnabled ? widget.textColor : const Color(0xFF94A3B8);

    return GestureDetector(
      onTapDown: isEnabled ? (_) => setState(() => _isPressed = true) : null,
      onTapUp: isEnabled
          ? (_) {
              setState(() => _isPressed = false);
              widget.onPressed?.call();
            }
          : null,
      onTapCancel: isEnabled ? () => setState(() => _isPressed = false) : null,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 60),
        width: widget.isFullWidth ? double.infinity : null,
        height: widget.height,
        margin: EdgeInsets.only(
          top: _isPressed ? pushDepth : 0,
          bottom: _isPressed ? 0 : pushDepth,
        ),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(16),
          boxShadow: isEnabled && !_isPressed
              ? [
                  BoxShadow(
                    color: shadow,
                    offset: Offset(0, pushDepth),
                    blurRadius: 0,
                  ),
                ]
              : null,
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (widget.icon != null) ...[
                  Icon(widget.icon, color: txt, size: 20),
                  const SizedBox(width: 8),
                ],
                Text(
                  widget.text,
                  style: TextStyle(
                    color: txt,
                    fontSize: widget.fontSize,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.4,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
