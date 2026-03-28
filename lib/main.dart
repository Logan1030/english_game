import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app.dart';
import 'screens/home_screen.dart';
import 'utils/storage_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 初始化存储
  await StorageHelper.init();

  // 设置全屏、竖屏
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // 设置状态栏样式
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

  runApp(const EnglishGameApp());
}

class EnglishGameApp extends StatelessWidget {
  const EnglishGameApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '英语小游戏',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      home: const HomeScreen(),
    );
  }
}
