import 'package:flutter/material.dart';

class MiFooterView extends StatelessWidget {
  const MiFooterView({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      height: 40,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text.rich(
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: textTheme.bodySmall,
            TextSpan(
              children: <InlineSpan>[
                TextSpan(text: "©2k25 "),
                TextSpan(
                  text: "HadithiAI",
                  style: TextStyle(
                    color: colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(text: " ∙ #AIHackathon"),
              ],
            ),
          ),
          Text.rich(
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: textTheme.bodySmall,
            TextSpan(
              children: <InlineSpan>[
                TextSpan(
                  text: "i4Dev",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: "'s team"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
