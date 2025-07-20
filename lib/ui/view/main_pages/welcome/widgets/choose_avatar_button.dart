import 'package:flutter/material.dart';

import '../../../../../domain/domain.dart';

class ChooseAvatarButton extends StatelessWidget {
  final VoidCallback onPressed;
  const ChooseAvatarButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final colorScheme = ThemeUtils.colorScheme(context);
    final textTheme = ThemeUtils.textTheme(context);
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: FilledButton(
        onPressed: onPressed,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Text(
            "Start",
            style: textTheme.headlineSmall!.copyWith(
              color: colorScheme.onPrimary,
              letterSpacing: 1,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
