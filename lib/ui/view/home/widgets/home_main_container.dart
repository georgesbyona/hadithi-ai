import 'package:flutter/material.dart';

class HomeMainContainer extends StatelessWidget {
  const HomeMainContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.all(50),
      decoration: BoxDecoration(
        color: colorScheme.primary,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Center(
        child: Text(
          "Welcome to your 366 Day's Stories app powered by Hadithi AI!",
          style: textTheme.titleLarge!.copyWith(color: colorScheme.onPrimary),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
