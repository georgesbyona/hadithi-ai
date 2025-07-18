import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/data/data.dart';
import '/ui/ui.dart';

class RiddleDetailsView extends StatelessWidget {
  final RiddleModel riddleModel;
  const RiddleDetailsView({super.key, required this.riddleModel});

  @override
  Widget build(BuildContext context) {
    final currentUser = context.read<GeneralProvider>().currentUser;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                riddleModel.levelTitle,
                style: textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text.rich(
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                TextSpan(
                  children: [
                    TextSpan(text: "Score: "),
                    TextSpan(
                      text: currentUser.score[riddleModel.level] != null
                          ? currentUser.score[riddleModel.level].toString()
                          : "0",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Text(
            riddleModel.levelDesc,
            style: textTheme.bodyMedium!.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [Text("— by ${riddleModel.author}")],
          ),
        ],
      ),
    );
  }
}
