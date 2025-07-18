import 'package:flutter/material.dart';

import '/ui/ui.dart';

import 'bottom_buttons_view.dart';

class RiddlesGameBottomButtons extends StatelessWidget {
  final RiddleProvider riddleProvider;
  const RiddlesGameBottomButtons({super.key, required this.riddleProvider});

  @override
  Widget build(BuildContext context) {
    final List<Widget> firstWidgets = [
      BottomButtonsView(
        is10Sec: true,
        riddleProvider: riddleProvider,
        icon: MiIcons.addTime(context),
        label: "+10sec",
      ),
      BottomButtonsView(
        isAIHelp: true,
        riddleProvider: riddleProvider,
        icon: MiIcons.aiHelp(context),
        label: "AI Help",
      ),
      BottomButtonsView(
        isHelp5050: true,
        riddleProvider: riddleProvider,
        icon: MiIcons.help5050(context),
        label: "-2A",
      ),
    ];

    return Padding(
      padding: const EdgeInsets.only(bottom: 64),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 8,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: firstWidgets,
          ),
        ],
      ),
    );
  }
}
