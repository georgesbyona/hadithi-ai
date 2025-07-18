import 'package:flutter/material.dart';

import '../../../ui.dart';

class LogOutButton extends StatelessWidget {
  final VoidCallback onPressed;
  const LogOutButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.all(10),
      width: 150,
      height: 50,
      child: FilledButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 5,
          children: [
            MiIcons.logout(context),
            Text(
              'Logout',
              style: textTheme.bodyLarge!.copyWith(
                color: colorScheme.onPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
