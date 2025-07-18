import 'package:flutter/material.dart';

import '../../../ui.dart';

import 'widgets/welcome_body.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: WelcomeBody()),
      persistentFooterButtons: [const MiFooterView()],
    );
  }
}
