import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/domain/domain.dart';
import '/ui/ui.dart';

class HomeHeadView extends StatelessWidget {
  const HomeHeadView({super.key, required this.userName});

  final String userName;

  @override
  Widget build(BuildContext context) {
    final currentUser = context.read<GeneralProvider>().currentUser;
    final ordinalSymbol = MiUtilities.getOrdinalSymbol(currentUser.place);
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            UserProfileImage(radius: 30, fontSize: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello,',
                  style: textTheme.headlineSmall!.copyWith(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                Text(
                  '$userName!',
                  style: textTheme.headlineSmall!.copyWith(
                    color: colorScheme.primary,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.only(right: 3),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(color: colorScheme.primary, width: 1.5),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MiIcons.leaderBoard(context, fromHome: true),
              Text(
                currentUser.place.toString() + ordinalSymbol,
                style: textTheme.bodyLarge!.copyWith(
                  color: colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
