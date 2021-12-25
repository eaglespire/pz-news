import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pt_news/services/us_news.dart';

class GeneralCategoryScreen extends StatefulWidget {
  const GeneralCategoryScreen({Key? key}) : super(key: key);

  @override
  _GeneralCategoryScreenState createState() => _GeneralCategoryScreenState();
}

class _GeneralCategoryScreenState extends State<GeneralCategoryScreen> {
  List _articles = [];
  final UsNewsArticles _usNewsArticles = UsNewsArticles();
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    List articles = await _usNewsArticles.processData();

    setState(() {
      _articles = articles;
    });
    print(articles);
  }

  @override
  Widget build(BuildContext context) {
    print(_articles.length);
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    double firstContainerHeight = deviceHeight * 0.6;
    print('$deviceHeight and $deviceWidth');
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FutureBuilder(
            future: _usNewsArticles.processData(),
            builder: (BuildContext context, snapshot) {
              if (snapshot.hasData) {
                return Container(
                  margin: const EdgeInsets.all(10.0),
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.0),
                    //color: Colors.red,
                    image: DecorationImage(
                      colorFilter: ColorFilter.mode(
                          Colors.grey.shade800, BlendMode.overlay),
                      fit: BoxFit.cover,
                      alignment: Alignment.centerRight,
                      image: NetworkImage('${_articles[10]['urlToImage']}'),
                    ),
                  ),
                  width: double.infinity,
                  height: firstContainerHeight,
                  child: Padding(
                    padding: EdgeInsets.only(top: 0.45 * firstContainerHeight),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            '${_articles[10]['title']}',
                            style: const TextStyle(
                                fontSize: 26.0,
                                color: Colors.white,
                                fontFamily: 'Nazli',
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            buildCircleSign(
                                size: 40.0, textColor: Colors.white),
                            const Text(
                              '4 hours ago',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Dani',
                                  fontSize: 20.0),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              }
              return const CircularProgressIndicator();
            },
          ),
          Container(
            //margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
            child: const Text(
              'LATEST HEADLINES',
              style: TextStyle(fontSize: 28.0, fontFamily: 'Homework'),
            ),
          ),
          FutureBuilder(
            future: _usNewsArticles.processData(),
            builder: (BuildContext context, snapshot) {
              if (snapshot.hasData) {
                print(snapshot.data);
                return Container(
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
                    children: List.generate(
                      _articles.length,
                      (index) {
                        return Material(
                          color: Colors.white,
                          shadowColor: Colors.green,
                          elevation: 3.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: buildContainer(
                              title: _articles[index]['title'],
                              source: _articles[index]['source']['name'],
                              imageUrl: _articles[index]['urlToImage'] ??
                                  'https://res.cloudinary.com/eaglespire-com/image/upload/v1639903096/no-image-icon-23500_zvck2y.jpg'),
                        );
                      },
                    ),
                  ),
                );
              } else if (snapshot.hasError) {
                return const Text('Please Check you network connection');
              }
              return const CircularProgressIndicator();
            },
          )
        ],
      ),
    );
  }
}

Widget buildContainer(
    {required String title, required String source, required String imageUrl}) {
  final TextStyle _kArticleStyle = TextStyle(
      color: Colors.grey.shade900,
      fontSize: 19.0,
      fontFamily: 'Nazli',
      fontWeight: FontWeight.bold);
  return Row(
    children: [
      Expanded(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            image: DecorationImage(
                colorFilter:
                    ColorFilter.mode(Colors.grey.shade900, BlendMode.screen),
                fit: BoxFit.cover,
                image: NetworkImage(imageUrl)
                // image: NetworkImage(imageUrl ??= 'assets/images/ren-descartes'
                //     '.jpg'),
                ),
          ),
        ),
      ),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildCircleSign(size: 30.0, textColor: Colors.grey.shade900),
              Flexible(
                child: Text(
                  title,
                  style: _kArticleStyle,
                ),
              ),
              Flexible(
                child: Text(
                  'Source - $source',
                  style: _kArticleStyle,
                ),
              )
            ],
          ),
        ),
      ),
    ],
  );
}

Widget buildCircleSign({required double size, required Color textColor}) {
  return Row(
    children: [
      ClipOval(
        child: Container(
          width: size,
          height: size,
          decoration: const BoxDecoration(
            color: Colors.blue,
          ),
        ),
      ),
      const SizedBox(
        width: 8.0,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'USA',
            style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
                fontFamily: 'Dani'),
          ),
          Text(
            'TODAY',
            style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
                fontFamily: 'Dani'),
          ),
        ],
      )
    ],
  );
}
