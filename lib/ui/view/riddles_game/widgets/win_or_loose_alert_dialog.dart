import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '/ui/ui.dart';

class WinOrLooseAlertDialog extends StatelessWidget {
  final RiddleProvider riddleProvider;
  final bool isWin;
  const WinOrLooseAlertDialog({
    super.key,
    required this.riddleProvider,
    required this.isWin,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      backgroundColor: colorScheme.surface,
      title: Row(
        spacing: 8,
        children: [
          Icon(
            isWin
                ? Icons.emoji_events_rounded
                : Icons.sentiment_dissatisfied_rounded,
            color: isWin ? colorScheme.primary : colorScheme.error,
            size: 32,
          ),
          Text(
            isWin ? "Congratulations!" : "Oops!",
            style: textTheme.titleLarge?.copyWith(
              color: isWin ? colorScheme.primary : colorScheme.error,
            ),
          ),
        ],
      ),
      content: Text(
        isWin
            ? "You answered correctly! 🎉\n\nDo you want to continue to the next question or return to the home page?"
            : "Wrong answer! 😢\n\nYou can retry this question once, return to home, or see more details about this round.",
        style: textTheme.bodyMedium?.copyWith(
          color: colorScheme.onSurface,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        if (isWin) ...[
          TextButton(
            onPressed: () => context.pop('home'),
            child: const Text(
              "Home",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          FilledButton(
            onPressed: () => context.pop('next'),
            child: const Text(
              "Next",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ] else ...[
          TextButton(
            onPressed: () => context.pop('home'),
            child: const Text(
              "Home",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          // TextButton(
          //   onPressed: () => context.pop('details'),
          //   style: TextButton.styleFrom(foregroundColor: colorScheme.secondary),
          //   child: const Text(
          //     "See Details",
          //     style: TextStyle(fontWeight: FontWeight.bold),
          //   ),
          // ),
          FilledButton(
            onPressed: () => context.pop('retry'),
            child: const Text(
              "Retry",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ],
    );
  }
}
