import 'package:flutter/material.dart';

import '../../../ui.dart';

class DayTaleBodyView extends StatelessWidget {
  final DayTaleProvider dayTaleProvider;
  const DayTaleBodyView({super.key, required this.dayTaleProvider});

  @override
  Widget build(BuildContext context) {
    return dayTaleProvider.genTaleModel != null
        ? Text.rich(
            style: Theme.of(context).textTheme.bodyLarge,
            TextSpan(
              children: <InlineSpan>[
                TextSpan(
                  text: dayTaleProvider.genTaleModel!.content.substring(0, 1),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                ),
                TextSpan(
                  text: dayTaleProvider.genTaleModel!.content.substring(1),
                ),
              ],
            ),
          )
        : Text(
            "No Tale for now!",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(height: 5),
            textAlign: TextAlign.center,
          );
  }
}
