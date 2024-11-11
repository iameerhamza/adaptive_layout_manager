import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:adaptive_layout_manager/src/adaptive_text.dart';

void main() {
  group('AdaptiveText Tests', () {
    testWidgets('Scales font size on small screens', (WidgetTester tester) async {
      tester.binding.window.physicalSizeTestValue = const Size(400, 800);
      tester.binding.window.devicePixelRatioTestValue = 1.0;

      await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
          body: AdaptiveText('Test', baseFontSize: 16),
        ),
      ));

      final text = tester.widget<Text>(find.text('Test'));
      expect(text.style?.fontSize, 16);
    });

    testWidgets('Scales font size on large screens', (WidgetTester tester) async {
      tester.binding.window.physicalSizeTestValue = const Size(1440, 900);
      tester.binding.window.devicePixelRatioTestValue = 1.0;

      await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
          body: AdaptiveText('Test', baseFontSize: 16),
        ),
      ));

      final text = tester.widget<Text>(find.text('Test'));
      expect(text.style?.fontSize, 22.4); // 16 * 1.4 scaling factor
    });
  });
}