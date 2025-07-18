import 'package:flutter/material.dart';

import 'widgets/home_main_container.dart';
import 'widgets/home_bottom_view.dart';
import 'widgets/home_head_view.dart';
import 'widgets/home_menu_view.dart';
import '../../ui.dart';

class HomePage extends StatelessWidget {
  final String userName;
  const HomePage({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: HomePageView(userName: userName)),
      persistentFooterButtons: [const MiFooterView()],
    );
  }
}

class HomePageView extends StatelessWidget {
  const HomePageView({super.key, required this.userName});

  final String userName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        spacing: 16,
        children: [
          HomeHeadView(userName: userName),
          Expanded(
            child: SingleChildScrollView(
              primary: true,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                spacing: 16,
                children: [
                  HomeMainContainer(),
                  HomeMenuView(),
                  HomeBottomView(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
