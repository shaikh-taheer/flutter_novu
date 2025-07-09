import 'package:url_launcher/url_launcher.dart';

Future<void> launchURL(String url, {LaunchMode mode = LaunchMode.platformDefault}) async {
  final Uri url0 = Uri.parse(url);
  if (await canLaunchUrl(url0)) {
    launchUrl(url0, mode: mode);
  } else {
    // can't launch url, there is some error
    throw "Could not launch $url";
  }
}