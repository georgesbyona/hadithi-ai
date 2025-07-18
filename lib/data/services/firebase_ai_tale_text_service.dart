import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:firebase_ai/firebase_ai.dart';

import '../data.dart';

// Provide a JSON schema object using a standard format.
// Later, pass this schema object into `responseSchema` in the generation config.
final taleJSONSchema = Schema.object(
  properties: {
    'content': Schema.string(
      description: '''
          The main content of the story, which should be creative, engaging and imaginative.
          This content should be around 500 words long.
          ''',
    ),
    'moral_lesson': Schema.string(
      description:
          'A moral lesson derived from the story, suitable for children.',
    ),
    'reading_time': Schema.integer(
      description:
          'Estimated reading time in minutes, based on the story length.',
    ),
  },
);

class FirebaseAiTaleTextService {
  // Initialize the Gemini Developer API backend service
  // Create a `TextModel` instance with a Gemini model that supports your use case
  static GenerativeModel model = FirebaseAI.googleAI().generativeModel(
    model: 'gemini-2.0-flash',
    generationConfig: GenerationConfig(
      responseMimeType: "application/json",
      responseSchema: taleJSONSchema,
      maxOutputTokens: 1000,
      temperature: 0.8,
    ),
    systemInstruction: Content.text(
      '''You are a storyteller committed to telling children bedtime stories, specifically African children.
      Your stories are creative, engaging, imaginative, cultural, unique, and suitable for children...You take them into a fairytale world...
      But always within African culture, with stories inspired by ancient tales and true stories from Africa, told by great writers of the time, storybooks, and so on.
      Each story must end with a moral lesson (always on African morals and cultures) for the education and development of the child in the future.
      ''',
    ),
    safetySettings: [
      SafetySetting(
        HarmCategory.sexuallyExplicit,
        HarmBlockThreshold.high,
        null,
      ),
      SafetySetting(HarmCategory.harassment, HarmBlockThreshold.medium, null),
      SafetySetting(HarmCategory.hateSpeech, HarmBlockThreshold.medium, null),
      SafetySetting(
        HarmCategory.dangerousContent,
        HarmBlockThreshold.medium,
        null,
      ),
    ],
  );

  static Future<GenTaleModel?> generateTalesText(
    String taleTitle,
    String taleSum,
  ) async {
    try {
      final content = [
        Content.text(
          'Generate a story for kids titled "$taleTitle". Pick more ideas from his summary: "$taleSum".',
        ),
      ];
      final response = await model.generateContent(content);
      return GenTaleModel.fromJson(jsonDecode(response.text!));
    } catch (e) {
      debugPrint('Error generating text: $e');
      return null;
    }
  }
}
