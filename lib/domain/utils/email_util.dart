import 'package:url_launcher/url_launcher.dart';

void launchEmail() async {
  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) {
          return '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}';
        })
        .join('&');
  }

  final Uri emailUri = Uri(
    scheme: 'mailto',
    path: 'georgesbyona@gmail.com',
    query: encodeQueryParameters(<String, String>{
      'subject': 'Email from HadithiAI App',
      'body': 'Write your email body here.',
    }),
  );

  if (await canLaunchUrl(emailUri)) {
    await launchUrl(emailUri);
  } else {
    throw 'Could not launch $emailUri';
  }
}
