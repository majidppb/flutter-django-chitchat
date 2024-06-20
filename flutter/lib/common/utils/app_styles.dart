import 'package:flutter/material.dart';

sealed class AppStyles {
  static const nullWidget = SizedBox.shrink();

// ===== Padding
  static const hPadding8 = EdgeInsets.symmetric(horizontal: 8.0);
  static const hPadding20 = EdgeInsets.symmetric(horizontal: 20.0);

  static const vPadding8 = EdgeInsets.symmetric(vertical: 8.0);
  static const vPadding20 = EdgeInsets.symmetric(vertical: 20.0);

  static const padding8 = EdgeInsets.all(8.0);
  static const padding20 = EdgeInsets.all(20.0);

  static const paddingMessage =
      EdgeInsets.symmetric(horizontal: 10, vertical: 8);

// ===== Border Radius
  static const borderRadius5 = BorderRadius.all(Radius.circular(5));
  static const borderRadius8 = BorderRadius.all(Radius.circular(8));
  static const borderRadius16 = BorderRadius.all(Radius.circular(16));
  static const borderRadius30 = BorderRadius.all(Radius.circular(30));

// ===== Height
  static const height5 = SizedBox(height: 5);
  static const height10 = SizedBox(height: 10);
  static const height20 = SizedBox(height: 20);
  static const height30 = SizedBox(height: 30);
  static const height50 = SizedBox(height: 50);
  static const height80 = SizedBox(height: 80);
  static const height100 = SizedBox(height: 100);

// ===== Width
  static const width5 = SizedBox(width: 5);
  static const width10 = SizedBox(width: 10);

// ===== Duration
  static const animationDuration150 = Duration(milliseconds: 150);
}
