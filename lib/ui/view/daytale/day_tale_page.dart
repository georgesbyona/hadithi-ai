import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/day_tale_bottom_view.dart';
import 'widgets/day_tale_audio_view.dart';
import 'widgets/day_tale_body_view.dart';
import 'widgets/day_tale_head_view.dart';

import '../../../domain/domain.dart';
import '../../../data/data.dart';
import '../../ui.dart';

class DayTalePage extends StatelessWidget {
  const DayTalePage({super.key});

  @override
  Widget build(BuildContext context) {
    final dayTaleProvider = Provider.of<DayTaleProvider>(context);
    final now = DateTime.now();
    // Filter to find the today's tale
    final dayTale = TalesData.talesData
        .where(
          (tale) =>
              DateFormatterUtil.monthStringToInt(tale.month) == now.month &&
              tale.day == now.day,
        )
        .toList();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Day Tale'),
        actions: [
          Consumer<TalesProvider>(
            builder: (context, taleProvider, child) {
              return IconButton(
                onPressed: () => taleProvider.saveIt(dayTale.first),
                icon: MiIcons.save(context, dayTale.first.isSaved),
              );
            },
          ),
        ],
      ),
      body: ListView(
        primary: true,
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
        children: [
          DayTaleHeadView(
            dayTaleProvider: dayTaleProvider,
            dayTale: dayTale.first,
          ),
          DayTaleAudioView(
            dayTaleProvider: dayTaleProvider,
            dayTale: dayTale.first,
          ),
          Column(
            spacing: 16,
            children: [
              DayTaleBodyView(dayTaleProvider: dayTaleProvider),
              Divider(),
              DayTaleBottomView(dayTaleProvider: dayTaleProvider),
            ],
          ),
        ],
      ),
      persistentFooterButtons: [const MiFooterView()],
    );
  }
}
