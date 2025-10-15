import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hello_color_app/ui/features/home/home_page.dart';
import 'package:hello_color_app/ui/features/home/widgets/color_panel.dart';
import 'package:hello_color_app/ui/shared/extensions/color.dart';

void main() {
  group('HomePage', () {
    const initialColor = Colors.white;

    Color? getCurrrentColor(WidgetTester tester) {
      final containerFinder = find.byType(AnimatedContainer);
      final colorContainer = tester.widget<AnimatedContainer>(containerFinder);
      final decoration = colorContainer.decoration as BoxDecoration?;
      return decoration?.color;
    }

    testWidgets('should init with correct color', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: HomePage()));
      expect(getCurrrentColor(tester), initialColor);
    });

    testWidgets('should change color when tapped', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: HomePage()));

      await tester.tap(find.byType(ColorPanel));
      await tester.pump();

      expect(getCurrrentColor(tester), isNot(initialColor));
    });

    testWidgets('should show reset button when tap count is greater than 3', (
      tester,
    ) async {
      await tester.pumpWidget(const MaterialApp(home: HomePage()));

      expect(find.byIcon(Icons.refresh), findsNothing);

      await tester.tap(find.byType(ColorPanel));
      await tester.tap(find.byType(ColorPanel));
      await tester.tap(find.byType(ColorPanel));
      await tester.tap(find.byType(ColorPanel));
      await tester.pump();

      expect(find.byIcon(Icons.refresh), findsOneWidget);
    });

    testWidgets('should show the correct tap count', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: HomePage()));

      expect(find.text('Tap count: 0'), findsOneWidget);

      await tester.tap(find.byType(ColorPanel));
      await tester.tap(find.byType(ColorPanel));
      await tester.tap(find.byType(ColorPanel));
      await tester.pump();

      expect(find.text('Tap count: 3'), findsOneWidget);
    });

    testWidgets('should show the color in hex format', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: HomePage()));

      expect(find.text(initialColor.toHexString()), findsOneWidget);

      await tester.tap(find.byType(ColorPanel));
      await tester.pump();

      expect(find.text(initialColor.toHexString()), findsNothing);
    });

    testWidgets('should reset the color when reset button is tapped', (
      tester,
    ) async {
      await tester.pumpWidget(const MaterialApp(home: HomePage()));

      await tester.tap(find.byType(ColorPanel));
      await tester.tap(find.byType(ColorPanel));
      await tester.tap(find.byType(ColorPanel));
      await tester.tap(find.byType(ColorPanel));
      await tester.pump();

      expect(getCurrrentColor(tester), isNot(initialColor));
      expect(find.text(initialColor.toHexString()), findsNothing);

      await tester.tap(find.byIcon(Icons.refresh));
      await tester.pump();

      expect(getCurrrentColor(tester), initialColor);
      expect(find.text(initialColor.toHexString()), findsOneWidget);
      expect(find.byIcon(Icons.refresh), findsNothing);
    });
  });
}
