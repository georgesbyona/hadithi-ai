import 'package:flutter/material.dart';

class SettingMenu extends StatelessWidget {
  final String text;
  final Widget icon;
  final VoidCallback? onTap;
  const SettingMenu({
    super.key,
    required this.text,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: text == "Logout"
                  ? textTheme.bodyLarge!.copyWith(color: colorScheme.error)
                  : textTheme.bodyLarge,
            ),
            icon,
          ],
        ),
      ),
    );
  }
}
