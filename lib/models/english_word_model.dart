/// 英语身体部位和形容词数据模型
class EnglishWordModel {
  final String id;
  final String word;
  final String chinese;
  final String emoji;
  final List<String> letters;
  final String category;

  const EnglishWordModel({
    required this.id,
    required this.word,
    required this.chinese,
    required this.emoji,
    required this.letters,
    required this.category,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'word': word,
        'chinese': chinese,
        'emoji': emoji,
        'letters': letters,
        'category': category,
      };

  factory EnglishWordModel.fromJson(Map<String, dynamic> json) =>
      EnglishWordModel(
        id: json['id'] as String,
        word: json['word'] as String,
        chinese: json['chinese'] as String,
        emoji: json['emoji'] as String,
        letters: List<String>.from(json['letters'] as List),
        category: json['category'] as String,
      );
}
