import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pt_news/models/article.dart';

String apiKey = '134cf1415eba46fa9dcbbb92d33291d8';
String kUsa = 'us';

class GetNewsArticles {
  String apiUrl = 'https://newsapi'
      '.org/v2/top-headlines?country=$kUsa&apiKey=$apiKey';
}
