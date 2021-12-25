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
    fontFamily: 'Loraregular',
    fontWeight: FontWeight.bold);

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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            appName,
            style: appBarStyle,
          ),
        ),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            if (constraints.maxWidth >= 600) {
              return landscapeMode();
            } else {
              return portraitMode();
            }
          },
        ),
      ),
    );
  }

  Widget portraitMode() {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.green,
              image: DecorationImage(
                colorFilter:
                    ColorFilter.mode(Colors.grey.shade600, BlendMode.overlay),
                fit: BoxFit.cover,
                image: NetworkImage(imgUrl!),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: ListView(children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(50.0),
                  bottomRight: Radius.circular(50.0),
                ),
              ),
              padding: const EdgeInsets.all(20.0),
              //height: 100.0,
              width: double.infinity,
              child: Column(
                children: [
                  Text(
                    title!,
                    style: kArticleTitleStyling,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    description!,
                    style: kArticleBodyStyling,
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
                              borderRadius: BorderRadius.circular(10.0)),
                          width: 110.0,
                          height: 40,
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
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
                    style: kArticleTitleStyling,
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
            // Container(
            //   color: Colors.purple,
            //   height: 300.0,
            //   width: double.infinity,
            // ),
            // Container(
            //   color: Colors.yellowAccent,
            //   height: 200.0,
            //   width: double.infinity,
            // ),
          ]),
        ),
      ],
    );
  }

  Widget landscapeMode() {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.green,
              image: DecorationImage(
                colorFilter:
                    ColorFilter.mode(Colors.grey.shade600, BlendMode.overlay),
                fit: BoxFit.cover,
                image: NetworkImage(imgUrl!),
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView(children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(50.0),
                  bottomRight: Radius.circular(50.0),
                ),
              ),
              padding: const EdgeInsets.all(20.0),
              //height: 100.0,
              width: double.infinity,
              child: Column(
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
                              borderRadius: BorderRadius.circular(10.0)),
                          width: 110.0,
                          height: 40,
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
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
            // Container(
            //   color: Colors.purple,
            //   height: 300.0,
            //   width: double.infinity,
            // ),
            // Container(
            //   color: Colors.yellowAccent,
            //   height: 200.0,
            //   width: double.infinity,
            // ),
          ]),
        ),
      ],
    );
  }
}
