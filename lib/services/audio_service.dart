import 'package:flutter_tts/flutter_tts.dart';
import 'package:audioplayers/audioplayers.dart';

/// 发音服务 - 支持本地音频和TTS
class AudioService {
  static final AudioService _instance = AudioService._internal();
  factory AudioService() => _instance;
  AudioService._internal();

  final FlutterTts _flutterTts = FlutterTts();
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isInitialized = false;

  Future<void> init() async {
    if (_isInitialized) return;

    // 初始化TTS
    await _flutterTts.setLanguage('en-US');
    await _flutterTts.setSpeechRate(0.4);
    await _flutterTts.setPitch(1.1);
    await _flutterTts.setVolume(1.0);

    _isInitialized = true;
  }

  /// 播放中文发音
  Future<void> speakChinese(String text) async {
    await _flutterTts.setLanguage('zh-CN');
    await _flutterTts.setSpeechRate(0.4);
    await _flutterTts.setPitch(1.1);
    await _flutterTts.setVolume(1.0);
    await _flutterTts.speak(text);
  }

  /// 播放单词发音 - 优先本地音频，TTS fallback
  Future<void> speak(String word, {String? category}) async {
    if (category != null) {
      // 尝试播放本地音频
      try {
        final String audioPath = 'sounds/english/$category/$word.mp3';
        await _audioPlayer.play(AssetSource(audioPath));
        return;
      } catch (e) {
        // 文件不存在，使用TTS
      }
    }
    // TTS fallback
    await init();
    await _flutterTts.speak(word);
  }

  /// 播放单词发音（仅TTS，不尝试本地文件）
  Future<void> speakTts(String word) async {
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

  /// 停止播放
  Future<void> stop() async {
    await _audioPlayer.stop();
    await _flutterTts.stop();
  }

  void dispose() {
    _audioPlayer.dispose();
    _flutterTts.stop();
  }
}
