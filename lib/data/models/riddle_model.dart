import '../data.dart';

class RiddleModel {
  final int level;
  final String levelTitle;
  final String levelDesc;
  final String author;
  GenRiddleModel? genRiddleModel;

  RiddleModel({
    required this.level,
    required this.levelTitle,
    required this.levelDesc,
    this.author = "HadithiAI",
    this.genRiddleModel,
  });
}
