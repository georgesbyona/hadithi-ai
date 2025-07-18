import 'package:flutter/material.dart';

import '../../../../data/data.dart';

class DayTaleHeadMainContainer extends StatelessWidget {
  final TaleModel dayTale;
  const DayTaleHeadMainContainer({super.key, required this.dayTale});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: colorScheme.primary,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Center(
        child: Text(
          '"${dayTale.summary}"',
          style: textTheme.titleLarge!.copyWith(
            color: colorScheme.onPrimary,
            letterSpacing: 1,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
