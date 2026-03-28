/// 拼音数据模型
class PinyinModel {
  final String id;
  final String pinyin;        // 拼音: "a", "zh", "ā"
  final String chinese;        // 汉字示例或注释
  final String emoji;         // 视觉符号
  final String category;      // 'initials', 'finals', 'wholes', 'tones'
  final String? tone;         // 四声: '1', '2', '3', '4' (仅四声类别)
  final String? group;         // 分组: '玻组', '得组' 等

  const PinyinModel({
    required this.id,
    required this.pinyin,
    required this.chinese,
    required this.emoji,
    required this.category,
    this.tone,
    this.group,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'pinyin': pinyin,
        'chinese': chinese,
        'emoji': emoji,
        'category': category,
        'tone': tone,
        'group': group,
      };

  factory PinyinModel.fromJson(Map<String, dynamic> json) => PinyinModel(
        id: json['id'] as String,
        pinyin: json['pinyin'] as String,
        chinese: json['chinese'] as String,
        emoji: json['emoji'] as String,
        category: json['category'] as String,
        tone: json['tone'] as String?,
        group: json['group'] as String?,
      );
}
