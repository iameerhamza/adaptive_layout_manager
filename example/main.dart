import 'package:adaptive_layout_manager/src/adaptive_layout.dart';
import 'package:adaptive_layout_manager/src/adaptive_text.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adaptive Layout Manager',
      home: Scaffold(
        appBar: AppBar(title: const Text('Adaptive Layout Example')),
        body: const AdaptiveLayout(
          smallScreen: Center(child: AdaptiveText('Small Screen')),
          mediumScreen: Center(child: AdaptiveText('Medium Screen')),
          largeScreen: Center(child: AdaptiveText('Large Screen')),
        ),
      ),
    );
  }
}
