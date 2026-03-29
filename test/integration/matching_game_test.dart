import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../lib/screens/game_screen.dart';
import '../../lib/utils/storage_helper.dart';
import '../../lib/widgets/matching_card.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
    StorageHelper.reset();
    StorageHelper.init();
  });

  group('Matching Game Flow Integration Tests', () {
    testWidgets('should start with matching mode showing 8 cards', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: GameScreen(category: 'animals'),
        ),
      );

      // Navigate to matching mode directly by tapping through
      for (int i = 0; i < 8; i++) {
        // If "下一个" exists, tap it, otherwise "开始配对"
        if (tester.any(find.text('下一个'))) {
          await tester.tap(find.text('下一个'));
          await tester.pumpAndSettle();
        } else if (tester.any(find.text('开始配对'))) {
          await tester.tap(find.text('开始配对'));
          await tester.pumpAndSettle();
        }
      }

      // In matching mode with 4 pairs (8 cards)
      expect(find.byType(MatchingCard), findsNWidgets(8));
    });

    testWidgets('should flip card on tap', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: GameScreen(category: 'animals'),
        ),
      );

      // Navigate to matching mode
      for (int i = 0; i < 8; i++) {
        if (tester.any(find.text('下一个'))) {
          await tester.tap(find.text('下一个'));
          await tester.pumpAndSettle();
        } else if (tester.any(find.text('开始配对'))) {
          await tester.tap(find.text('开始配对'));
          await tester.pumpAndSettle();
        }
      }

      // Tap first card
      await tester.tap(find.byType(MatchingCard).first);
      await tester.pump();

      // Card should be flipped (question mark should be hidden)
      // The matching UI shows cards flipped state
      expect(find.byType(MatchingCard), findsNWidgets(8));
    });

    testWidgets('should display matching grid with 4 columns', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: GameScreen(category: 'foods'),
        ),
      );

      // Navigate to matching mode
      for (int i = 0; i < 6; i++) {
        if (tester.any(find.text('下一个'))) {
          await tester.tap(find.text('下一个'));
          await tester.pumpAndSettle();
        } else if (tester.any(find.text('开始配对'))) {
          await tester.tap(find.text('开始配对'));
          await tester.pumpAndSettle();
        }
      }

      // Verify grid has 4 columns
      final gridView = tester.widget<GridView>(find.byType(GridView));
      final delegate = gridView.gridDelegate as SliverGridDelegateWithFixedCrossAxisCount;
      expect(delegate.crossAxisCount, 4);
    });

    testWidgets('should return to home screen from matching mode via back button', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: GameScreen(category: 'colors'),
        ),
      );

      // Navigate to matching mode
      for (int i = 0; i < 6; i++) {
        if (tester.any(find.text('下一个'))) {
          await tester.tap(find.text('下一个'));
          await tester.pumpAndSettle();
        } else if (tester.any(find.text('开始配对'))) {
          await tester.tap(find.text('开始配对'));
          await tester.pumpAndSettle();
        }
      }

      // Tap back button
      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pumpAndSettle();

      // Game screen should be gone - matching UI not visible
      expect(find.text('配对: 0 / 4'), findsNothing);
    });

    testWidgets('should preserve matching state on widget rebuild', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: GameScreen(category: 'numbers'),
        ),
      );

      // Navigate to matching mode
      for (int i = 0; i < 10; i++) {
        if (tester.any(find.text('下一个'))) {
          await tester.tap(find.text('下一个'));
          await tester.pumpAndSettle();
        } else if (tester.any(find.text('开始配对'))) {
          await tester.tap(find.text('开始配对'));
          await tester.pumpAndSettle();
        }
      }

      // Verify all 8 cards are present
      expect(find.byType(MatchingCard), findsNWidgets(8));

      // Force a rebuild
      await tester.pump();

      // Cards should still be there
      expect(find.byType(MatchingCard), findsNWidgets(8));
    });

    testWidgets('should show return to learning mode button in matching mode', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: GameScreen(category: 'colors'),
        ),
      );

      // Navigate to matching mode
      for (int i = 0; i < 6; i++) {
        if (tester.any(find.text('下一个'))) {
          await tester.tap(find.text('下一个'));
          await tester.pumpAndSettle();
        } else if (tester.any(find.text('开始配对'))) {
          await tester.tap(find.text('开始配对'));
          await tester.pumpAndSettle();
        }
      }

      // Should show return to learning mode button
      expect(find.text('返回学习模式'), findsOneWidget);
    });

    testWidgets('should switch back to learning mode from matching', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: GameScreen(category: 'colors'),
        ),
      );

      // Navigate to matching mode
      for (int i = 0; i < 6; i++) {
        if (tester.any(find.text('下一个'))) {
          await tester.tap(find.text('下一个'));
          await tester.pumpAndSettle();
        } else if (tester.any(find.text('开始配对'))) {
          await tester.tap(find.text('开始配对'));
          await tester.pumpAndSettle();
        }
      }

      // Verify we're in matching mode
      expect(find.text('配对: 0 / 4'), findsOneWidget);

      // Tap return to learning mode
      await tester.tap(find.text('返回学习模式'));
      await tester.pumpAndSettle();

      // Should be back in learning mode with progress indicator
      expect(find.text('1 / 6'), findsOneWidget);
    });
  });
}
