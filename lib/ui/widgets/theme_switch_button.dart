import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../ui.dart';

class ThemeSwitchButton extends StatelessWidget {
  const ThemeSwitchButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<GeneralProvider>(context, listen: false);
    return Switch(
      value: theme.isDark,
      onChanged: (value) {
        theme.changeTheme(value);
      },
    );
  }
}
