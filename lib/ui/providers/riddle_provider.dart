import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '/data/data.dart';

class RiddleProvider extends ChangeNotifier {
  bool isLoading = false;

  void changeIsLoadingState() {
    isLoading = !isLoading;
    notifyListeners();
  }

  int currentPageIndex = 0;

  void onPageChanged() {
    currentPageIndex < 20 ? currentPageIndex++ : currentPageIndex = 19;
    notifyListeners();
  }

  // Shuffles the indexes to display the answers in a random order
  List<int> shuffledIndexes = [];

  void canShuffledIndexes() {
    shuffledIndexes = List.generate(4, (i) => i)..shuffle();
  }

  // Find the indexes of the wrong answers (is_correct == false)
  // Shuffle and keep 2 to disable
  List<int> disabledIndexes = [];

  void canHelp5050(List<dynamic> answers) {
    final wrongIndexes = <int>[];
    for (int i = 0; i < answers.length; i++) {
      if (answers[i]["is_correct"] == false) {
        wrongIndexes.add(i);
      }
    }
    wrongIndexes.shuffle();
    disabledIndexes = wrongIndexes.take(2).toList();
    changeLevelScoreTotal(isAIHelp: true);
    notifyListeners();
  }

  bool isAnswerDisabled(int index) => disabledIndexes.contains(index);

  int levelScore = 5;
  int level10SecScore = 3;
  int levelAIHelpScore = 2;

  void changeLevelScoreTotal({bool is10Sec = false, bool isAIHelp = false}) {
    is10Sec
        ? levelScore = level10SecScore
        : isAIHelp
        ? levelScore = levelAIHelpScore
        : levelScore = levelScore;
    notifyListeners();
  }

  //TIME CHRONO HANDLING
  int secondsLeft = 60;

  void decreaseSecsLeft() {
    secondsLeft--;
    notifyListeners();
  }

  bool timeIsFinished = false;

  void timeIsOver() {
    timeIsFinished = true;
    notifyListeners();
  }

  void resetChrono() {
    secondsLeft = 60;
    timeIsFinished = false;
    hasAlreadyAdd10Sec = false;
    formattedTime;
  }

  void initializingChrono() {
    secondsLeft = 60;
    timeIsFinished = false;
    hasAlreadyAdd10Sec = false;
    formattedTime;
    notifyListeners();
  }

  String get formattedTime {
    final min = (secondsLeft ~/ 60).toString().padLeft(1, '0');
    final sec = (secondsLeft % 60).toString().padLeft(2, '0');
    return "$min:$sec";
  }

  bool hasAlreadyAdd10Sec = false;

  void changeSecondsLeft({
    bool shouldHalfSecs = false,
    shouldAdd10Secs = false,
  }) {
    if (shouldAdd10Secs && !hasAlreadyAdd10Sec) {
      secondsLeft += 10;
      hasAlreadyAdd10Sec = true;
      changeLevelScoreTotal(is10Sec: true);
    } else if (secondsLeft > 35 && shouldHalfSecs) {
      secondsLeft = secondsLeft - 30;
    } else {
      secondsLeft = secondsLeft;
    }
    formattedTime;
    notifyListeners();
  }

  //RIDDLE HANDLING
  RiddleModel? riddleModel;

  Future<void> getTheLevelRiddle({RiddleModel? riddle}) async {
    resetVarValue();
    shuffledIndexes.clear();
    changeIsLoadingState();
    if (riddle == null) {
      final genRiddleModel =
          await FirebaseAiRiddleTextService.generateTalesText(
            RiddlesData.riddlesData.first.levelTitle,
            RiddlesData.riddlesData.first.levelDesc,
          );
      riddleModel = RiddleModel(
        level: RiddlesData.riddlesData.first.level,
        levelTitle: RiddlesData.riddlesData.first.levelTitle,
        levelDesc: RiddlesData.riddlesData.first.levelTitle,
        genRiddleModel: genRiddleModel,
      );
    } else {
      final genRiddleModel =
          await FirebaseAiRiddleTextService.generateTalesText(
            riddle.levelTitle,
            riddle.levelDesc,
          );
      riddleModel = RiddleModel(
        level: riddle.level,
        levelTitle: riddle.levelTitle,
        levelDesc: riddle.levelTitle,
        genRiddleModel: genRiddleModel,
      );
    }
    canShuffledIndexes();
    notifyListeners();
    changeIsLoadingState();
  }

  //ANSWERS HANDLING
  bool isCorrect = false;
  int tapedIndex = 5;

  void isTheCorrectAnswer(bool correct, int index) {
    isCorrect = correct;
    tapedIndex = index;
    notifyListeners();
  }

  //RESET ALL INITIAL VALUE
  void resetVarValue() {
    tapedIndex = 5;
    isCorrect = false;
    disabledIndexes.clear();
    notifyListeners();
  }
}
