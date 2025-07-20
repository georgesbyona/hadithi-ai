import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../../domain/domain.dart';
import '../../../../ui.dart';

import 'choose_avatar_button.dart';

class WelcomeBody extends StatefulWidget {
  const WelcomeBody({super.key});

  @override
  State<WelcomeBody> createState() => _WelcomeBodyState();
}

class _WelcomeBodyState extends State<WelcomeBody> {
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final general = Provider.of<GeneralProvider>(context);
    final colorScheme = ThemeUtils.colorScheme(context);
    final textTheme = ThemeUtils.textTheme(context);
    return SingleChildScrollView(
      primary: true,
      padding: const EdgeInsets.all(80),
      child: Center(
        child: SizedBox(
          width: 250,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'Hi!',
                style: textTheme.displaySmall,
                textAlign: TextAlign.center,
              ),
              Text.rich(
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Welcome to ',
                      style: textTheme.headlineSmall,
                    ),
                    TextSpan(
                      text: 'HadithiAI',
                      style: textTheme.headlineSmall!.copyWith(
                        color: colorScheme.primary,
                      ),
                    ),
                    TextSpan(text: '!', style: textTheme.headlineSmall),
                  ],
                ),
              ),
              SizedBox(height: 250, child: MiImages.logo),
              Text(
                'How should I call you ?',
                style: textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              TextField(
                controller: textController,
                onTapOutside: (event) {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                style: textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                  hintText: "Enter a Player Name..",
                  hintStyle: textTheme.labelLarge!.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                  helperText: "Don't use your real name!",
                ),
                textAlign: TextAlign.center,
                maxLength: 10,
                maxLines: 1,
              ),
              ChooseAvatarButton(
                onPressed: () async {
                  final userName = textController.text.trim();
                  if (userName.isEmpty) {
                    miSnackBar(
                      context,
                      text: "Please enter a valid Player name!",
                      horizontalMargin: 65,
                    );
                  } else {
                    // general.setUserName(userName);
                    // showDialog(
                    //   context: context,
                    //   builder: (context) {
                    //     return AvatarDialog();
                    //   },
                    // );
                    await general.logInUser(userName);
                    if (context.mounted) context.go(RoutesPaths.home);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
