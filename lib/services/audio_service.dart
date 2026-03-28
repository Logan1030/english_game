import 'package:flutter_tts/flutter_tts.dart';

/// TTS 发音服务
class AudioService {
  static final AudioService _instance = AudioService._internal();
  factory AudioService() => _instance;
  AudioService._internal();

  final FlutterTts _flutterTts = FlutterTts();
  bool _isInitialized = false;

  Future<void> init() async {
    if (_isInitialized) return;

    await _flutterTts.setLanguage('en-US');
    await _flutterTts.setSpeechRate(0.4); // 较慢的语速，适合儿童
    await _flutterTts.setPitch(1.1); // 稍高的音调，更友好
    await _flutterTts.setVolume(1.0);

    _isInitialized = true;
  }

  /// 初始化中文TTS
  Future<void> initChinese() async {
    await _flutterTts.setLanguage('zh-CN');
    await _flutterTts.setSpeechRate(0.4);
    await _flutterTts.setPitch(1.1);
    await _flutterTts.setVolume(1.0);
  }

  /// 播放中文发音
  Future<void> speakChinese(String text) async {
    await initChinese();
    await _flutterTts.speak(text);
  }

  /// 播放单词发音
  Future<void> speak(String word) async {
    await init();
    await _flutterTts.speak(word);
  }

  /// 播放鼓励语
  Future<void> speakEncouragement(String text) async {
    await init();
    await _flutterTts.speak(text);
  }

  /// 播放欢呼音效（通过 TTS 模拟）
  Future<void> playCheerSound() async {
    await speakEncouragement('Great job!');
  }

  /// 播放成功音效
  Future<void> playSuccessSound() async {
    await speakEncouragement('You are amazing!');
  }

  /// 播放星级评价
  Future<void> speakStars(int stars) async {
    await init();
    String text;
    switch (stars) {
      case 3:
        text = 'Perfect! Three stars!';
        break;
      case 2:
        text = 'Great job! Two stars!';
        break;
      case 1:
        text = 'Good try! One star!';
        break;
      default:
        text = 'Try again!';
    }
    await _flutterTts.speak(text);
  }

  void dispose() {
    _flutterTts.stop();
  }
}
