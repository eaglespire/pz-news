import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pt_news/constants.dart';
import 'package:pt_news/services/web_service.dart';
import 'package:url_launcher/url_launcher.dart';

TextStyle kstyleTitle = TextStyle(
  color: Colors.grey[900],
  fontSize: 25.0,
  fontFamily: 'Lorabold',
);
TextStyle kstyleDescription = TextStyle(
  color: Colors.grey.shade900,
  fontSize: 21.0,
  fontFamily: 'Solitas',
);

class ArticleDetail extends StatelessWidget {
  const ArticleDetail(
      {Key? key,
      required this.title,
      required this.url,
      required this.description,
      required this.imgUrl})
      : super(key: key);
  final String? title;
  final String? imgUrl;
  final String? url;
  final String? description;
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    Orientation orientation = MediaQuery.of(context).orientation;
    print(orientation);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            appName,
            style: appBarStyle,
          ),
        ),
        body: ListView(children: [
          Container(
            height: orientation == Orientation.portrait
                ? deviceHeight
                : deviceWidth,
            color: Colors.grey,
            width: deviceWidth,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    image: DecorationImage(
                      colorFilter: ColorFilter.mode(
                          Colors.grey.shade600, BlendMode.overlay),
                      fit: BoxFit.cover,
                      image: NetworkImage(imgUrl!),
                    ),
                  ),
                  width: deviceWidth,
                  height: 300,
                ),
                Positioned(
                  top: 235,
                  //right: 20.0,
                  child: Container(
                    width: deviceWidth,
                    height: deviceHeight,
                    padding: const EdgeInsets.all(20.0),
                    //margin: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(50.0),
                        topRight: Radius.circular(50.0),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title!,
                            style: kstyleTitle,
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            description!,
                            style: kstyleDescription,
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  //const url = 'https://peacetrinityacademy.com';
                                  openBrowserUrl(url: url!, inApp: true);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: secColor,
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  width: 110.0,
                                  height: 40,
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Text(
                                          'Read More',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'Lorabold'),
                                        ),
                                        Icon(
                                          Icons.keyboard_arrow_right,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 60.0,
                          ),
                          Text(
                            'We have more for you',
                            style: kstyleDescription,
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Wrap(
                            alignment: WrapAlignment.center,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.all(15.0),
                                    primary: mainColor),
                                onPressed: () {},
                                child: const Text(
                                  'Africa',
                                  style: TextStyle(fontFamily: 'Lorabold'),
                                ),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.all(15.0),
                                    primary: Colors.purple),
                                onPressed: () {},
                                child: const Text(
                                  'Business',
                                  style: TextStyle(fontFamily: 'Lorabold'),
                                ),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.all(15.0),
                                    primary: Colors.orange),
                                onPressed: () {},
                                child: const Text(
                                  'Health',
                                  style: TextStyle(fontFamily: 'Lorabold'),
                                ),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.all(15.0),
                                    primary: Colors.amber),
                                onPressed: () {},
                                child: const Text(
                                  'Entertainment',
                                  style: TextStyle(fontFamily: 'Lorabold'),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
