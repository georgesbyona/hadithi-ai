import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

import '../../../../domain/domain.dart';
import '../../../ui.dart';

class HomeBottomView extends StatelessWidget {
  const HomeBottomView({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        LeftRightBox(isLeft: true),
        InkWell(
          overlayColor: WidgetStatePropertyAll(Colors.transparent),
          borderRadius: BorderRadius.circular(25),
          onTap: () {
            if (context.read<RiddleProvider>().riddleModel != null) {
              context.read<RiddleProvider>().canShuffledIndexes();
              context.read<RiddleProvider>().resetVarValue();
              context.pushNamed(RoutesNames.riddlesGame);
            } else {
              miSnackBar(
                context,
                text: "Wait when the riddle is generated!",
                horizontalMargin: 70,
              );
            }
          },
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: colorScheme.primary,
            ),
            width: 140,
            height: 140,
            child: Text(
              "Start Riddle's Game",
              style: textTheme.titleLarge?.copyWith(
                color: colorScheme.onPrimary,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        LeftRightBox(isLeft: false),
      ],
    );
  }
}

class LeftRightBox extends StatelessWidget {
  final bool isLeft;
  const LeftRightBox({super.key, required this.isLeft});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Consumer<GeneralProvider>(
      builder: (context, general, child) => InkWell(
        overlayColor: WidgetStatePropertyAll(Colors.transparent),
        borderRadius: BorderRadius.circular(25),
        onTap: () {
          if (isLeft) {
            general.soundOnOff();
          } else {
            context.pushNamed(RoutesNames.leaderBoard);
          }
        },
        child: Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: colorScheme.surfaceContainerLowest,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Center(
            child: isLeft
                ? MiIcons.sound(context, general.soundOn)
                : MiIcons.leaderBoard(context, fromHome: true),
          ),
        ),
      ),
    );
  }
}
