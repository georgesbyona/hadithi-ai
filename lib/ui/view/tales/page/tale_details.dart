import 'package:flutter/material.dart';
import 'package:hadithi_ai/domain/domain.dart';
import 'package:provider/provider.dart';

import '../../../../data/data.dart';
import '../../../ui.dart';

class TaleDetails extends StatelessWidget {
  final TaleModel selectedTale;
  const TaleDetails({super.key, required this.selectedTale});

  @override
  Widget build(BuildContext context) {
    final talesProvider = Provider.of<TalesProvider>(context);
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${DateFormatterUtil.shortToLongMonth(selectedTale.month)} ${selectedTale.day}'s tale detail",
        ),
        actions: [
          IconButton(
            onPressed: () => talesProvider.makeItFav(selectedTale),
            icon: MiIcons.like(context, selectedTale.favorite),
          ),
          IconButton(
            onPressed: () => talesProvider.saveIt(selectedTale),
            icon: MiIcons.save(context, selectedTale.isSaved),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: 16,
              children: [
                Text.rich(
                  style: textTheme.bodyLarge!.copyWith(fontSize: 18),
                  textAlign: TextAlign.start,
                  TextSpan(
                    children: <InlineSpan>[
                      TextSpan(
                        text: "Title: ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: '"${selectedTale.title}"',
                        style: textTheme.titleLarge,
                      ),
                    ],
                  ),
                ),
                Text.rich(
                  style: textTheme.bodyLarge!.copyWith(fontSize: 18),
                  textAlign: TextAlign.end,
                  TextSpan(
                    children: <InlineSpan>[
                      TextSpan(text: "Author — "),
                      TextSpan(
                        text: selectedTale.author,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Text.rich(
                  style: textTheme.bodyLarge!.copyWith(fontSize: 18),
                  TextSpan(
                    children: <InlineSpan>[
                      TextSpan(
                        text: "Summary: ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: '"${selectedTale.summary}"'),
                    ],
                  ),
                ),
              ],
            ),
            Divider(height: 32),
            if (selectedTale.miGenTaleModel != null) ...{
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 16,
                children: [
                  Text("Content: ", style: textTheme.titleLarge),
                  Text(
                    selectedTale.miGenTaleModel!.content,
                    style: textTheme.bodyLarge,
                  ),
                  Divider(),
                  Text("Moral Lesson: ", style: textTheme.titleLarge),
                  Text(
                    '"${selectedTale.miGenTaleModel!.moralLesson}"',
                    style: textTheme.bodyLarge!.copyWith(
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  Divider(),
                ],
              ),
            } else ...{
              Text(
                "No content for now!",
                style: textTheme.titleSmall!.copyWith(
                  fontSize: 18,
                  height: 2.5,
                ),
                textAlign: TextAlign.center,
              ),
            },
          ],
        ),
      ),
    );
  }
}
