/// 英文数字数据模型 - 1-10单词拼写学习专用
class EnglishNumberModel {
  final String id;
  final int number;
  final String word;
  final String chinese;
  final String emoji;
  final List<String> letters;

  const EnglishNumberModel({
    required this.id,
    required this.number,
    required this.word,
    required this.chinese,
    required this.emoji,
    required this.letters,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'number': number,
        'word': word,
        'chinese': chinese,
        'emoji': emoji,
        'letters': letters,
      };

  factory EnglishNumberModel.fromJson(Map<String, dynamic> json) =>
      EnglishNumberModel(
        id: json['id'] as String,
        number: json['number'] as int,
        word: json['word'] as String,
        chinese: json['chinese'] as String,
        emoji: json['emoji'] as String,
        letters: List<String>.from(json['letters'] as List),
      );
}
