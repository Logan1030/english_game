import 'package:flutter/material.dart';
import '../models/word_model.dart';
import '../services/audio_service.dart';

/// 闪卡组件 - 3D翻转动画展示单词
class FlashcardWidget extends StatefulWidget {
  final WordModel word;
  final VoidCallback? onTap;

  const FlashcardWidget({
    super.key,
    required this.word,
    this.onTap,
  });

  @override
  State<FlashcardWidget> createState() => _FlashcardWidgetState();
}

class _FlashcardWidgetState extends State<FlashcardWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _showFront = true;
  final AudioService _audioService = AudioService();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _flip() {
    if (_showFront) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
    setState(() {
      _showFront = !_showFront;
    });
    // 点击时播放发音
    _audioService.speak(widget.word.word);
    widget.onTap?.call();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _flip,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          final angle = _animation.value * 3.14159;
          final isFront = _animation.value < 0.5;

          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(angle),
            child: isFront
                ? _buildFront()
                : Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()..rotateY(3.14159),
                    child: _buildBack(),
                  ),
          );
        },
      ),
    );
  }

  Widget _buildFront() {
    return Container(
      width: 280,
      height: 360,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFFF6B6B), Color(0xFFFF8E8E)],
        ),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.word.emoji,
            style: const TextStyle(fontSize: 100),
          ),
          const SizedBox(height: 20),
          Text(
            widget.word.word,
            style: const TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            '点击听发音',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBack() {
    return Container(
      width: 280,
      height: 360,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF4ECDC4), Color(0xFF6EE7DE)],
        ),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.word.emoji,
            style: const TextStyle(fontSize: 80),
          ),
          const SizedBox(height: 20),
          Text(
            widget.word.translation,
            style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            '中文意思',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }
}
