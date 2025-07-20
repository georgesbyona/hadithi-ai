import 'package:flutter/material.dart';
import 'package:hadithi_ai/domain/domain.dart';
import 'package:provider/provider.dart';

import '../../../../data/data.dart';
import '../../../ui.dart';

import 'day_tale_head_main_container.dart';

class DayTaleHeadView extends StatelessWidget {
  final DayTaleProvider dayTaleProvider;
  final TaleModel dayTale;
  const DayTaleHeadView({
    super.key,
    required this.dayTale,
    required this.dayTaleProvider,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final now = DateTime.now();
    final shortDateOfToDay = DateFormatterUtil.formatDateShort(now);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        Text(dayTale.title, style: textTheme.headlineSmall),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("— by ${dayTale.author} | ", style: textTheme.bodyLarge),
                Text(
                  dayTaleProvider.genTaleModel != null
                      ? "${dayTaleProvider.genTaleModel!.readingTime} min read · $shortDateOfToDay"
                      : "0 min read · $shortDateOfToDay",
                  style: textTheme.bodyLarge!.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                  textAlign: TextAlign.end,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Consumer<TalesProvider>(
                  builder: (context, taleProvider, child) {
                    return IconButton(
                      onPressed: () => taleProvider.makeItFav(dayTale),
                      icon: MiIcons.like(context, dayTale.favorite),
                    );
                  },
                ),

                Text(
                  dayTale.rating.toString(),
                  style: textTheme.bodyMedium!.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ],
        ),
        DayTaleHeadMainContainer(dayTale: dayTale),
      ],
    );
  }
}
