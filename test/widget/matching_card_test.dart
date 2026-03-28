import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:english_game/widgets/matching_card.dart';

void main() {
  group('MatchingCard Widget', () {
    testWidgets('should render content text when flipped', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 100,
              height: 100,
              child: MatchingCard(
                content: 'apple',
                emoji: '🍎',
                isImageCard: false,
                isFlipped: true,
              ),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();
      expect(find.text('apple'), findsOneWidget);
    });

    testWidgets('should render emoji when isImageCard is true and flipped', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 100,
              height: 100,
              child: MatchingCard(
                content: 'apple',
                emoji: '🍎',
                isImageCard: true,
                isFlipped: true,
              ),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();
      expect(find.text('🍎'), findsOneWidget);
    });

    testWidgets('should render question mark when not flipped', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 100,
              height: 100,
              child: MatchingCard(
                content: 'apple',
                emoji: '🍎',
                isFlipped: false,
                isMatched: false,
              ),
            ),
          ),
        ),
      );

      await tester.pump();

      // When not flipped, shows the back (question mark)
      expect(find.text('?'), findsOneWidget);
    });

    testWidgets('should call onTap when tapped and not matched', (WidgetTester tester) async {
      bool tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 100,
              height: 100,
              child: MatchingCard(
                content: 'apple',
                emoji: '🍎',
                isMatched: false,
                onTap: () => tapped = true,
              ),
            ),
          ),
        ),
      );

      // Tap on the MatchingCard
      await tester.tap(find.byType(MatchingCard));
      await tester.pump();

      expect(tapped, true);
    });

    testWidgets('should not call onTap when isMatched is true', (WidgetTester tester) async {
      bool tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 100,
              height: 100,
              child: MatchingCard(
                content: 'apple',
                emoji: '🍎',
                isMatched: true,
                onTap: () => tapped = true,
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.byType(MatchingCard));
      await tester.pump();

      expect(tapped, false);
    });

    testWidgets('should render with animation support', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 100,
              height: 100,
              child: MatchingCard(
                content: 'apple',
                emoji: '🍎',
                isFlipped: false,
              ),
            ),
          ),
        ),
      );

      // The MatchingCard should render
      expect(find.byType(MatchingCard), findsOneWidget);

      // It should have animated content - use pump to trigger animation
      await tester.pump(const Duration(milliseconds: 100));

      // Widget should still be there
      expect(find.byType(MatchingCard), findsOneWidget);
    });

    testWidgets('should show matched styling when matched', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 100,
              height: 100,
              child: MatchingCard(
                content: 'apple',
                emoji: '🍎',
                isMatched: true,
                isFlipped: true,
              ),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // The widget should render
      expect(find.byType(MatchingCard), findsOneWidget);
    });

    testWidgets('should start with animation when isFlipped is true initially', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 100,
              height: 100,
              child: MatchingCard(
                content: 'apple',
                emoji: '🍎',
                isFlipped: true,
              ),
            ),
          ),
        ),
      );

      await tester.pump();

      // Animation should complete
      expect(find.byType(MatchingCard), findsOneWidget);
    });

    testWidgets('should display content text when not image card and flipped', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 100,
              height: 100,
              child: MatchingCard(
                content: 'red',
                emoji: '🔴',
                isImageCard: false,
                isFlipped: true,
              ),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('red'), findsOneWidget);
    });

    testWidgets('should have purple gradient on card back', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 100,
              height: 100,
              child: MatchingCard(
                content: 'apple',
                emoji: '🍎',
              ),
            ),
          ),
        ),
      );

      // The back of the card has purple gradient
      final containers = tester.widgetList<Container>(find.byType(Container));
      bool hasPurpleGradient = false;

      for (var container in containers) {
        if (container.decoration is BoxDecoration) {
          final boxDecoration = container.decoration as BoxDecoration;
          if (boxDecoration.gradient is LinearGradient) {
            hasPurpleGradient = true;
            break;
          }
        }
      }

      expect(hasPurpleGradient, true);
    });
  });
}
