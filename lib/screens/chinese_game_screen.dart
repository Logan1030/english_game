import 'package:flutter/material.dart';
import '../app.dart';
import '../data/pinyin_data.dart';
import '../utils/storage_helper.dart';
import 'pinyin_game_screen.dart';

/// 语文模块界面 - 显示声母、韵母、整体认读、四声子类别
class ChineseGameScreen extends StatefulWidget {
  const ChineseGameScreen({super.key});

  @override
  State<ChineseGameScreen> createState() => _ChineseGameScreenState();
}

class _ChineseGameScreenState extends State<ChineseGameScreen> {
  Map<String, int> _progress = {};

  @override
  void initState() {
    super.initState();
    _loadProgress();
  }

  Future<void> _loadProgress() async {
    final progress = await StorageHelper.getAllProgress();
    if (mounted) {
      setState(() {
        _progress = progress;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final subCategories = getChineseSubCategories();

    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppTheme.chineseCategory,
        title: const Text('语文篇'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            // 顶部标题
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Text(
                    '🇨🇳 语文学习',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.chineseCategory,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '学拼音，打基础',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // 子类别网格
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.9,
                  ),
                  itemCount: subCategories.length,
                  itemBuilder: (context, index) {
                    final subCategory = subCategories[index];
                    return _buildSubCategoryCard(subCategory);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSubCategoryCard(String subCategory) {
    final color = _getSubCategoryColor(subCategory);
    final emoji = getPinyinCategoryEmoji(subCategory);
    final name = getPinyinCategoryName(subCategory);
    final stars = _progress[subCategory] ?? 0;

    return GestureDetector(
      onTap: () => _navigateToGame(subCategory),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [color, color.withValues(alpha: 0.7)],
          ),
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: color.withValues(alpha: 0.4),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              emoji,
              style: const TextStyle(fontSize: 50),
            ),
            const SizedBox(height: 12),
            Text(
              name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.star, color: Colors.amber, size: 16),
                  const SizedBox(width: 4),
                  Text(
                    '$stars',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getSubCategoryColor(String subCategory) {
    switch (subCategory) {
      case 'initials':
        return const Color(0xFF5C6BC0); // 靛蓝色
      case 'finals':
        return const Color(0xFF26A69A); // 青色
      case 'wholes':
        return const Color(0xFFAB47BC); // 紫色
      case 'tones':
        return const Color(0xFFEC407A); // 粉红色
      default:
        return AppTheme.chineseCategory;
    }
  }

  void _navigateToGame(String subCategory) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PinyinGameScreen(category: subCategory),
      ),
    ).then((_) => _loadProgress());
  }
}
