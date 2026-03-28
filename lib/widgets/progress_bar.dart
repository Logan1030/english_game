import 'package:flutter/material.dart';

/// 进度条组件
class ProgressBar extends StatelessWidget {
  final int current;
  final int total;
  final Color color;
  final double height;

  const ProgressBar({
    super.key,
    required this.current,
    required this.total,
    this.color = const Color(0xFF4ECDC4),
    this.height = 12,
  });

  @override
  Widget build(BuildContext context) {
    final progress = total > 0 ? current / total : 0.0;

    return Container(
      height: height,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(height / 2),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(height / 2),
        child: TweenAnimationBuilder<double>(
          tween: Tween(begin: 0, end: progress),
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          builder: (context, value, child) {
            return FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: value,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [color, color.withValues(alpha: 0.8)],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
