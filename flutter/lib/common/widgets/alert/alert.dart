import 'package:flutter/material.dart';

import '../../utils/app_styles.dart';

class AlertPage extends StatelessWidget {
  const AlertPage({
    super.key,
    required String animation,
    required String description,
    required String buttonLabel,
    required void Function() onPressed,
  })  : _animation = animation,
        _description = description,
        _buttonLabel = buttonLabel,
        _onPressed = onPressed;

  final String _animation;
  final String _buttonLabel;
  final String _description;
  final void Function() _onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: AppStyles.hPadding20,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              _animation,
              width: double.infinity,
            ),
            AppStyles.height30,
            Text(
              _description,
              textAlign: TextAlign.center,
            ),
            AppStyles.height50,
            ElevatedButton(
              onPressed: _onPressed,
              child: Text(_buttonLabel),
            ),
          ],
        ),
      ),
    );
  }
}
