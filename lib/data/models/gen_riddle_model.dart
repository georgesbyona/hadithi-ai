class GenRiddleModel {
  final String question;
  final List<dynamic> answers;
  final String memoryAid;

  GenRiddleModel({
    required this.question,
    required this.answers,
    required this.memoryAid,
  });

  factory GenRiddleModel.fromJson(Map<String, dynamic> json) {
    return GenRiddleModel(
      question: json['question'] as String,
      answers: json['answers'] as List<dynamic>,
      memoryAid: json['memory_aid'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'question': question, 'answers': answers, 'memory_aid': memoryAid};
  }
}

// class GenRiddleModel {
//   final Map<int, String> questions;
//   final Map<int, Map<bool, String>> answers;
//   final Map<int, String> memoryAid;

//   GenRiddleModel({
//     required this.questions,
//     required this.answers,
//     required this.memoryAid,
//   });

//   factory GenRiddleModel.fromJson(Map<String, dynamic> json) {
//     return GenRiddleModel(
//       questions: json['questions'] as Map<int, String>,
//       answers: json['answers'] as Map<int, Map<bool, String>>,
//       memoryAid: json['memory_aid'] as Map<int, String>,
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'questions': questions,
//       'answers': answers,
//       'memory_aid': memoryAid,
//     };
//   }
// }
