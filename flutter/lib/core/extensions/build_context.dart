import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  void showTextSnackBar({required String message}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  ThemeData get theme => Theme.of(this);

  double get height => MediaQuery.sizeOf(this).height;
  double get width => MediaQuery.sizeOf(this).width;
}
