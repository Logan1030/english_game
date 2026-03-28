import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:english_game/screens/game_screen.dart';
import 'package:english_game/data/words_data.dart';
import 'package:english_game/utils/storage_helper.dart';
import 'package:english_game/widgets/flashcard_widget.dart';
import 'package:english_game/widgets/matching_card.dart';
import 'package:english_game/widgets/progress_bar.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
    StorageHelper.reset();
    StorageHelper.init();
  });

  group('GameScreen Integration Tests', () {
    testWidgets('should display category name in app bar', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: GameScreen(category: 'colors'),
        ),
      );

      expect(find.text('颜色篇'), findsOneWidget);
    });

    testWidgets('should display back button', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: GameScreen(category: 'colors'),
        ),
      );

      expect(find.byIcon(Icons.arrow_back), findsOneWidget);
    });

    testWidgets('should display progress bar', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: GameScreen(category: 'colors'),
        ),
      );

      expect(find.byType(ProgressBar), findsOneWidget);
    });

    testWidgets('should display current card index', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: GameScreen(category: 'colors'),
        ),
      );

      // Should show "1 / 6" for colors (6 cards)
      expect(find.text('1 / 6'), findsOneWidget);
    });

    testWidgets('should display flashcard widget', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: GameScreen(category: 'colors'),
        ),
      );

      expect(find.byType(FlashcardWidget), findsOneWidget);
    });

    testWidgets('should navigate to next card', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: GameScreen(category: 'colors'),
        ),
      );

      // Find and tap the "下一个" button
      await tester.tap(find.text('下一个'));
      await tester.pumpAndSettle();

      // Should show "2 / 6"
      expect(find.text('2 / 6'), findsOneWidget);
    });

    testWidgets('should navigate to previous card', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: GameScreen(category: 'colors'),
        ),
      );

      // First go to next
      await tester.tap(find.text('下一个'));
      await tester.pumpAndSettle();

      // Then go back
      await tester.tap(find.text('上一个'));
      await tester.pumpAndSettle();

      // Should show "1 / 6" again
      expect(find.text('1 / 6'), findsOneWidget);
    });

    testWidgets('should display speak button', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: GameScreen(category: 'colors'),
        ),
      );

      expect(find.text('听发音'), findsOneWidget);
      expect(find.byIcon(Icons.play_arrow), findsOneWidget);
    });

    testWidgets('should show start matching button on last card', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: GameScreen(category: 'colors'),
        ),
      );

      // Navigate to the last card (6th card)
      for (int i = 0; i < 5; i++) {
        await tester.tap(find.text('下一个'));
        await tester.pumpAndSettle();
      }

      // Should show "开始配对" instead of "下一个"
      expect(find.text('开始配对'), findsOneWidget);
    });

    testWidgets('should navigate back when back button pressed', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: GameScreen(category: 'colors'),
        ),
      );

      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pumpAndSettle();

      // Should go back (pop) - in test context this will remove the screen
      // We can verify the GameScreen is no longer visible
      expect(find.text('颜色篇'), findsNothing);
    });

    testWidgets('should switch to matching mode when starting matching game', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: GameScreen(category: 'colors'),
        ),
      );

      // Navigate to the last card
      for (int i = 0; i < 5; i++) {
        await tester.tap(find.text('下一个'));
        await tester.pumpAndSettle();
      }

      // Tap start matching
      await tester.tap(find.text('开始配对'));
      await tester.pumpAndSettle();

      // Should show matching UI
      expect(find.text('配对: 0 / 4'), findsOneWidget);
      expect(find.text('尝试: 0'), findsOneWidget);
    });

    testWidgets('should display matching grid with cards', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: GameScreen(category: 'colors'),
        ),
      );

      // Navigate to matching mode
      for (int i = 0; i < 5; i++) {
        await tester.tap(find.text('下一个'));
        await tester.pumpAndSettle();
      }
      await tester.tap(find.text('开始配对'));
      await tester.pumpAndSettle();

      // Should show matching cards in a grid
      expect(find.byType(GridView), findsOneWidget);
      expect(find.byType(MatchingCard), findsNWidgets(8)); // 4 pairs = 8 cards
    });

    testWidgets('should return to learning mode from matching', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: GameScreen(category: 'colors'),
        ),
      );

      // Navigate to matching mode
      for (int i = 0; i < 5; i++) {
        await tester.tap(find.text('下一个'));
        await tester.pumpAndSettle();
      }
      await tester.tap(find.text('开始配对'));
      await tester.pumpAndSettle();

      // Tap return to learning mode
      await tester.tap(find.text('返回学习模式'));
      await tester.pumpAndSettle();

      // Should show learning UI again
      expect(find.text('1 / 6'), findsOneWidget);
    });
  });
}
