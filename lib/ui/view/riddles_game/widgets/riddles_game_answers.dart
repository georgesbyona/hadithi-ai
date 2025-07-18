import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '/data/data.dart';
import '/ui/ui.dart';

import 'win_or_loose_alert_dialog.dart';

class RiddlesGameAnswers extends StatelessWidget {
  final PageController pageController;
  final RiddleProvider riddleProvider;
  const RiddlesGameAnswers({
    super.key,
    required this.pageController,
    required this.riddleProvider,
  });

  @override
  Widget build(BuildContext context) {
    final genRiddleModel = riddleProvider.riddleModel?.genRiddleModel;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Expanded(
      child: GridView.builder(
        padding: const EdgeInsets.all(8),
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 24,
          crossAxisSpacing: 24,
          childAspectRatio: 1.8,
        ),
        itemCount: genRiddleModel != null ? genRiddleModel.answers.length : 4,
        itemBuilder: (context, index) {
          final answerIndex = riddleProvider.shuffledIndexes[index];
          final answer = genRiddleModel!.answers[answerIndex]["answer"];
          final isCorrect = genRiddleModel.answers[answerIndex]["is_correct"];
          return FilledButton.tonal(
            style: riddleProvider.tapedIndex == index
                ? isCorrect
                      ? ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(Colors.green),
                          foregroundColor: WidgetStatePropertyAll(Colors.black),
                        )
                      : ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                            context.read<GeneralProvider>().isDark
                                ? colorScheme.errorContainer
                                : colorScheme.error,
                          ),
                          foregroundColor: WidgetStatePropertyAll(
                            context.read<GeneralProvider>().isDark
                                ? colorScheme.onErrorContainer
                                : colorScheme.onError,
                          ),
                        )
                : null,
            onPressed:
                !riddleProvider.isLoading &&
                    !riddleProvider.timeIsFinished &&
                    !riddleProvider.isAnswerDisabled(answerIndex)
                ? () async {
                    riddleProvider.isTheCorrectAnswer(isCorrect, index);
                    context.read<GeneralProvider>().setUserScore(
                      isCorrect,
                      riddleProvider.riddleModel!.level,
                      riddleProvider.levelScore,
                    );
                    final result = await showDialog<String>(
                      context: context,
                      builder: (_) => WinOrLooseAlertDialog(
                        riddleProvider: riddleProvider,
                        isWin: riddleProvider.isCorrect,
                      ),
                    );
                    if (result == "home" || result == null) {
                      if (context.mounted) context.pop();
                    }
                    if (result == "retry") {
                      riddleProvider.getTheLevelRiddle();
                      riddleProvider.initializingChrono();
                    }
                    if (result == "next") {
                      pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOutBack,
                      );
                      riddleProvider.getTheLevelRiddle(
                        riddle: RiddlesData.riddlesData.where((e) {
                          final under20 =
                              riddleProvider.riddleModel!.level < 20;
                          return under20
                              ? e.level == riddleProvider.riddleModel!.level + 1
                              : e.level == 20;
                        }).first,
                      );
                    }
                  }
                : null,
            child: riddleProvider.isLoading
                ? CircularProgressIndicator(strokeWidth: 1)
                : Text(
                    "$answer",
                    style: textTheme.bodyLarge!.copyWith(
                      color: riddleProvider.tapedIndex == index
                          ? Colors.black
                          : colorScheme.onPrimaryContainer,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
          );
        },
      ),
    );
  }
}
