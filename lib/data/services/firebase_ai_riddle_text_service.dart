import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:firebase_ai/firebase_ai.dart';

import '../data.dart';

// Provide a JSON schema object using a standard format.
// Later, pass this schema object into `responseSchema` in the generation config.
final riddleJSONSchema = Schema.object(
  properties: {
    'question': Schema.string(description: "Question for a level."),
    'answers': Schema.array(
      items: Schema.object(
        properties: {'is_correct': Schema.boolean(), 'answer': Schema.string()},
        description: "Answer with 'true' value when it's the correct one.",
      ),
      description: "4 answers for this question",
      maxItems: 4,
    ),
    'memory_aid': Schema.string(
      description: "A memory aid sentence for this question.",
    ),
  },
);

class FirebaseAiRiddleTextService {
  // Initialize the Gemini Developer API backend service
  // Create a `TextModel` instance with a Gemini model that supports your use case
  static GenerativeModel model = FirebaseAI.googleAI().generativeModel(
    model: 'gemini-2.0-flash',
    generationConfig: GenerationConfig(
      responseMimeType: "application/json",
      responseSchema: riddleJSONSchema,
      maxOutputTokens: 1000,
      temperature: 1.0,
    ),
    systemInstruction: Content.text(
      '''
    You are an expert at African riddles. You help children play riddles to support their education, their knowledge of culture and the African continent.
    You have a title and a description for each level of questions and for each level,
    you propose a question, a memory aid sentences and a groups of 4 answers, in each of these 4 you put a correct answer by passing true value to this one.
    Make sure the question is clear and precise with short answers of no more than 2 words and one memory aid sentence.
    Suggest a memory aid sentence that does not directly give the answer but enlightens the player more.''',
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

  static Future<GenRiddleModel?> generateTalesText(
    String levelTitle,
    String levelDescription,
  ) async {
    try {
      final content = [
        Content.text('''
          Generate a riddle's question for the level titled "$levelTitle".
          Pick more ideas from his description: "$levelDescription"."'''),
      ];
      final response = await model.generateContent(content);
      final genRiddleModel = GenRiddleModel.fromJson(
        jsonDecode(response.text!),
      );
      debugPrint("${jsonDecode(response.text!)}");
      return genRiddleModel;
    } catch (e) {
      debugPrint('Error generating text: $e');
      return null;
    }
  }
}
