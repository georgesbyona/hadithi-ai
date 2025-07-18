class UserModel {
  final String id;
  final String name;
  final int place;
  final Map<int, int> score;
  final String avatarURL;

  UserModel({
    required this.id,
    required this.name,
    required this.place,
    required this.score,
    this.avatarURL = "",
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      name: json['name'] as String,
      place: json['place'] as int,
      score: json['score'] as Map<int, int>,
      avatarURL: json['avatarURL'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'place': place,
      'score': score,
      'avatarURL': avatarURL,
    };
  }
}
