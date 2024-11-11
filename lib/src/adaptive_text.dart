import 'package:flutter/material.dart';

class AdaptiveText extends StatelessWidget {
  final String text;
  final double baseFontSize;
  final TextStyle? style;

  const AdaptiveText(
      this.text, {
        this.baseFontSize = 16,
        this.style,
        super.key,
      });

  double _getAdaptiveFontSize(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth < 600) {
      return baseFontSize; // Mobile
    } else if (screenWidth < 1024) {
      return baseFontSize * 1.2; // Tablet
    } else {
      return baseFontSize * 1.4; // Desktop
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style?.copyWith(fontSize: _getAdaptiveFontSize(context)) ??
          TextStyle(fontSize: _getAdaptiveFontSize(context)),
    );
  }
}