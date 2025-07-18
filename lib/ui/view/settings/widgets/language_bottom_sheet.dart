import 'package:flutter/material.dart';

import '../../../../data/data.dart';
import '../../../ui.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final List<LanguageModel> languages = [
      LanguageModel(
        icon: MiIcons.englishFlag(context),
        title: "English",
        isCurrentLanguage: true,
      ),
      LanguageModel(
        icon: MiIcons.frenchFlag(context),
        title: "French",
        isCurrentLanguage: false,
      ),
      LanguageModel(
        icon: MiIcons.swahiliFlag(context),
        title: "Swahili",
        isCurrentLanguage: false,
      ),
    ];
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text("Languages", style: textTheme.titleLarge!.copyWith(height: 2.5)),
          Column(
            children: List.generate(
              languages.length,
              (index) => InkWell(
                borderRadius: BorderRadius.circular(25),
                onTap: () {},
                child: Container(
                  color: Colors.transparent,
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    spacing: 8,
                    children: [
                      languages[index].icon,
                      Text(
                        languages[index].title,
                        style: textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      MiIcons.tick(context, languages[index].isCurrentLanguage),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
