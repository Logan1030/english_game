import '../models/word_model.dart';

/// 词汇数据 - 颜色篇
const List<WordModel> colorsData = [
  WordModel(id: 'c1', word: 'red', translation: '红色', emoji: '🔴', category: 'colors'),
  WordModel(id: 'c2', word: 'blue', translation: '蓝色', emoji: '🔵', category: 'colors'),
  WordModel(id: 'c3', word: 'green', translation: '绿色', emoji: '🟢', category: 'colors'),
  WordModel(id: 'c4', word: 'yellow', translation: '黄色', emoji: '🟡', category: 'colors'),
  WordModel(id: 'c5', word: 'pink', translation: '粉色', emoji: '💗', category: 'colors'),
  WordModel(id: 'c6', word: 'orange', translation: '橙色', emoji: '🟠', category: 'colors'),
];

/// 词汇数据 - 数字篇
const List<WordModel> numbersData = [
  WordModel(id: 'n1', word: 'one', translation: '一', emoji: '1️⃣', category: 'numbers'),
  WordModel(id: 'n2', word: 'two', translation: '二', emoji: '2️⃣', category: 'numbers'),
  WordModel(id: 'n3', word: 'three', translation: '三', emoji: '3️⃣', category: 'numbers'),
  WordModel(id: 'n4', word: 'four', translation: '四', emoji: '4️⃣', category: 'numbers'),
  WordModel(id: 'n5', word: 'five', translation: '五', emoji: '5️⃣', category: 'numbers'),
  WordModel(id: 'n6', word: 'six', translation: '六', emoji: '6️⃣', category: 'numbers'),
  WordModel(id: 'n7', word: 'seven', translation: '七', emoji: '7️⃣', category: 'numbers'),
  WordModel(id: 'n8', word: 'eight', translation: '八', emoji: '8️⃣', category: 'numbers'),
  WordModel(id: 'n9', word: 'nine', translation: '九', emoji: '9️⃣', category: 'numbers'),
  WordModel(id: 'n10', word: 'ten', translation: '十', emoji: '🔟', category: 'numbers'),
];

/// 词汇数据 - 动物篇
const List<WordModel> animalsData = [
  WordModel(id: 'a1', word: 'cat', translation: '猫', emoji: '🐱', category: 'animals'),
  WordModel(id: 'a2', word: 'dog', translation: '狗', emoji: '🐕', category: 'animals'),
  WordModel(id: 'a3', word: 'bird', translation: '鸟', emoji: '🐦', category: 'animals'),
  WordModel(id: 'a4', word: 'fish', translation: '鱼', emoji: '🐟', category: 'animals'),
  WordModel(id: 'a5', word: 'rabbit', translation: '兔子', emoji: '🐰', category: 'animals'),
  WordModel(id: 'a6', word: 'bear', translation: '熊', emoji: '🐻', category: 'animals'),
  WordModel(id: 'a7', word: 'lion', translation: '狮子', emoji: '🦁', category: 'animals'),
  WordModel(id: 'a8', word: 'monkey', translation: '猴子', emoji: '🐵', category: 'animals'),
];

/// 词汇数据 - 食物篇
const List<WordModel> foodsData = [
  WordModel(id: 'f1', word: 'apple', translation: '苹果', emoji: '🍎', category: 'foods'),
  WordModel(id: 'f2', word: 'banana', translation: '香蕉', emoji: '🍌', category: 'foods'),
  WordModel(id: 'f3', word: 'milk', translation: '牛奶', emoji: '🥛', category: 'foods'),
  WordModel(id: 'f4', word: 'water', translation: '水', emoji: '💧', category: 'foods'),
  WordModel(id: 'f5', word: 'rice', translation: '米饭', emoji: '🍚', category: 'foods'),
  WordModel(id: 'f6', word: 'bread', translation: '面包', emoji: '🍞', category: 'foods'),
];

/// 词汇数据 - 身体部位篇
const List<WordModel> bodyPartsData = [
  WordModel(id: 'b1', word: 'head', translation: '头', emoji: '🗣️', category: 'body'),
  WordModel(id: 'b2', word: 'eyes', translation: '眼睛', emoji: '👀', category: 'body'),
  WordModel(id: 'b3', word: 'nose', translation: '鼻子', emoji: '👃', category: 'body'),
  WordModel(id: 'b4', word: 'mouth', translation: '嘴巴', emoji: '👄', category: 'body'),
  WordModel(id: 'b5', word: 'ears', translation: '耳朵', emoji: '👂', category: 'body'),
  WordModel(id: 'b6', word: 'hands', translation: '手', emoji: '✋', category: 'body'),
  WordModel(id: 'b7', word: 'legs', translation: '腿', emoji: '🦵', category: 'body'),
  WordModel(id: 'b8', word: 'feet', translation: '脚', emoji: '🦶', category: 'body'),
];

/// 获取所有主题数据
Map<String, List<WordModel>> getAllWords() => {
      'colors': colorsData,
      'numbers': numbersData,
      'animals': animalsData,
      'foods': foodsData,
      'body': bodyPartsData,
    };

/// 获取主题名称（中文）
String getCategoryName(String category) {
  switch (category) {
    case 'colors':
      return '颜色篇';
    case 'numbers':
      return '数字篇';
    case 'animals':
      return '动物篇';
    case 'foods':
      return '食物篇';
    case 'body':
      return '身体篇';
    case 'chinese':
      return '语文篇';
    default:
      return category;
  }
}

/// 获取主题emoji
String getCategoryEmoji(String category) {
  switch (category) {
    case 'colors':
      return '🎨';
    case 'numbers':
      return '🔢';
    case 'animals':
      return '🐾';
    case 'foods':
      return '🍎';
    case 'body':
      return '💪';
    case 'chinese':
      return '🇨🇳';
    default:
      return '📚';
  }
}
