import 'package:flutter/material.dart';
import 'package:pt_news/models/article.dart';
import 'package:pt_news/services/article_service.dart';
import 'package:pt_news/widgets/banner_con.dart';
import 'package:pt_news/widgets/country_badge.dart';
import 'package:pt_news/widgets/discover_more.dart';
import 'package:pt_news/widgets/latest_headline.dart';

import 'article_detail.dart';

class BusinessCategoryScreen extends StatefulWidget {
  const BusinessCategoryScreen({Key? key}) : super(key: key);

  @override
  _BusinessCategoryScreenState createState() => _BusinessCategoryScreenState();
}

class _BusinessCategoryScreenState extends State<BusinessCategoryScreen> {
  bool isLoading = true;
  List<Article> _articles = [];
  List<Article> _businessArticles = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  void getData() async {
    ArticleService articleService = ArticleService();
    await articleService.getNewsData(countryCode: 'us', category: 'business');
    await articleService.getNewsData(countryCode: 'ng', category: 'business');

    _articles = articleService.fetchArticles();
    _businessArticles = articleService.fetchArticles();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double firstContainerHeight = deviceHeight * 0.6;
    return SingleChildScrollView(
      child: isLoading
          ? Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(),
                  Text('Loading...')
                ],
              ),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BannerCon(
                  text: 'BUSINESS',
                  color: Colors.red.shade700,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 30.0),
                  child: const Text(
                    'BUSINESS',
                    style: TextStyle(fontSize: 28.0, fontFamily: 'Homework'),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10.0),
                  width: double.infinity,
                  height: 600.0,
                  child: GridView(
                    scrollDirection: Axis.horizontal,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            mainAxisSpacing: 15.0,
                            crossAxisSpacing: 15.0,
                            childAspectRatio: 0.75,
                            maxCrossAxisExtent: 300.0),
                    children: _articles.map((article) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) {
                                return ArticleDetail(
                                  title: article.title,
                                  description: article.description,
                                  url: article.url,
                                  imgUrl: article.urlToImage,
                                );
                              },
                            ),
                          );
                        },
                        child: LatestHeadline(
                          countryCode: 'US',
                          countryColor: Colors.blue,
                          headlineTitle: article.title!,
                          imageUrl: article.urlToImage!,
                          headlineSource: article.source!,
                        ),
                      );
                    }).toList(),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 30.0),
                  child: const Text(
                    'DISCOVER MORE',
                    style: TextStyle(fontSize: 28.0, fontFamily: 'Homework'),
                  ),
                ),
                Center(
                  child: Wrap(
                    alignment: WrapAlignment.spaceEvenly,
                    children: _businessArticles.map((e) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) {
                                return ArticleDetail(
                                  title: e.title,
                                  description: e.description,
                                  url: e.url,
                                  imgUrl: e.urlToImage,
                                );
                              },
                            ),
                          );
                        },
                        child: DiscoverMore(
                          image: e.urlToImage!,
                          title: e.title!,
                          child: CountryBadge(
                              size: 30.0,
                              countryColor: Colors.green,
                              textColor: Colors.grey.shade900,
                              countryCode: 'NG'),
                        ),
                      );
                    }).toList(),
                  ),
                )
              ],
            ),
    );
  }
}
