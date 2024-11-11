import 'package:adaptive_layout_manager/src/responsvie_utilities.dart';
import 'package:flutter/material.dart';

class AdaptiveGridView extends StatelessWidget {
  final List<Widget> children;
  final double smallGridCount;
  final double mediumGridCount;
  final double largeGridCount;

  const AdaptiveGridView({
    required this.children,
    this.smallGridCount = 2,
    this.mediumGridCount = 4,
    this.largeGridCount = 6,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    int gridCount = ResponsiveUtilities.isLargeScreen(context)
        ? largeGridCount.toInt()
        : ResponsiveUtilities.isMediumScreen(context)
        ? mediumGridCount.toInt()
        : smallGridCount.toInt();

    return GridView.count(
      crossAxisCount: gridCount,
      children: children,
    );
  }
}