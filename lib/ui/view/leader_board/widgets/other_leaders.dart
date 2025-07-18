import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/domain/domain.dart';
import '/data/data.dart';
import '/ui/ui.dart';

class OtherLeaders extends StatelessWidget {
  final UserModel userModel;
  const OtherLeaders({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    final ordinalOrder = MiUtilities.getOrdinalSymbol(userModel.place);
    final currentUser = context.read<GeneralProvider>().currentUser;
    final isCurrentUser = userModel.place == currentUser.place;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        gradient: isCurrentUser
            ? LinearGradient(
                colors: [colorScheme.primary, colorScheme.primaryContainer],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                stops: [0.6, 1.0],
              )
            : null,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: 4,
            children: [
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: BoxBorder.all(color: colorScheme.primary),
                  color: colorScheme.primaryFixed,
                  shape: BoxShape.circle,
                ),
                child: Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    children: [
                      TextSpan(
                        text: userModel.place.toString(),
                        style: textTheme.bodyLarge!.copyWith(
                          color: colorScheme.onPrimaryFixed,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: ordinalOrder,
                        style: textTheme.bodySmall!.copyWith(
                          color: colorScheme.onPrimaryFixed,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 3),
                decoration: BoxDecoration(shape: BoxShape.circle),
              ),
              Text(
                userModel.name,
                style: textTheme.titleMedium!.copyWith(
                  color: isCurrentUser
                      ? colorScheme.onPrimary
                      : colorScheme.primary,
                  letterSpacing: 1,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(right: 3),
            child: Text(
              "${userModel.score[0] ?? 0}",
              style: textTheme.bodyLarge!.copyWith(
                color: colorScheme.onPrimaryContainer,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
