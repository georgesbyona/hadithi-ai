import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:url_launcher/url_launcher.dart';

class MiSocialMedia extends StatelessWidget {
  const MiSocialMedia({super.key});

  @override
  Widget build(BuildContext context) {
    List<IconData> socialIcons = [
      HugeIcons.strokeRoundedLinkedin02,
      HugeIcons.strokeRoundedNewTwitter,
      HugeIcons.strokeRoundedInstagram,
      HugeIcons.strokeRoundedGithub,
      HugeIcons.strokeRoundedMedium,
    ];
    List<String> urls = [
      "https://linkedin.com/in/georgesbyona",
      "https://x.com/imanibahati0",
      "https://instagram.com/mr_kevin.ki",
      "https://github.com/georgesbyona/hadithi-ai",
      "https://medium.com/georgesbyona",
    ];
    return Column(
      children: [
        Text("Let's connect:"),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(
            socialIcons.length,
            (index) => IconButton(
              onPressed: () => _launchUrl(urls[index]),
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              icon: HugeIcon(
                icon: socialIcons[index],
                color: Theme.of(context).colorScheme.inverseSurface,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      debugPrint('Could not launch $url');
    }
  }
}
