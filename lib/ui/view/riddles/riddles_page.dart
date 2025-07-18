import 'package:flutter/material.dart';

import '/data/data.dart';
import 'widgets/riddle_details_view.dart';
import 'widgets/riddle_level_view.dart';

class RiddlesPage extends StatelessWidget {
  const RiddlesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Riddles")),
      body: ListView.builder(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
        itemCount: RiddlesData.riddlesData.length,
        itemBuilder: (context, index) {
          final localRiddle = RiddlesData.riddlesData[index];
          return GestureDetector(
            onTap: () async {
              final response =
                  await FirebaseAiRiddleTextService.generateTalesText(
                    localRiddle.levelTitle,
                    localRiddle.levelDesc,
                  );
              debugPrint(response.toString());
            },
            child: Container(
              padding: const EdgeInsets.only(top: 12, bottom: 12, right: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 16,
                children: [
                  RiddleLevelView(riddleModel: localRiddle),
                  RiddleDetailsView(riddleModel: localRiddle),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
