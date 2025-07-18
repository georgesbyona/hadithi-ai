import 'package:flutter/material.dart';

class LanguageModel {
  final Widget icon;
  final String title;
  final bool isCurrentLanguage;

  LanguageModel({
    required this.icon,
    required this.title,
    required this.isCurrentLanguage,
  });

  factory LanguageModel.fromJson(Map<String, dynamic> json) {
    return LanguageModel(
      icon: json['icon'] as Widget,
      title: json['title'] as String,
      isCurrentLanguage: json['isCurrentLanguage'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'icon': icon,
      'title': title,
      'isCurrentLanguage': isCurrentLanguage,
    };
  }
}
