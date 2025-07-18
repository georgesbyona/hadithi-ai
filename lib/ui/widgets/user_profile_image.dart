import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/domain.dart';
import '../ui.dart';

class UserProfileImage extends StatelessWidget {
  final double radius, fontSize;
  const UserProfileImage({
    super.key,
    required this.radius,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    final general = Provider.of<GeneralProvider>(context);
    final colorScheme = ThemeUtils.colorScheme(context);
    return CircleAvatar(
      radius: radius,
      backgroundColor: colorScheme.surfaceContainerLow,
      backgroundImage: general.userAvatar != null
          ? MemoryImage(general.userAvatar!)
          : null,
      child: general.userAvatar == null
          ? Text(
              general.currentUser.name.isNotEmpty
                  ? general.currentUser.name.substring(0, 1).toUpperCase()
                  : "",
              style: TextStyle(fontSize: fontSize),
              textAlign: TextAlign.center,
            )
          : null,
    );
  }
}
