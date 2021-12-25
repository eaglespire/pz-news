import 'dart:convert';

import 'package:pt_news/models/article.dart';
import 'package:http/http.dart' as http;

const kApikey = '134cf1415eba46fa9dcbbb92d33291d8';
const kCountryCode = 'us';
const kNigeriaCode = 'ng';

class ArticleService {
  final List<Article> _articles = [];
  String apiUrl = 'https://newsapi'
      '.org/v2/top-headlines?country=$kCountryCode&apiKey=$kApikey';

  List<Article> fetchArticles() {
    return _articles;
  }

  Future<void> getNewsData(
      {required String countryCode, required String category}) async {
    String uri = 'https://newsapi'
        '.org/v2/top-headlines?country=$countryCode&category=$category&apiKey'
        '=$kApikey';
    var parsedUri = Uri.parse(uri);
    var response = await http.get(parsedUri);

    var data = jsonDecode(response.body);

    if (data['status'] == 'ok') {
      data["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          Article _article = Article(
              title: element['title'],
              description: element['description'],
              url: element['url'],
              urlToImage: element['urlToImage'],
              source: element['source']['name']);

          _articles.add(_article);
        }
      });
    }
  }

  Future<void> getUSNewsData() async {
    var parsedUri = Uri.parse(apiUrl);
    var response = await http.get(parsedUri);

    var data = jsonDecode(response.body);

    if (data['status'] == 'ok') {
      data["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          Article _article = Article(
              title: element['title'],
              description: element['description'],
              url: element['url'],
              urlToImage: element['urlToImage'],
              source: element['source']['name']);

          _articles.add(_article);
        }
      });
    }
  }

  Future<void> geNigeriaNewsData({required String countryCode}) async {
    String uri = 'https://newsapi'
        '.org/v2/top-headlines?country=$countryCode&apiKey=$kApikey';
    var parsedUri = Uri.parse(uri);
    var response = await http.get(parsedUri);

    var data = jsonDecode(response.body);

    if (data['status'] == 'ok') {
      data["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          Article _article = Article(
              title: element['title'],
              description: element['description'],
              url: element['url'],
              urlToImage: element['urlToImage'],
              source: element['source']['name']);

          _articles.add(_article);
        }
      });
    }
  }
}
