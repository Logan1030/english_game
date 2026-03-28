import 'package:flutter/material.dart';

/// 星级评价组件
class StarRating extends StatelessWidget {
  final int stars;
  final int maxStars;
  final double size;

  const StarRating({
    super.key,
    required this.stars,
    this.maxStars = 3,
    this.size = 60,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(maxStars, (index) {
        final isEarned = index < stars;
        return TweenAnimationBuilder<double>(
          tween: Tween(begin: 0, end: isEarned ? 1 : 0.3),
          duration: Duration(milliseconds: 300 + (index * 200)),
          curve: Curves.elasticOut,
          builder: (context, value, child) {
            return Transform.scale(
              scale: 0.5 + (value * 0.5),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Icon(
                  isEarned ? Icons.star : Icons.star_border,
                  color: isEarned ? Colors.amber : Colors.grey,
                  size: size,
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
