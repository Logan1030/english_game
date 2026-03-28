import 'package:flutter/material.dart';

/// 字母选择组件 - 拼写游戏用
class LetterTileWidget extends StatefulWidget {
  final String letter;
  final bool isSelected;
  final bool isInTarget;
  final bool isCorrectPosition;
  final VoidCallback onTap;

  const LetterTileWidget({
    super.key,
    required this.letter,
    required this.isSelected,
    required this.isInTarget,
    required this.isCorrectPosition,
    required this.onTap,
  });

  @override
  State<LetterTileWidget> createState() => _LetterTileWidgetState();
}

class _LetterTileWidgetState extends State<LetterTileWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _shakeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _shakeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.elasticIn),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void shake() {
    _controller.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _shakeAnimation,
      builder: (context, child) {
        final shake = _shakeAnimation.value * 10 *
            ((_shakeAnimation.value * 6.28 * 3).sin());
        return Transform.translate(
          offset: Offset(shake, 0),
          child: child,
        );
      },
      child: GestureDetector(
        onTap: widget.isSelected ? null : widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: widget.isSelected
                ? Colors.grey.shade300
                : widget.isInTarget
                    ? (widget.isCorrectPosition
                        ? const Color(0xFF4ECDC4)
                        : const Color(0xFFFF6B6B))
                    : const Color(0xFFFFE66D),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: widget.isInTarget
                  ? Colors.transparent
                  : (widget.isCorrectPosition
                      ? const Color(0xFF4ECDC4)
                      : Colors.grey.shade400),
              width: 2,
            ),
            boxShadow: widget.isSelected
                ? []
                : [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.15),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
          ),
          child: Center(
            child: Text(
              widget.letter.toUpperCase(),
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: widget.isSelected
                    ? Colors.grey.shade500
                    : (widget.isInTarget ? Colors.white : Colors.black87),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

extension on double {
  double sin() => this;
}
