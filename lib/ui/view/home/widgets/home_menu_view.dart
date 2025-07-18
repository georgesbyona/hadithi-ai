import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../domain/domain.dart';
import '../../../ui.dart';

class HomeMenuView extends StatelessWidget {
  const HomeMenuView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    List<String> menus = ["Day Tale", "Tales", "Riddles", "Settings"];

    List<Widget> icons = [
      MiIcons.tale(context),
      MiIcons.talesList(context),
      MiIcons.riddlesList(context),
      MiIcons.settings(context),
    ];

    List<String> routes = [
      RoutesNames.dayTale,
      RoutesNames.tales,
      RoutesNames.riddles,
      RoutesNames.settings,
    ];
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Wrap(
        alignment: WrapAlignment.spaceEvenly,
        crossAxisAlignment: WrapCrossAlignment.center,
        runSpacing: 30,
        spacing: 16,
        children: List.generate(
          menus.length,
          (index) => InkWell(
            overlayColor: WidgetStatePropertyAll(Colors.transparent),
            onTap: () {
              context.pushNamed(routes[index]);
            },
            child: Container(
              height: 140,
              width: 140,
              decoration: BoxDecoration(
                color: colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 10,
                children: [
                  icons[index],
                  Text(
                    menus[index],
                    style: textTheme.titleMedium!.copyWith(
                      color: colorScheme.onPrimaryContainer,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
