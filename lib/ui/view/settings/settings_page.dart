import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

import '../../../domain/domain.dart';
import 'widgets/language_bottom_sheet.dart';
import 'widgets/log_out_button.dart';
import 'widgets/settings_menu.dart';
import '../../ui.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final general = Provider.of<GeneralProvider>(context);
    final List<String> menus = ["General", "Dark Mode", "About", "Language"];
    final List<Widget> icons = [
      Container(),
      ThemeSwitchButton(),
      MiIcons.rightArrow(context),
      MiIcons.rightArrow(context),
    ];
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Settings')),
      body: SingleChildScrollView(
        primary: true,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: 16,
          children: [
            Column(
              children: List.generate(menus.length, (i) {
                return SettingMenu(
                  onTap: i == 2 || i == 3
                      ? () {
                          i == 2
                              ? context.goNamed(RoutesNames.about)
                              : showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return LanguageBottomSheet();
                                  },
                                );
                        }
                      : null,
                  text: menus[i],
                  icon: icons[i],
                );
              }),
            ),
            LogOutButton(
              onPressed: () async {
                await general.logOutUser();
                if (context.mounted) context.go(RoutesPaths.home);
              },
            ),
          ],
        ),
      ),
      persistentFooterButtons: [const MiFooterView()],
    );
  }
}
