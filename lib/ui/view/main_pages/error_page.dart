import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../ui.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Error")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 16,
          children: [
            MiIcons.error(context),
            Text(
              "Oups! An error occurred!",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.error,
              ),
              textAlign: TextAlign.center,
            ),
            FilledButton.tonal(
              onPressed: () => context.pop(),
              child: Text(
                "Go Back",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
      persistentFooterButtons: [const MiFooterView()],
    );
  }
}
