import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:hadithi_ai/domain/domain.dart';

import '../../data/data.dart';

class DayTaleProvider extends ChangeNotifier {
  //Checking if user is connected to the internet or not
  bool isConnected = false;
  Future<void> isUserConnected() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      isConnected = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } catch (e) {
      debugPrint("Error when checking connexion to internet!");
      debugPrint("Error: $e");
      isConnected = false;
    }
  }

  // GEN TALES HANDLER
  GenTaleModel? _genTaleModel;

  GenTaleModel? get genTaleModel => _genTaleModel;

  Future<void> generateDaysTale() async {
    if (_genTaleModel != null && !isConnected) {
      debugPrint("Generate day's tale was skipped!");
      debugPrint("IsConnected: $isConnected");
    } else {
      final now = DateTime.now();
      // Filter to find the today's tale
      final dayTale = TalesData.talesData
          .where(
            (tale) =>
                DateFormatterUtil.monthStringToInt(tale.month) == now.month &&
                tale.day == now.day,
          )
          .toList();

      if (dayTale.isNotEmpty) {
        // Use the first tale found to generate the text
        _genTaleModel = await FirebaseAiTaleTextService.generateTalesText(
          dayTale.first.title,
          dayTale.first.summary,
        );
      } else {
        debugPrint("No tale found for today (${now.month}/${now.day})");
      }
      final tale = TalesData.talesData
          .where((e) => e == dayTale.first)
          .toList();
      tale.first.miGenTaleModel = _genTaleModel;
    }
    notifyListeners();
  }

  //TEXT TO SPEECH HANDLING
  final FlutterTts flutterTts = FlutterTts();

  bool isLooped = false;
  void setLoop() {
    isLooped = !isLooped;
    notifyListeners();
  }

  double volume = .5;
  void changeVolume(double value) {
    volume = value;
    notifyListeners();
  }

  bool isPaused = true;

  void pausePlay() {
    isPaused = !isPaused;
    notifyListeners();
  }

  String _currentWord = "";

  Future<void> playOrPauseTaleReading(String text) async {
    pausePlay();
    if (!isPaused) {
      await flutterTts.setVolume(volume);
      await flutterTts.speak(text);
      isStoped = false;
    } else {
      await flutterTts.pause();
    }
    flutterTts.setCompletionHandler(() {
      isPaused = !isPaused;
    });
    flutterTts.setProgressHandler((
      String text,
      int startOffset,
      int endOffset,
      String word,
    ) {
      _currentWord = word;
    });
    debugPrint("Current word= $_currentWord");
    notifyListeners();
  }

  bool isStoped = true;

  Future<void> stopTaleReading() async {
    isPaused = true;
    isStoped = true;
    await flutterTts.stop();
    notifyListeners();
  }
}
