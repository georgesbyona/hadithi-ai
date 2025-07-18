import 'package:flutter/material.dart';

import '../../../../data/data.dart';
import '../../../ui.dart';

class DayTaleAudioView extends StatelessWidget {
  final DayTaleProvider dayTaleProvider;
  final TaleModel dayTale;
  const DayTaleAudioView({
    super.key,
    required this.dayTale,
    required this.dayTaleProvider,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                MiIcons.volume(
                  context,
                  dayTaleProvider.volume == 0.0,
                  dayTaleProvider.volume < 0.5,
                ),
                Expanded(
                  child: Slider(
                    value: dayTaleProvider.volume,
                    onChanged: dayTaleProvider.changeVolume,
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // OutlinedButton(
              //   onPressed: dayTaleProvider.setLoop,
              //   child: Container(
              //     margin: const EdgeInsets.symmetric(vertical: 16),
              //     child: MiIcons.loop(context),
              //   ),
              // ),
              FilledButton(
                onPressed: dayTaleProvider.genTaleModel != null
                    ? () {
                        dayTaleProvider.playOrPauseTaleReading(
                          '''Title: ${dayTale.title}
                          Tale's summary: ${dayTale.summary}
                          Hi! Here we are... Let's start... ${dayTaleProvider.genTaleModel!.content}
                          Tale's moral lesson: ${dayTaleProvider.genTaleModel!.moralLesson}
                          This tale is told by Hadithi AI''',
                        );
                      }
                    : null,
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    spacing: 5,
                    children: [
                      MiIcons.pausePlay(context, dayTaleProvider.isPaused),
                      Text(
                        dayTaleProvider.isPaused ? "Play" : "Pause",
                        style: textTheme.bodyLarge!.copyWith(
                          color: colorScheme.onPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              FilledButton(
                onPressed:
                    dayTaleProvider.genTaleModel != null &&
                        !dayTaleProvider.isStoped
                    ? dayTaleProvider.stopTaleReading
                    : null,
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    spacing: 5,
                    children: [
                      MiIcons.stop(context),
                      Text(
                        "Stop",
                        style: textTheme.bodyLarge!.copyWith(
                          color: colorScheme.onPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
