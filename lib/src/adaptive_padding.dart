import 'package:adaptive_layout_manager/src/responsvie_utilities.dart';
import 'package:flutter/material.dart';

/// A widget that provides adaptive padding based on screen size.
///
/// - `smallPadding`, `mediumPadding`, and `largePadding` can be specified
///   for different screen sizes (small, medium, large).
/// - If specific padding values are not provided, it defaults to `EdgeInsets.all(8.0)`.
class AdaptivePadding extends StatelessWidget {
  final EdgeInsets? smallPadding;
  final EdgeInsets? mediumPadding;
  final EdgeInsets? largePadding;
  final Widget child;

  const AdaptivePadding({
    required this.child,
    this.smallPadding,
    this.mediumPadding,
    this.largePadding,
    Key? key,
  }) : super(key: key);

  EdgeInsets _getPadding(BuildContext context) {
    if (ResponsiveUtilities.isLargeScreen(context) && largePadding != null) {
      return largePadding!;
    } else if (ResponsiveUtilities.isMediumScreen(context) &&
        mediumPadding != null) {
      return mediumPadding!;
    } else if (smallPadding != null) {
      return smallPadding!;
    }
    // Default padding if none specified
    return const EdgeInsets.all(8.0);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _getPadding(context),
      child: child,
    );
  }
}
