/// 单词数据模型
class WordModel {
  final String id;
  final String word;
  final String translation;
  final String emoji;
  final String category;

  const WordModel({
    required this.id,
    required this.word,
    required this.translation,
    required this.emoji,
    required this.category,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'word': word,
        'translation': translation,
        'emoji': emoji,
        'category': category,
      };

  factory WordModel.fromJson(Map<String, dynamic> json) => WordModel(
        id: json['id'] as String,
        word: json['word'] as String,
        translation: json['translation'] as String,
        emoji: json['emoji'] as String,
        category: json['category'] as String,
      );
}
