import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';

part '_skelton.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).brightness == Brightness.light
          ? AppColors.shimmerLightBase
          : AppColors.shimmerDarkBase,
      highlightColor: Theme.of(context).brightness == Brightness.light
          ? AppColors.shimmerLightHighlight
          : AppColors.shimmerDarkHighlight,
      child: child,
    );
  }
}
