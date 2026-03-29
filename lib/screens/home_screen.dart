import 'package:flutter/material.dart';
import '../app.dart';
import '../data/words_data.dart';
import '../data/pinyin_data.dart';
import '../utils/storage_helper.dart';
import 'game_screen.dart';
import 'chinese_game_screen.dart';
import 'english_numbers_game_screen.dart';

/// 首页 - 关卡选择
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _totalStars = 0;
  Map<String, int> _progress = {};

  @override
  void initState() {
    super.initState();
    _loadProgress();
  }

  Future<void> _loadProgress() async {
    final total = await StorageHelper.getTotalStars();
    final progress = await StorageHelper.getAllProgress();
    if (mounted) {
      setState(() {
        _totalStars = total;
        _progress = progress;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // 所有英文学习类别
    final categories = [
      'colors',
      'numbers',
      'animals',
      'foods',
      'body',
      'clothes',
      'vehicles',
      'nature',
      'family',
      'emotions',
      'actions',
      'shapes',
      'time',
      'chinese',
      'english_numbers',
    ];

    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // 顶部标题和星星
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '学习小游戏',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.primaryColor,
                        ),
                      ),
                      Text(
                        '一起学习吧！',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: AppTheme.accentColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.orange,
                          size: 28,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '$_totalStars',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // 主题卡片网格 - 使用3列布局
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.85,
                  ),
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    return _buildCategoryCard(category);
                  },
                ),
              ),
            ),

            // 底部重置按钮
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextButton(
                onPressed: _showResetDialog,
                child: const Text(
                  '家长模式：重置进度',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCard(String category) {
    final color = AppTheme.getCategoryColor(category);
    final String emoji;
    final String name;
    final int stars;

    if (category == 'chinese') {
      emoji = getChineseModuleEmoji();
      name = getChineseModuleName();
      // 语文模块显示所有子模块的累计星星
      int totalChineseStars = 0;
      for (var subCat in getChineseSubCategories()) {
        totalChineseStars += _progress[subCat] ?? 0;
      }
      stars = totalChineseStars;
    } else if (category == 'english_numbers') {
      emoji = '🔤';
      name = '英语数字';
      stars = _progress[category] ?? 0;
    } else {
      emoji = getCategoryEmoji(category);
      name = getCategoryName(category);
      stars = _progress[category] ?? 0;
    }

    return GestureDetector(
      onTap: () => _navigateToGame(category),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [color, color.withValues(alpha: 0.7)],
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: color.withValues(alpha: 0.4),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              emoji,
              style: const TextStyle(fontSize: 40),
            ),
            const SizedBox(height: 8),
            Text(
              name,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.star, color: Colors.amber, size: 14),
                  const SizedBox(width: 2),
                  Text(
                    '$stars',
                    style: const TextStyle(
                      fontSize: 12,
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

  void _navigateToGame(String category) {
    if (category == 'chinese') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ChineseGameScreen(),
        ),
      ).then((_) => _loadProgress());
    } else if (category == 'english_numbers') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const EnglishNumbersGameScreen(),
        ),
      ).then((_) => _loadProgress());
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => GameScreen(category: category),
        ),
      ).then((_) => _loadProgress());
    }
  }

  void _showResetDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('重置进度'),
        content: const Text('确定要重置所有学习进度吗？'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('取消'),
          ),
          ElevatedButton(
            onPressed: () async {
              await StorageHelper.resetProgress();
              await _loadProgress();
              if (mounted) {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('进度已重置')),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            child: const Text('确定重置'),
          ),
        ],
      ),
    );
  }
}
