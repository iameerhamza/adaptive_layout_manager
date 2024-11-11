import 'package:adaptive_layout_manager/src/responsvie_utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ResponsiveUtilities Tests', () {
    testWidgets('Detects small screens correctly', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(400, 800);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(const MaterialApp(home: Scaffold()));

      expect(
          ResponsiveUtilities.isSmallScreen(
              tester.element(find.byType(Scaffold))),
          true);
      expect(
          ResponsiveUtilities.isMediumScreen(
              tester.element(find.byType(Scaffold))),
          false);
      expect(
          ResponsiveUtilities.isLargeScreen(
              tester.element(find.byType(Scaffold))),
          false);
    });

    testWidgets('Detects medium screens correctly',
        (WidgetTester tester) async {
          tester.view.physicalSize = const Size(800, 1024);
          tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(const MaterialApp(home: Scaffold()));

      expect(
          ResponsiveUtilities.isSmallScreen(
              tester.element(find.byType(Scaffold))),
          false);
      expect(
          ResponsiveUtilities.isMediumScreen(
              tester.element(find.byType(Scaffold))),
          true);
      expect(
          ResponsiveUtilities.isLargeScreen(
              tester.element(find.byType(Scaffold))),
          false);
    });

    testWidgets('Detects large screens correctly', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1440, 900);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(const MaterialApp(home: Scaffold()));

      expect(
          ResponsiveUtilities.isSmallScreen(
              tester.element(find.byType(Scaffold))),
          false);
      expect(
          ResponsiveUtilities.isMediumScreen(
              tester.element(find.byType(Scaffold))),
          false);
      expect(
          ResponsiveUtilities.isLargeScreen(
              tester.element(find.byType(Scaffold))),
          true);
    });
  });
}
