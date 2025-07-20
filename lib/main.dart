import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'firebase_options.dart';

import 'domain/domain.dart';
import 'ui/ui.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // Keep the app in portrait mode only
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final pref = await SharedPreferences.getInstance();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => GeneralProvider()
            ..isUserConnected()
            ..getPrefs(pref),
        ),
        ChangeNotifierProvider(
          create: (context) => DayTaleProvider()
            ..generateDaysTale()
            ..isUserConnected(),
        ),
        ChangeNotifierProvider(create: (context) => TalesProvider()),
        ChangeNotifierProvider(
          create: (context) => RiddleProvider()..getTheLevelRiddle(),
        ),
      ],
      child: HadithiAI(),
    ),
  );
  FlutterNativeSplash.remove();
}

class HadithiAI extends StatelessWidget {
  const HadithiAI({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = ThemeUtils.createTextTheme(
      context,
      "Indie Flower",
      "Bubblegum Sans",
    );

    final theme = MaterialTheme(textTheme);

    return Consumer<GeneralProvider>(
      builder: (context, general, child) {
        return Consumer<DayTaleProvider>(
          builder: (context, dayTale, child) {
            return Consumer<RiddleProvider>(
              builder: (context, riddle, child) {
                return MaterialApp.router(
                  title: 'HadithiAI',
                  debugShowCheckedModeBanner: false,
                  theme: theme.light(),
                  darkTheme: theme.dark(),
                  themeMode: general.isDark ? ThemeMode.dark : ThemeMode.light,
                  routerConfig: goRouter,
                );
              },
            );
          },
        );
      },
    );
  }
}
