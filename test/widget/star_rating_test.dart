import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:english_game/widgets/star_rating.dart';

void main() {
  group('StarRating Widget', () {
    testWidgets('should render correct number of stars', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: StarRating(stars: 2, maxStars: 3),
          ),
        ),
      );

      // Find all star icons
      final starIcons = find.byIcon(Icons.star);
      final starBorderIcons = find.byIcon(Icons.star_border);

      expect(starIcons, findsNWidgets(2)); // 2 earned stars
      expect(starBorderIcons, findsNWidgets(1)); // 1 unearned star
    });

    testWidgets('should render 0 stars with all star_border icons', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: StarRating(stars: 0, maxStars: 3),
          ),
        ),
      );

      final starBorderIcons = find.byIcon(Icons.star_border);
      expect(starBorderIcons, findsNWidgets(3));
    });

    testWidgets('should render max stars with all filled star icons', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: StarRating(stars: 3, maxStars: 3),
          ),
        ),
      );

      // Pump animation
      await tester.pumpAndSettle();

      final starIcons = find.byIcon(Icons.star);
      expect(starIcons, findsNWidgets(3));
    });

    testWidgets('should use default maxStars of 3', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: StarRating(stars: 2),
          ),
        ),
      );

      await tester.pumpAndSettle();

      final starIcons = find.byIcon(Icons.star);
      final starBorderIcons = find.byIcon(Icons.star_border);

      expect(starIcons, findsNWidgets(2));
      expect(starBorderIcons, findsNWidgets(1));
    });

    testWidgets('should apply custom size', (WidgetTester tester) async {
      const customSize = 40.0;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: StarRating(stars: 2, maxStars: 3, size: customSize),
          ),
        ),
      );

      final iconWidget = tester.widget<Icon>(find.byType(Icon).first);
      expect(iconWidget.size, customSize);
    });

    testWidgets('should display earned stars with amber color', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: StarRating(stars: 2, maxStars: 3),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Find star icons and verify amber color for earned ones
      final iconWidgets = tester.widgetList<Icon>(find.byType(Icon));
      final amberStars = iconWidgets.where((icon) =>
        icon.icon == Icons.star && icon.color == Colors.amber
      );
      expect(amberStars.length, 2);
    });

    testWidgets('should display unearned stars with grey color', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: StarRating(stars: 1, maxStars: 3),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Find star_border icons and verify grey color
      final iconWidgets = tester.widgetList<Icon>(find.byType(Icon));
      final greyStars = iconWidgets.where((icon) =>
        icon.icon == Icons.star_border && icon.color == Colors.grey
      );
      expect(greyStars.length, 2);
    });
  });
}
