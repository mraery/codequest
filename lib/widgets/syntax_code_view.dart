import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SyntaxCodeView extends StatelessWidget {
  final String code;
  final String? language;
  final bool showLineNumbers;
  final bool allowCopy;

  const SyntaxCodeView({
    super.key,
    required this.code,
    this.language,
    this.showLineNumbers = true,
    this.allowCopy = true,
  });

  @override
  Widget build(BuildContext context) {
    final lines = code.split('\n');

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF0F172A), // Modern Slate-900 Koyu Arka Plan
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFF334155), width: 1.2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.35),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header Bar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: const BoxDecoration(
              color: Color(0xFF1E293B),
              borderRadius: BorderRadius.vertical(top: Radius.circular(13)),
            ),
            child: Row(
              children: [
                Container(
                  width: 10,
                  height: 10,
                  decoration: const BoxDecoration(
                    color: Color(0xFFEF4444),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 6),
                Container(
                  width: 10,
                  height: 10,
                  decoration: const BoxDecoration(
                    color: Color(0xFFF59E0B),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 6),
                Container(
                  width: 10,
                  height: 10,
                  decoration: const BoxDecoration(
                    color: Color(0xFF10B981),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  (language ?? 'CODE').toUpperCase(),
                  style: const TextStyle(
                    color: Color(0xFF94A3B8),
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.2,
                  ),
                ),
                const Spacer(),
                if (allowCopy)
                  InkWell(
                    onTap: () {
                      Clipboard.setData(ClipboardData(text: code));
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Kod panoya kopyalandı! 📋'),
                          duration: Duration(seconds: 1),
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    },
                    borderRadius: BorderRadius.circular(6),
                    child: const Padding(
                      padding: EdgeInsets.all(4),
                      child: Row(
                        children: [
                          Icon(Icons.copy_rounded, color: Color(0xFF94A3B8), size: 14),
                          SizedBox(width: 4),
                          Text(
                            'Kopyala',
                            style: TextStyle(color: Color(0xFF94A3B8), fontSize: 11),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
          // Code Lines
          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(lines.length, (i) {
                final line = lines[i];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (showLineNumbers)
                        SizedBox(
                          width: 26,
                          child: Text(
                            '${i + 1}',
                            style: const TextStyle(
                              color: Color(0xFF475569),
                              fontFamily: 'monospace',
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      Expanded(
                        child: RichText(
                          text: _buildHighlightedText(line),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  TextSpan _buildHighlightedText(String line) {
    if (line.trim().startsWith('#') || line.trim().startsWith('//')) {
      return TextSpan(
        text: line,
        style: const TextStyle(
          color: Color(0xFF64748B),
          fontFamily: 'monospace',
          fontSize: 13.5,
          fontStyle: FontStyle.italic,
        ),
      );
    }

    // Basit tokenizer ile renk tonlama
    final keywords = {
      'def', 'return', 'class', 'val', 'var', 'fun', 'if', 'else', 'elif',
      'for', 'while', 'import', 'from', 'in', 'is', 'not', 'and', 'or',
      'public', 'private', 'static', 'void', 'string', 'int', 'bool', 'double',
      'async', 'await', 'Task', 'using', 'switch', 'case', 'try', 'catch', 'finally',
      'data', 'package', 'new', 'Console', 'WriteLine', 'print', 'println'
    };

    final words = line.split(RegExp(r'(\s+|(?=[(),;.:={}\[\]])|(?<=[(),;.:={}\[\]]))'));
    List<TextSpan> spans = [];

    for (final token in words) {
      if (keywords.contains(token)) {
        spans.add(TextSpan(
          text: token,
          style: const TextStyle(
            color: Color(0xFF38BDF8), // Cyan / Keyword
            fontWeight: FontWeight.w600,
            fontFamily: 'monospace',
            fontSize: 13.5,
          ),
        ));
      } else if (token.startsWith('"') || token.endsWith('"') || token.startsWith("'") || token.endsWith("'")) {
        spans.add(TextSpan(
          text: token,
          style: const TextStyle(
            color: Color(0xFFA3E635), // Lime / String
            fontFamily: 'monospace',
            fontSize: 13.5,
          ),
        ));
      } else if (int.tryParse(token) != null || double.tryParse(token) != null) {
        spans.add(TextSpan(
          text: token,
          style: const TextStyle(
            color: Color(0xFFFBBF24), // Amber / Number
            fontFamily: 'monospace',
            fontSize: 13.5,
          ),
        ));
      } else if (token == '___') {
        spans.add(const TextSpan(
          text: ' [ ? ] ',
          style: TextStyle(
            color: Color(0xFFF43F5E),
            backgroundColor: Color(0xFF881337),
            fontWeight: FontWeight.bold,
            fontFamily: 'monospace',
            fontSize: 14,
          ),
        ));
      } else {
        spans.add(TextSpan(
          text: token,
          style: const TextStyle(
            color: Color(0xFFE2E8F0), // Muted White / Default
            fontFamily: 'monospace',
            fontSize: 13.5,
          ),
        ));
      }
    }

    return TextSpan(children: spans);
  }
}
