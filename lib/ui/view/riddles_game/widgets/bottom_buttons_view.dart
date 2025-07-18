import 'package:flutter/material.dart';
import 'package:popover/popover.dart';

import '/ui/ui.dart';

import 'memory_aid_box.dart';

class BottomButtonsView extends StatelessWidget {
  final String label;
  final Widget icon;
  final RiddleProvider riddleProvider;

  final bool is10Sec, isAIHelp, isHelp5050, isReplay, isNext;
  const BottomButtonsView({
    super.key,
    required this.riddleProvider,
    required this.label,
    required this.icon,
    this.is10Sec = false,
    this.isAIHelp = false,
    this.isHelp5050 = false,
    this.isReplay = false,
    this.isNext = false,
  });

  @override
  Widget build(BuildContext context) {
    final genRiddleModel = riddleProvider.riddleModel?.genRiddleModel;
    final colorScheme = Theme.of(context).colorScheme;
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      splashColor: colorScheme.primaryFixed,
      onTap: () {
        if (riddleProvider.timeIsFinished) {
          miSnackBar(context, text: "Time is over!", horizontalMargin: 135);
        } else {
          if (is10Sec) {
            if (riddleProvider.hasAlreadyAdd10Sec) {
              miSnackBar(
                context,
                text: "10secs is already added!",
                horizontalMargin: 100,
              );
            } else {
              riddleProvider.changeSecondsLeft(shouldAdd10Secs: true);
            }
          }
          if (isAIHelp) {
            riddleProvider.changeLevelScoreTotal(isAIHelp: true);
            showPopover(
              context: context,
              barrierColor: Colors.transparent,
              backgroundColor: Theme.of(context).colorScheme.primary,
              bodyBuilder: (context) {
                return MemoryAidBox(memoryAid: genRiddleModel!.memoryAid);
              },
              height: 60,
              width: 250,
              direction: PopoverDirection.top,
            );
          }
          if (isHelp5050) {
            if (riddleProvider.disabledIndexes.isEmpty) {
              riddleProvider.canHelp5050(genRiddleModel!.answers);
            } else {
              miSnackBar(
                context,
                text: "2 answers are already disabled!",
                horizontalMargin: 80,
              );
            }
          }
        }
      },
      child: Container(
        alignment: Alignment.center,
        width: 80,
        decoration: BoxDecoration(
          color: Colors.transparent,
          shape: BoxShape.circle,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        child: Column(
          children: [
            icon,
            Text(
              label,
              style: TextStyle(
                color: colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
