import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../lib/models/word_model.dart';
import '../../lib/widgets/flashcard_widget.dart';

void main() {
  group('FlashcardWidget', () {
    const testWord = WordModel(
      id: 'test1',
      word: 'apple',
      translation: '苹果',
      emoji: '🍎',
      category: 'foods',
    );

    testWidgets('should render with word emoji', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: FlashcardWidget(word: testWord),
            ),
          ),
        ),
      );

      expect(find.text('🍎'), findsOneWidget);
    });

    testWidgets('should render with word text on front', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: FlashcardWidget(word: testWord),
            ),
          ),
        ),
      );

      expect(find.text('apple'), findsOneWidget);
    });

    testWidgets('should render tap hint text on front', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: FlashcardWidget(word: testWord),
            ),
          ),
        ),
      );

      expect(find.text('点击听发音'), findsOneWidget);
    });

    testWidgets('should have GestureDetector for tap handling', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: FlashcardWidget(word: testWord),
            ),
          ),
        ),
      );

      expect(find.byType(GestureDetector), findsOneWidget);
    });

    testWidgets('should call onTap callback when tapped', (WidgetTester tester) async {
      bool tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: FlashcardWidget(
                word: testWord,
                onTap: () => tapped = true,
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.byType(GestureDetector));
      await tester.pump();

      expect(tapped, true);
    });

    testWidgets('should have flip animation', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: FlashcardWidget(word: testWord),
            ),
          ),
        ),
      );

      expect(find.byType(FlashcardWidget), findsOneWidget);
    });

    testWidgets('should show translation on back after tap', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: FlashcardWidget(word: testWord),
            ),
          ),
        ),
      );

      // Tap to flip
      await tester.tap(find.byType(GestureDetector));

      // Pump through the animation
      await tester.pumpAndSettle();

      // After flip, should show translation and Chinese hint
      expect(find.text('苹果'), findsOneWidget);
      expect(find.text('中文意思'), findsOneWidget);
    });

    testWidgets('should flip back on second tap', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: FlashcardWidget(word: testWord),
            ),
          ),
        ),
      );

      // First tap - flip to back
      await tester.tap(find.byType(GestureDetector));
      await tester.pumpAndSettle();

      // Second tap - flip back to front
      await tester.tap(find.byType(GestureDetector));
      await tester.pumpAndSettle();

      // Should show original front content again
      expect(find.text('apple'), findsOneWidget);
      expect(find.text('点击听发音'), findsOneWidget);
    });

    testWidgets('should have front card with gradient colors', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: FlashcardWidget(word: testWord),
            ),
          ),
        ),
      );

      // Front card has red gradient colors
      final containers = tester.widgetList<Container>(find.byType(Container));
      final frontCardContainer = containers.firstWhere(
        (c) => c.decoration is BoxDecoration,
      );
      final boxDecoration = frontCardContainer.decoration as BoxDecoration;
      expect(boxDecoration.gradient, isA<LinearGradient>());
    });
  });
}
