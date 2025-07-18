import 'package:flutter/material.dart';

import '../../../../data/data.dart';

class RiddleLevelView extends StatelessWidget {
  final RiddleModel riddleModel;
  const RiddleLevelView({super.key, required this.riddleModel});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: BoxDecoration(
        color: colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            "Level",
            style: textTheme.titleLarge!.copyWith(
              color: colorScheme.onPrimaryContainer,
            ),
          ),
          Text(
            riddleModel.level.toString(),
            style: textTheme.titleLarge!.copyWith(
              color: colorScheme.onPrimaryContainer,
            ),
          ),
        ],
      ),
    );
  }
}
