import 'package:flutter/material.dart';

import '../../../ui.dart';

class ThreeFirstLeadersBox extends StatelessWidget {
  final String name;
  final int place, score;
  const ThreeFirstLeadersBox({
    super.key,
    required this.name,
    required this.place,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Text(
          place == 1
              ? "1st"
              : place == 2
              ? "2nd"
              : "3rd",
          style: textTheme.titleSmall!.copyWith(color: colorScheme.onPrimary),
        ),
        place == 1
            ? FirstLeader(initialLetter: name.substring(0, 1))
            : SecondAndThirdLeaders(
                isSecond: place == 2,
                initialLetter: name.substring(0, 1),
              ),
        Text(
          name,
          style: textTheme.titleMedium!.copyWith(color: colorScheme.onPrimary),
        ),
        PointView(
          isFirst: place == 1,
          score: score,
          color: place == 1
              ? MiColors.gold
              : place == 2
              ? MiColors.sliver
              : MiColors.bronze,
        ),
      ],
    );
  }
}

class FirstLeader extends StatelessWidget {
  final String initialLetter;
  const FirstLeader({super.key, required this.initialLetter});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      height: 125,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(bottom: 0, child: MiIcons.firstPlace(context)),
          Container(
            alignment: Alignment.center,
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: MiColors.gold,
              // border: Border.all(color: MiColors.gold, width: 3),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Text(
              initialLetter,
              style: textTheme.displayLarge!.copyWith(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}

class SecondAndThirdLeaders extends StatelessWidget {
  final String initialLetter;
  final bool isSecond;
  const SecondAndThirdLeaders({
    super.key,
    required this.isSecond,
    required this.initialLetter,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      height: 100,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            bottom: 0,
            child: isSecond
                ? MiIcons.secondPlace(context)
                : MiIcons.thirdPlace(context),
          ),
          Container(
            alignment: Alignment.center,
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: isSecond ? MiColors.sliver : MiColors.bronze,
              // border: Border.all(width: 3),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Text(
              initialLetter,
              style: textTheme.displaySmall!.copyWith(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}

class PointView extends StatelessWidget {
  final bool isFirst;
  final Color color;
  final int score;
  const PointView({
    super.key,
    required this.score,
    required this.color,
    required this.isFirst,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      margin: const EdgeInsets.only(top: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: color,
      ),
      child: Text(
        score.toString(),
        style: textTheme.bodyLarge!.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: isFirst ? 18 : 16,
          color: Colors.black,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
