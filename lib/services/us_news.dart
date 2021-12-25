import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pt_news/models/article.dart';

const apiKey = '134cf1415eba46fa9dcbbb92d33291d8';
const countryCode = 'us';

class UsNewsArticles {
  String apiUrl = 'https://newsapi'
      '.org/v2/top-headlines?country=$countryCode&apiKey=$apiKey';

  Future<List> processData() async {
    /*
    Parse the above url and
    Make the http get request
     */
    var parsedUri = Uri.parse(apiUrl);
    var response = await http.get(parsedUri);

    /*
    Decoded the returned JSON String as a JSON
    Object
     */

    var decodedString = jsonDecode(response.body)['articles'] as List;
    print(decodedString.runtimeType);
    return decodedString;
  }
}
