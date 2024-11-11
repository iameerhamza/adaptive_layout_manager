import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:adaptive_layout_manager/src/adaptive_layout.dart';

void main() {
  group('AdaptiveLayout Tests', () {
    testWidgets('Displays smallScreen widget on small screens', (WidgetTester tester) async {
      tester.binding.window.physicalSizeTestValue = const Size(400, 800);
      tester.binding.window.devicePixelRatioTestValue = 1.0;

      await tester.pumpWidget(const MaterialApp(
        home: AdaptiveLayout(
          smallScreen: Text('Small Screen'),
          mediumScreen: Text('Medium Screen'),
          largeScreen: Text('Large Screen'),
        ),
      ));

      expect(find.text('Small Screen'), findsOneWidget);
      expect(find.text('Medium Screen'), findsNothing);
      expect(find.text('Large Screen'), findsNothing);
    });

    testWidgets('Displays mediumScreen widget on medium screens', (WidgetTester tester) async {
      tester.binding.window.physicalSizeTestValue = const Size(800, 1024);
      tester.binding.window.devicePixelRatioTestValue = 1.0;

      await tester.pumpWidget(const MaterialApp(
        home: AdaptiveLayout(
          smallScreen: Text('Small Screen'),
          mediumScreen: Text('Medium Screen'),
          largeScreen: Text('Large Screen'),
        ),
      ));

      expect(find.text('Small Screen'), findsNothing);
      expect(find.text('Medium Screen'), findsOneWidget);
      expect(find.text('Large Screen'), findsNothing);
    });

    testWidgets('Displays largeScreen widget on large screens', (WidgetTester tester) async {
      tester.binding.window.physicalSizeTestValue = const Size(1440, 900);
      tester.binding.window.devicePixelRatioTestValue = 1.0;

      await tester.pumpWidget(const MaterialApp(
        home: AdaptiveLayout(
          smallScreen: Text('Small Screen'),
          mediumScreen: Text('Medium Screen'),
          largeScreen: Text('Large Screen'),
        ),
      ));

      expect(find.text('Small Screen'), findsNothing);
      expect(find.text('Medium Screen'), findsNothing);
      expect(find.text('Large Screen'), findsOneWidget);
    });
  });
}