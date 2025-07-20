import 'package:flutter/material.dart';

import '../../../ui.dart';

class DayTaleBottomView extends StatelessWidget {
  final DayTaleProvider dayTaleProvider;
  const DayTaleBottomView({super.key, required this.dayTaleProvider});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 16,
      children: [
        Text("Moral Lesson:", style: textTheme.titleLarge),
        if (dayTaleProvider.genTaleModel != null)
          Text(
            '"${dayTaleProvider.genTaleModel!.moralLesson}"',
            style: textTheme.bodyLarge!.copyWith(fontStyle: FontStyle.italic),
          ),
        Divider(),
        if (dayTaleProvider.genTaleModel != null)
          Text.rich(
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.end,
            TextSpan(
              children: <InlineSpan>[
                TextSpan(text: "Tale written by "),
                TextSpan(
                  text: "— HadithiAI |",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
