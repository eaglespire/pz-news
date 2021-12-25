import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pt_news/models/article.dart';

const apiKey = '134cf1415eba46fa9dcbbb92d33291d8';
const countryCode = 'us';

class FetchTrendingNews {
  List<Article> articles = [];
  String apiUrl = 'https://newsapi'
      '.org/v2/top-headlines?country=$countryCode&apiKey=$apiKey';
  Future<void> getTrendingArticles() async {
    var parsedUri = Uri.parse(apiUrl);

    var response = await http.get(parsedUri);
    var decodedData = jsonDecode(response.body);

    if (decodedData["status"] == 'ok') {
      decodedData["articles"].forEach((element) {
        if (element['description'] != null && element['urlToImage'] != null) {
          Article article = Article(
              title: element['title'],
              description: element['description'],
              urlToImage: element['urlToImage']);
          articles.add(article);
        }
      });
    }
  }
  // print(data);
}
