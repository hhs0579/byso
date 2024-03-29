import 'package:url_launcher/url_launcher.dart';
import 'dart:html' as html;

void launch2(String url) {
  html.window.open(url, '_blank');
}
