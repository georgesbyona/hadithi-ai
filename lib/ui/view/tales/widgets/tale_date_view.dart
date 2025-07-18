import 'package:flutter/material.dart';

import '../../../../data/data.dart';

class TaleDateView extends StatelessWidget {
  final TaleModel selectedTale;
  const TaleDateView({super.key, required this.selectedTale});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            selectedTale.day.toString(),
            style: textTheme.titleLarge!.copyWith(
              color: colorScheme.onPrimaryContainer,
            ),
          ),
          Text(
            selectedTale.month,
            style: textTheme.titleLarge!.copyWith(
              color: colorScheme.onPrimaryContainer,
            ),
          ),
        ],
      ),
    );
  }
}
