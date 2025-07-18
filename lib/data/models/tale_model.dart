import '../data.dart';

class TaleModel {
  final String month;
  final int day;
  final String title;
  final String summary;
  final String author;
  final double rating;
  GenTaleModel? miGenTaleModel;
  bool favorite;
  bool isSaved;

  TaleModel({
    required this.month,
    required this.day,
    required this.title,
    required this.summary,
    this.author = "HadithiAI",
    required this.rating,
    this.miGenTaleModel,
    this.favorite = false,
    this.isSaved = false,
  });
}
