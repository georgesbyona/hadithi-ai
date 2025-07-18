import 'package:flutter/material.dart';

import '../../../ui.dart';

class TaleRatingView extends StatelessWidget {
  final TalesProvider talesProvider;
  final int index;
  const TaleRatingView({
    super.key,
    required this.talesProvider,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        IconButton(
          onPressed: () {
            talesProvider.makeItFav(talesProvider.miTales[index]);
          },
          icon: MiIcons.like(context, talesProvider.miTales[index].favorite),
        ),
        Text(
          "${talesProvider.miTales[index].rating}k",
          style: textTheme.bodyMedium!.copyWith(
            color: colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        IconButton(
          onPressed: () => talesProvider.saveIt(talesProvider.miTales[index]),
          icon: MiIcons.save(context, talesProvider.miTales[index].isSaved),
        ),
      ],
    );
  }
}
