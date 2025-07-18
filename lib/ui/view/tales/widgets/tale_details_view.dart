import 'package:flutter/material.dart';

import '../../../../data/data.dart';

class TaleDetailsView extends StatelessWidget {
  final TaleModel selectedTale;
  const TaleDetailsView({super.key, required this.selectedTale});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          Text(
            selectedTale.title,
            style: textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
          ),
          Text(
            selectedTale.summary,
            style: textTheme.bodySmall!.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [Text("— by ${selectedTale.author}")],
          ),
        ],
      ),
    );
  }
}
