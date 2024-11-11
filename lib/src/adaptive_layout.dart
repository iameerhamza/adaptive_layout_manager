import 'package:adaptive_layout_manager/src/responsvie_utilities.dart';
import 'package:flutter/material.dart';

class AdaptiveLayout extends StatelessWidget {
  final Widget smallScreen;
  final Widget? mediumScreen;
  final Widget? largeScreen;

  const AdaptiveLayout({
    required this.smallScreen,
    this.mediumScreen,
    this.largeScreen,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (ResponsiveUtilities.isLargeScreen(context) && largeScreen != null) {
      return largeScreen!;
    } else if (ResponsiveUtilities.isMediumScreen(context) &&
        mediumScreen != null) {
      return mediumScreen!;
    }
    return smallScreen;
  }
}