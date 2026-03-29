import 'package:flutter_test/flutter_test.dart';
import '../../lib/data/words_data.dart';

void main() {
  group('words_data', () {
    group('colorsData', () {
      test('should have 6 color words', () {
        expect(colorsData.length, 6);
      });

      test('should have valid word structure', () {
        for (final word in colorsData) {
          expect(word.id, isNotEmpty);
          expect(word.word, isNotEmpty);
          expect(word.translation, isNotEmpty);
          expect(word.emoji, isNotEmpty);
          expect(word.category, 'colors');
        }
      });

      test('should contain expected colors', () {
        final colorWords = colorsData.map((w) => w.word).toList();
        expect(colorWords, contains('red'));
        expect(colorWords, contains('blue'));
        expect(colorWords, contains('green'));
        expect(colorWords, contains('yellow'));
        expect(colorWords, contains('pink'));
        expect(colorWords, contains('orange'));
      });

      test('should have unique ids', () {
        final ids = colorsData.map((w) => w.id).toSet();
        expect(ids.length, colorsData.length);
      });
    });

    group('numbersData', () {
      test('should have 10 number words', () {
        expect(numbersData.length, 10);
      });

      test('should have valid word structure', () {
        for (final word in numbersData) {
          expect(word.id, isNotEmpty);
          expect(word.word, isNotEmpty);
          expect(word.translation, isNotEmpty);
          expect(word.emoji, isNotEmpty);
          expect(word.category, 'numbers');
        }
      });

      test('should contain numbers 1-10', () {
        final numberWords = numbersData.map((w) => w.word).toList();
        expect(numberWords, contains('one'));
        expect(numberWords, contains('two'));
        expect(numberWords, contains('three'));
        expect(numberWords, contains('four'));
        expect(numberWords, contains('five'));
        expect(numberWords, contains('six'));
        expect(numberWords, contains('seven'));
        expect(numberWords, contains('eight'));
        expect(numberWords, contains('nine'));
        expect(numberWords, contains('ten'));
      });

      test('should have unique ids', () {
        final ids = numbersData.map((w) => w.id).toSet();
        expect(ids.length, numbersData.length);
      });
    });

    group('animalsData', () {
      test('should have 8 animal words', () {
        expect(animalsData.length, 8);
      });

      test('should have valid word structure', () {
        for (final word in animalsData) {
          expect(word.id, isNotEmpty);
          expect(word.word, isNotEmpty);
          expect(word.translation, isNotEmpty);
          expect(word.emoji, isNotEmpty);
          expect(word.category, 'animals');
        }
      });

      test('should contain expected animals', () {
        final animalWords = animalsData.map((w) => w.word).toList();
        expect(animalWords, contains('cat'));
        expect(animalWords, contains('dog'));
        expect(animalWords, contains('bird'));
        expect(animalWords, contains('fish'));
        expect(animalWords, contains('rabbit'));
        expect(animalWords, contains('bear'));
        expect(animalWords, contains('lion'));
        expect(animalWords, contains('monkey'));
      });

      test('should have unique ids', () {
        final ids = animalsData.map((w) => w.id).toSet();
        expect(ids.length, animalsData.length);
      });
    });

    group('foodsData', () {
      test('should have 6 food words', () {
        expect(foodsData.length, 6);
      });

      test('should have valid word structure', () {
        for (final word in foodsData) {
          expect(word.id, isNotEmpty);
          expect(word.word, isNotEmpty);
          expect(word.translation, isNotEmpty);
          expect(word.emoji, isNotEmpty);
          expect(word.category, 'foods');
        }
      });

      test('should contain expected foods', () {
        final foodWords = foodsData.map((w) => w.word).toList();
        expect(foodWords, contains('apple'));
        expect(foodWords, contains('banana'));
        expect(foodWords, contains('milk'));
        expect(foodWords, contains('water'));
        expect(foodWords, contains('rice'));
        expect(foodWords, contains('bread'));
      });

      test('should have unique ids', () {
        final ids = foodsData.map((w) => w.id).toSet();
        expect(ids.length, foodsData.length);
      });
    });

    group('bodyPartsData', () {
      test('should have 8 body part words', () {
        expect(bodyPartsData.length, 8);
      });

      test('should have valid word structure', () {
        for (final word in bodyPartsData) {
          expect(word.id, isNotEmpty);
          expect(word.word, isNotEmpty);
          expect(word.translation, isNotEmpty);
          expect(word.emoji, isNotEmpty);
          expect(word.category, 'body');
        }
      });

      test('should contain expected body parts', () {
        final bodyWords = bodyPartsData.map((w) => w.word).toList();
        expect(bodyWords, contains('head'));
        expect(bodyWords, contains('eyes'));
        expect(bodyWords, contains('nose'));
        expect(bodyWords, contains('mouth'));
        expect(bodyWords, contains('ears'));
        expect(bodyWords, contains('hands'));
        expect(bodyWords, contains('legs'));
        expect(bodyWords, contains('feet'));
      });

      test('should have unique ids', () {
        final ids = bodyPartsData.map((w) => w.id).toSet();
        expect(ids.length, bodyPartsData.length);
      });
    });

    group('getAllWords', () {
      test('should return all 5 categories', () {
        final allWords = getAllWords();
        expect(allWords.keys.length, 5);
        expect(allWords.containsKey('colors'), true);
        expect(allWords.containsKey('numbers'), true);
        expect(allWords.containsKey('animals'), true);
        expect(allWords.containsKey('foods'), true);
        expect(allWords.containsKey('body'), true);
      });

      test('should return correct word counts per category', () {
        final allWords = getAllWords();
        expect(allWords['colors']!.length, 6);
        expect(allWords['numbers']!.length, 10);
        expect(allWords['animals']!.length, 8);
        expect(allWords['foods']!.length, 6);
        expect(allWords['body']!.length, 8);
      });

      test('should return total of 38 words', () {
        final allWords = getAllWords();
        int total = 0;
        for (var category in allWords.values) {
          total += category.length;
        }
        expect(total, 38);
      });
    });

    group('getCategoryName', () {
      test('should return Chinese category names', () {
        expect(getCategoryName('colors'), '颜色篇');
        expect(getCategoryName('numbers'), '数字篇');
        expect(getCategoryName('animals'), '动物篇');
        expect(getCategoryName('foods'), '食物篇');
        expect(getCategoryName('body'), '身体篇');
      });

      test('should return category itself for unknown category', () {
        expect(getCategoryName('unknown'), 'unknown');
        expect(getCategoryName(''), '');
      });
    });

    group('getCategoryEmoji', () {
      test('should return correct emojis', () {
        expect(getCategoryEmoji('colors'), '🎨');
        expect(getCategoryEmoji('numbers'), '🔢');
        expect(getCategoryEmoji('animals'), '🐾');
        expect(getCategoryEmoji('foods'), '🍎');
        expect(getCategoryEmoji('body'), '💪');
      });

      test('should return default emoji for unknown category', () {
        expect(getCategoryEmoji('unknown'), '📚');
        expect(getCategoryEmoji(''), '📚');
      });
    });
  });
}
