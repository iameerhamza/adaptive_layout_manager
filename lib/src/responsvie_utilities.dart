import 'package:flutter/material.dart';
import 'breakpoints.dart';

class ResponsiveUtilities {
  static bool isSmallScreen(BuildContext context) =>
      MediaQuery.of(context).size.width < Breakpoints.small;

  static bool isMediumScreen(BuildContext context) =>
      MediaQuery.of(context).size.width >= Breakpoints.small &&
      MediaQuery.of(context).size.width < Breakpoints.medium;

  static bool isLargeScreen(BuildContext context) =>
      MediaQuery.of(context).size.width >= Breakpoints.medium;

  static bool isPortrait(BuildContext context) =>
      MediaQuery.of(context).orientation == Orientation.portrait;

  static bool isLandscape(BuildContext context) =>
      MediaQuery.of(context).orientation == Orientation.landscape;
}
