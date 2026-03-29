import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../lib/screens/home_screen.dart';
import '../../lib/utils/storage_helper.dart';
import '../../lib/app.dart';

void main() {
  setUp(() {
    // Reset SharedPreferences mock and StorageHelper static state before each test
    SharedPreferences.setMockInitialValues({});
    StorageHelper.reset();
    StorageHelper.init();
  });

  group('HomeScreen Integration Tests', () {
    testWidgets('should display app title', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.theme,
          home: const HomeScreen(),
        ),
      );

      expect(find.text('英语小游戏'), findsOneWidget);
    });

    testWidgets('should display subtitle', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.theme,
          home: const HomeScreen(),
        ),
      );

      expect(find.text('一起学英语吧！'), findsOneWidget);
    });

    testWidgets('should display reset button', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.theme,
          home: const HomeScreen(),
        ),
      );

      expect(find.text('家长模式：重置进度'), findsOneWidget);
    });

    testWidgets('should show reset confirmation dialog on tap', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.theme,
          home: const HomeScreen(),
        ),
      );

      // Tap reset button
      await tester.tap(find.text('家长模式：重置进度'));
      await tester.pumpAndSettle();

      // Dialog should appear
      expect(find.text('重置进度'), findsWidgets);
      expect(find.text('确定要重置所有学习进度吗？'), findsOneWidget);
      expect(find.text('取消'), findsOneWidget);
      expect(find.text('确定重置'), findsOneWidget);
    });

    testWidgets('should dismiss dialog on cancel', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.theme,
          home: const HomeScreen(),
        ),
      );

      // Tap reset button
      await tester.tap(find.text('家长模式：重置进度'));
      await tester.pumpAndSettle();

      // Tap cancel
      await tester.tap(find.text('取消'));
      await tester.pumpAndSettle();

      // Dialog should be dismissed
      expect(find.text('确定要重置所有学习进度吗？'), findsNothing);
    });

    testWidgets('should display GridView for categories', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.theme,
          home: const HomeScreen(),
        ),
      );

      expect(find.byType(GridView), findsOneWidget);
    });

    testWidgets('should have 2 columns in category grid', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.theme,
          home: const HomeScreen(),
        ),
      );

      final gridView = tester.widget<GridView>(find.byType(GridView));
      final delegate = gridView.gridDelegate as SliverGridDelegateWithFixedCrossAxisCount;
      expect(delegate.crossAxisCount, 2);
    });

    testWidgets('should render HomeScreen successfully', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.theme,
          home: const HomeScreen(),
        ),
      );

      // Verify HomeScreen renders
      expect(find.byType(HomeScreen), findsOneWidget);

      // Verify title and subtitle are visible
      expect(find.text('英语小游戏'), findsOneWidget);
      expect(find.text('一起学英语吧！'), findsOneWidget);

      // Verify GridView is present
      expect(find.byType(GridView), findsOneWidget);
    });
  });
}
