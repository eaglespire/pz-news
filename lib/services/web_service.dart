import 'package:url_launcher/url_launcher.dart';

void launchURLApp() async {
  const url = 'https://flutterdevs.com/';
  if (await canLaunch(url)) {
    await launch(url, forceSafariVC: true, forceWebView: true);
  } else {
    throw 'Could not launch $url';
  }
}

Future openBrowserUrl({required String url, bool inApp = false}) async {
  if (await canLaunch(url)) {
    await launch(url,
        forceWebView: inApp, forceSafariVC: inApp, enableJavaScript: true);
  }
}
