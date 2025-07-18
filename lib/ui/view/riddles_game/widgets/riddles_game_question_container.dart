import 'package:flutter/material.dart';

import '/ui/ui.dart';

class RiddlesGameQuestionContainer extends StatelessWidget {
  final RiddleProvider riddleProvider;
  const RiddlesGameQuestionContainer({super.key, required this.riddleProvider});

  @override
  Widget build(BuildContext context) {
    final genRiddleModel = riddleProvider.riddleModel?.genRiddleModel;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      padding: const EdgeInsets.all(50),
      decoration: BoxDecoration(
        color: colorScheme.primary,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Center(
        child: riddleProvider.isLoading
            ? CircularProgressIndicator(
                color: colorScheme.onPrimary,
                strokeWidth: 1,
              )
            : Text(
                "Question:\n${genRiddleModel!.question}",
                style: textTheme.titleLarge!.copyWith(
                  color: colorScheme.onPrimary,
                ),
                textAlign: TextAlign.center,
              ),
      ),
    );
  }
}
