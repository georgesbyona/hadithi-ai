import 'package:flutter/material.dart';

import '../../../../data/data.dart';

import 'three_first_leaders_box.dart';

class ThreeFirstLeaders extends StatelessWidget {
  const ThreeFirstLeaders({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final List<UserModel> threeFirstLeaders = [
      UserModel(id: "0987654321", name: "Kevin", place: 2, score: {0: 1807}),
      UserModel(id: "1234567890", name: "Giorgio", place: 1, score: {0: 2304}),
      UserModel(id: "6543456781", name: "Abraham", place: 3, score: {0: 1204}),
    ];
    return Container(
      padding: const EdgeInsets.only(bottom: 25),
      height: 280,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [colorScheme.primary, colorScheme.primary.withAlpha(0)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.8, 1.0],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(threeFirstLeaders.length, (index) {
          return ThreeFirstLeadersBox(
            name: threeFirstLeaders[index].name,
            place: threeFirstLeaders[index].place,
            score: threeFirstLeaders[index].score[0] ?? 0,
          );
        }),
      ),
    );
  }
}
