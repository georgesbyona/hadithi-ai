import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../domain/domain.dart';
import '../../../../ui.dart';

class AvatarDialog extends StatelessWidget {
  const AvatarDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final general = Provider.of<GeneralProvider>(context);
    final colorScheme = ThemeUtils.colorScheme(context);
    final textTheme = ThemeUtils.textTheme(context);
    return Dialog(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: SizedBox(
          width: 250,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 8,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                spacing: 16,
                children: [
                  Text("Generate a Profile Image", style: textTheme.titleLarge),
                  UserProfileImage(radius: 80, fontSize: 72),
                  Text.rich(
                    style: textTheme.bodyLarge!.copyWith(fontSize: 18),
                    TextSpan(
                      children: [
                        TextSpan(text: "Name: "),
                        TextSpan(
                          text: general.currentUser.name.isEmpty
                              ? "Player Name"
                              : general.currentUser.name,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  DropdownButton(
                    value: general.gender,
                    style: textTheme.bodyLarge,
                    borderRadius: BorderRadius.circular(15),
                    onChanged: (value) => general.setGender(value),
                    hint: Text("Avatar Gender"),
                    items: <DropdownMenuItem<String>>[
                      DropdownMenuItem(value: "Male", child: Text("Male")),
                      DropdownMenuItem(value: "Female", child: Text("Female")),
                    ],
                  ),
                ],
              ),
              FilledButton(
                onPressed: !general.isLoading
                    ? () => general.gender == null
                          ? miSnackBar(
                              context,
                              horizontalMargin: 100,
                              text: "Add a Avatar Gender!",
                            )
                          : general.setUserAvatar()
                    : null,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: !general.isLoading
                      ? Text(
                          general.userAvatar == null
                              ? "Generate Avatar"
                              : "Start",
                          style: textTheme.headlineSmall!.copyWith(
                            fontSize: general.userAvatar == null ? 20 : 24,
                            color: colorScheme.onPrimary,
                            letterSpacing: 1,
                          ),
                        )
                      : CircularProgressIndicator(strokeWidth: 1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
