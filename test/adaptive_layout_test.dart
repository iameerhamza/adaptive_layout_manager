import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:adaptive_layout_manager/src/adaptive_layout.dart';

void main() {
  group('AdaptiveLayout Tests', () {
    testWidgets('Displays smallScreen widget on small screens', (WidgetTester tester) async {
      // Set up the screen size and pixel ratio using the new API
      tester.view.physicalSize = const Size(400, 800);
      tester.view.devicePixelRatio = 1.0;

      // Ensure that the screen size is reset after the test
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      // Build the widget tree
      await tester.pumpWidget(const MaterialApp(
        home: AdaptiveLayout(
          smallScreen: Text('Small Screen'),
          mediumScreen: Text('Medium Screen'),
          largeScreen: Text('Large Screen'),
        ),
      ));

      // Verify that the correct widget is displayed for small screens
      expect(find.text('Small Screen'), findsOneWidget);
      expect(find.text('Medium Screen'), findsNothing);
      expect(find.text('Large Screen'), findsNothing);
    });

    testWidgets('Displays mediumScreen widget on medium screens', (WidgetTester tester) async {
      // Set up the screen size and pixel ratio for medium screens
      tester.view.physicalSize = const Size(800, 1024);
      tester.view.devicePixelRatio = 1.0;

      // Ensure that the screen size is reset after the test
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      // Build the widget tree
      await tester.pumpWidget(const MaterialApp(
        home: AdaptiveLayout(
          smallScreen: Text('Small Screen'),
          mediumScreen: Text('Medium Screen'),
          largeScreen: Text('Large Screen'),
        ),
      ));

      // Verify that the correct widget is displayed for medium screens
      expect(find.text('Small Screen'), findsNothing);
      expect(find.text('Medium Screen'), findsOneWidget);
      expect(find.text('Large Screen'), findsNothing);
    });

    testWidgets('Displays largeScreen widget on large screens', (WidgetTester tester) async {
      // Set up the screen size and pixel ratio for large screens
      tester.view.physicalSize = const Size(1440, 900);
      tester.view.devicePixelRatio = 1.0;

      // Ensure that the screen size is reset after the test
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      // Build the widget tree
      await tester.pumpWidget(const MaterialApp(
        home: AdaptiveLayout(
          smallScreen: Text('Small Screen'),
          mediumScreen: Text('Medium Screen'),
          largeScreen: Text('Large Screen'),
        ),
      ));

      // Verify that the correct widget is displayed for large screens
      expect(find.text('Small Screen'), findsNothing);
      expect(find.text('Medium Screen'), findsNothing);
      expect(find.text('Large Screen'), findsOneWidget);
    });
  });
}