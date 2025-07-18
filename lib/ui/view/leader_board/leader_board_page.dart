import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'widgets/three_first_leaders.dart';
import 'widgets/other_leaders.dart';

import '/domain/domain.dart';
import '/data/data.dart';
import '/ui/ui.dart';

class LeaderBoardPage extends StatelessWidget {
  const LeaderBoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final currentUser = context.read<GeneralProvider>().currentUser;
    final ordinalSymbol = MiUtilities.getOrdinalSymbol(currentUser.place);
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: colorScheme.primary,
        leading: BackButton(
          onPressed: () => context.pop(),
          color: colorScheme.onPrimary,
        ),
        centerTitle: true,
        title: Text(
          'LeaderBoard',
          style: TextStyle(color: colorScheme.onPrimary),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: colorScheme.onPrimary, width: 1.5),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MiIcons.leaderBoard(context),
                Text(
                  currentUser.place.toString() + ordinalSymbol,
                  style: textTheme.bodyLarge!.copyWith(
                    color: colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            ListView.builder(
              padding: const EdgeInsets.only(
                top: 280,
                left: 16,
                right: 16,
                bottom: 16,
              ),
              itemCount: hundredLeaders.length,
              itemBuilder: (context, index) {
                return OtherLeaders(userModel: hundredLeaders[index]);
              },
            ),
            if (currentUser.place > 3)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Text(
                      "Your place:",
                      style: textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    OtherLeaders(userModel: currentUser),
                    Divider(),
                  ],
                ),
              ),
            ThreeFirstLeaders(),
          ],
        ),
      ),
    );
  }
}
