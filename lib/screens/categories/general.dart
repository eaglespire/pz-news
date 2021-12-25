import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pt_news/models/article.dart';
import 'package:pt_news/screens/categories/article_detail.dart';
import 'package:pt_news/services/article_service.dart';
import 'package:pt_news/widgets/banner_con.dart';
import 'package:pt_news/widgets/country_badge.dart';
import 'package:pt_news/widgets/discover_more.dart';
import 'package:pt_news/widgets/latest_headline.dart';

class GeneralCategoryScreen extends StatefulWidget {
  const GeneralCategoryScreen({Key? key}) : super(key: key);

  @override
  _GeneralCategoryScreenState createState() => _GeneralCategoryScreenState();
}

class _GeneralCategoryScreenState extends State<GeneralCategoryScreen> {
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
    await articleService.getNewsData(countryCode: 'us', category: 'general');
    await articleService.getNewsData(countryCode: 'us', category: 'business');

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
                const BannerCon(
                  text: 'WORLD NEWS',
                  color: Colors.blue,
                ),
                // GestureDetector(
                //   onTap: () {
                //     Navigator.push(context,
                //         MaterialPageRoute(builder: (context) {
                //       return ArticleDetail(
                //           title: _articles[10].title,
                //           url: _articles[10].url,
                //           description: _articles[10].description,
                //           imgUrl: _articles[10].urlToImage);
                //     }));
                //   },
                //   child: Container(
                //     margin: const EdgeInsets.all(10.0),
                //     padding: const EdgeInsets.all(20.0),
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(40.0),
                //       //color: Colors.red,
                //       image: DecorationImage(
                //         colorFilter: ColorFilter.mode(
                //             Colors.grey.shade600, BlendMode.overlay),
                //         fit: BoxFit.cover,
                //         alignment: Alignment.centerRight,
                //         image: NetworkImage('${_articles[10].urlToImage}'),
                //       ),
                //     ),
                //     width: double.infinity,
                //     height: firstContainerHeight,
                //     child: Padding(
                //       padding:
                //           EdgeInsets.only(top: 0.45 * firstContainerHeight),
                //       child: Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Expanded(
                //             child: Text(
                //               '${_articles[10].title}',
                //               style: const TextStyle(
                //                   fontSize: 26.0,
                //                   color: Colors.white,
                //                   fontFamily: 'Nazli',
                //                   fontWeight: FontWeight.bold),
                //               textAlign: TextAlign.start,
                //             ),
                //           ),
                //           const SizedBox(
                //             height: 10.0,
                //           ),
                //           Expanded(
                //             child: Row(
                //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //               children: const [
                //                 CountryBadge(
                //                     size: 40.0,
                //                     countryColor: Colors.blue,
                //                     textColor: Colors.white,
                //                     countryCode: 'USA'),
                //                 Text(
                //                   '4 hours ago',
                //                   style: TextStyle(
                //                       color: Colors.white,
                //                       fontWeight: FontWeight.bold,
                //                       fontFamily: 'Dani',
                //                       fontSize: 20.0),
                //                 )
                //               ],
                //             ),
                //           )
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 30.0),
                  child: const Text(
                    'LATEST HEADLINES',
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
                          countryCode: 'USA',
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
                              countryColor: Colors.blue,
                              textColor: Colors.grey.shade900,
                              countryCode: 'USA'),
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
