import 'dart:typed_data';

import 'package:firebase_ai/firebase_ai.dart';
import 'package:flutter/rendering.dart';

class FirebaseAiImagenService {
  // Initialize the Gemini Developer API backend service
  // Create an `ImagenModel` instance with an Imagen model that supports your use case
  static ImagenModel initializeModel(ImagenAspectRatio aspectRatio) {
    var generationConfig = ImagenGenerationConfig(
      imageFormat: ImagenFormat.png(),
      aspectRatio: aspectRatio,
      numberOfImages: 1,
    );

    return FirebaseAI.vertexAI().imagenModel(
      model: 'imagen-3.0-generate-002',
      generationConfig: generationConfig,
      safetySettings: ImagenSafetySettings(
        ImagenSafetyFilterLevel.blockLowAndAbove,
        ImagenPersonFilterLevel.allowAll,
      ),
    );
  }

  static Future<Uint8List?> generateProfileImage(String gender) async {
    // Initialize the Imagen model with a specific aspect ratio
    final imagenModel = initializeModel(ImagenAspectRatio.square1x1);

    // Provide an image generation prompt
    String prompt =
        '''Generate a $gender Game Avatar for a user profile with a Nickelodeon style,
        without any writing on it and just a face portrait up to the shoulders.
        Well centered and just one avatar on the picture.
        May this avatar be a young African who smile.''';

    // To generate an image, call `generateImages` with the text prompt
    try {
      final response = await imagenModel.generateImages(prompt);

      if (response.images.isNotEmpty) {
        final image = response.images[0];
        return image.bytesBase64Encoded;
      } else {
        // Handle the case where no images were generated
        debugPrint('Images is empty: No images were generated.');
        return null;
      }
    } catch (e) {
      debugPrint('Error: $e.');
      return null;
    }
  }

  static Future<Uint8List?> generateTaleMainImage() async {
    // Initialize the Imagen model with a specific aspect ratio
    final imagenModel = initializeModel(ImagenAspectRatio.landscape16x9);

    // Provide an image generation prompt
    const prompt = 'An astronaut riding a horse.';

    // To generate an image, call `generateImages` with the text prompt
    final response = await imagenModel.generateImages(prompt);

    if (response.images.isNotEmpty) {
      final image = response.images[0];
      return image.bytesBase64Encoded;
    } else {
      // Handle the case where no images were generated
      debugPrint('Error: No images were generated.');
      return null;
    }
  }

  Future<Uint8List?> generateTalesImage(String talesTitle) async {
    // Initialize the Imagen model with a specific aspect ratio
    final imagenModel = initializeModel(ImagenAspectRatio.landscape16x9);

    // Provide an image generation prompt
    final prompt = '''Generate an image for the tale: "$talesTitle".
        That is a captivating and visually appealing image
        that represents the essence of the tale and specialy for kids.''';

    // To generate an image, call `generateImages` with the text prompt
    final response = await imagenModel.generateImages(prompt);

    if (response.images.isNotEmpty) {
      final image = response.images[0];
      return image.bytesBase64Encoded;
    } else {
      // Handle the case where no images were generated
      debugPrint('Error: No images were generated.');
      return null;
    }
  }
}
