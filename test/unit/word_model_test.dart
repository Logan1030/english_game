import 'package:flutter_test/flutter_test.dart';
import 'package:english_game/models/word_model.dart';

void main() {
  group('WordModel', () {
    test('should create WordModel with all required fields', () {
      const word = WordModel(
        id: 'test1',
        word: 'apple',
        translation: '苹果',
        emoji: '🍎',
        category: 'foods',
      );

      expect(word.id, 'test1');
      expect(word.word, 'apple');
      expect(word.translation, '苹果');
      expect(word.emoji, '🍎');
      expect(word.category, 'foods');
    });

    test('should convert to JSON correctly', () {
      const word = WordModel(
        id: 'test1',
        word: 'apple',
        translation: '苹果',
        emoji: '🍎',
        category: 'foods',
      );

      final json = word.toJson();

      expect(json['id'], 'test1');
      expect(json['word'], 'apple');
      expect(json['translation'], '苹果');
      expect(json['emoji'], '🍎');
      expect(json['category'], 'foods');
    });

    test('should create from JSON correctly', () {
      final json = {
        'id': 'test1',
        'word': 'apple',
        'translation': '苹果',
        'emoji': '🍎',
        'category': 'foods',
      };

      final word = WordModel.fromJson(json);

      expect(word.id, 'test1');
      expect(word.word, 'apple');
      expect(word.translation, '苹果');
      expect(word.emoji, '🍎');
      expect(word.category, 'foods');
    });

    test('should handle round-trip JSON conversion', () {
      const original = WordModel(
        id: 'c1',
        word: 'red',
        translation: '红色',
        emoji: '🔴',
        category: 'colors',
      );

      final json = original.toJson();
      final restored = WordModel.fromJson(json);

      expect(restored.id, original.id);
      expect(restored.word, original.word);
      expect(restored.translation, original.translation);
      expect(restored.emoji, original.emoji);
      expect(restored.category, original.category);
    });

    test('should handle special characters in word', () {
      const word = WordModel(
        id: 'test1',
        word: "cat's",
        translation: '猫的',
        emoji: '🐱',
        category: 'animals',
      );

      expect(word.word, "cat's");
      final json = word.toJson();
      final restored = WordModel.fromJson(json);
      expect(restored.word, "cat's");
    });

    test('should handle Unicode emojis', () {
      const word = WordModel(
        id: 'test1',
        word: 'smile',
        translation: '微笑',
        emoji: '😀',
        category: 'other',
      );

      expect(word.emoji, '😀');
      final json = word.toJson();
      final restored = WordModel.fromJson(json);
      expect(restored.emoji, '😀');
    });
  });
}
