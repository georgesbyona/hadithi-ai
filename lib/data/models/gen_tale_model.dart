class GenTaleModel {
  final String content;
  final String moralLesson;
  final int readingTime;

  GenTaleModel({
    required this.content,
    required this.moralLesson,
    required this.readingTime,
  });

  factory GenTaleModel.fromJson(Map<String, dynamic> json) {
    return GenTaleModel(
      content: json['content'] as String,
      moralLesson: json['moral_lesson'] as String,
      readingTime: json['reading_time'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'content': content,
      'moral_lesson': moralLesson,
      'reading_time': readingTime,
    };
  }
}
