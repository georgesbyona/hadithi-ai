import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hadithi_ai/data/data.dart';
import 'package:provider/provider.dart';

import 'widgets/riddles_game_question_container.dart';
import 'widgets/riddles_game_bottom_buttons.dart';
import 'widgets/quit_game_alert_dialog.dart';
import 'widgets/riddles_game_answers.dart';
import 'widgets/riddles_game_chrono.dart';

import '../../ui.dart';

class RiddlesGamePage extends StatefulWidget {
  const RiddlesGamePage({super.key});

  @override
  State<RiddlesGamePage> createState() => _RiddlesGamePageState();
}

class _RiddlesGamePageState extends State<RiddlesGamePage> {
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    final currentUser = context.read<GeneralProvider>().currentUser;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Consumer<RiddleProvider>(
      builder: (context, riddleProvider, child) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () async {
                final shouldQuit = await showDialog<bool>(
                  context: context,
                  builder: (_) => const QuitGameAlertDialog(),
                );
                if (shouldQuit == true) {
                  if (context.mounted) {
                    context.pop();
                  }
                }
              },
              icon: MiIcons.close(context),
            ),
            centerTitle: true,
            actions: [
              Container(
                margin: const EdgeInsets.only(right: 16),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: colorScheme.primary, width: 1.5),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Score: ",
                      style: textTheme.bodyLarge!.copyWith(
                        color: colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      currentUser.score[0].toString(),
                      style: textTheme.bodyLarge!.copyWith(
                        color: colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          body: riddleProvider.isLoading
              ? CircularProgressIndicator()
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: PageView.builder(
                    itemCount: RiddlesData.riddlesData.length,
                    controller: _pageController,
                    onPageChanged: (value) {},
                    itemBuilder: (context, index) {
                      final currentRiddle = RiddlesData.riddlesData[index];
                      return Column(
                        spacing: 8,
                        children: [
                          Text(
                            "*** | Level ${currentRiddle.level}: ${currentRiddle.levelTitle} | ***",
                            style: textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                              height: 2.5,
                            ),
                          ),
                          RiddlesGameChrono(riddleProvider: riddleProvider),
                          RiddlesGameQuestionContainer(
                            riddleProvider: riddleProvider,
                          ),
                          RiddlesGameAnswers(
                            riddleProvider: riddleProvider,
                            pageController: _pageController,
                          ),
                          RiddlesGameBottomButtons(
                            riddleProvider: riddleProvider,
                          ),
                        ],
                      );
                    },
                  ),
                ),
          persistentFooterButtons: [const MiFooterView()],
        );
      },
    );
  }
}
