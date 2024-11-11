import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:adaptive_layout_manager/src/adaptive_padding.dart';

void main() {
  group('AdaptivePadding Tests', () {
    testWidgets('Applies small padding on small screens',
        (WidgetTester tester) async {
          tester.view.physicalSize = const Size(400, 800);
          tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
          body: AdaptivePadding(
            smallPadding: EdgeInsets.all(4.0),
            mediumPadding: EdgeInsets.all(8.0),
            largePadding: EdgeInsets.all(16.0),
            child: Text('Test Padding'),
          ),
        ),
      ));

      final padding = tester.widget<Padding>(find.byType(Padding));
      expect(padding.padding, const EdgeInsets.all(4.0));
    });
  });
}
