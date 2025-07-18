import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class QuitGameAlertDialog extends StatelessWidget {
  const QuitGameAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      backgroundColor: colorScheme.surface,
      title: Text(
        "Quit Game?",
        style: textTheme.titleLarge?.copyWith(color: colorScheme.primary),
      ),
      content: Text(
        "You are about to quit the game and will lose your progress for this level.\n\n"
        "To save your progress, finish up to question 5 of this level.",
        style: textTheme.bodyMedium?.copyWith(
          color: colorScheme.onSurface,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => context.pop(false),
          child: const Text("Cancel"),
        ),
        FilledButton(
          onPressed: () => context.pop(true),
          child: const Text("Quit Anyway"),
        ),
      ],
    );
  }
}
