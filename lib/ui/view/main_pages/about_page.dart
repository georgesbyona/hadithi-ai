import 'package:flutter/material.dart';

import '../../../domain/domain.dart';
import '../../ui.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        primary: true,
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Hadithi AI",
              style: textTheme.headlineSmall!.copyWith(
                color: colorScheme.primary,
              ),
            ),
            SizedBox(width: 150, height: 150, child: MiImages.logo),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 10,
              children: [
                Text(
                  "is a creative and educational app designed especially for African children. Powered by artificial intelligence, Hadithi AI brings a new tale, riddle, or story to life every day of the year—366 unique experiences that celebrate Africa’s rich cultures, traditions, and songs. Each day, kids can discover inspiring stories, solve fun riddles, and enjoy content rooted in African heritage. Our mission is to nurture imagination, curiosity, and a love for learning in a safe, child-friendly environment. Hadithi AI is more than just an app—it’s a daily journey through the wonders of African storytelling.",
                  style: textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Build by ", style: textTheme.bodyMedium),
                        Text("i4Dev Team", style: textTheme.titleSmall),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Email us on: "),
                        InkWell(
                          overlayColor: WidgetStatePropertyAll(
                            Colors.transparent,
                          ),
                          onTap: launchEmail,
                          child: Text(
                            "georgesbyona@gmail.com",
                            style: textTheme.bodyMedium!.copyWith(
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.blue,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Text(
                  "Version 1.0.0",
                  style: textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                MiSocialMedia(),
              ],
            ),
          ],
        ),
      ),
      persistentFooterButtons: [const MiFooterView()],
    );
  }
}
