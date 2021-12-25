import 'package:flutter/material.dart';
import 'package:pt_news/constants.dart';

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
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          appName,
          style: appBarStyle,
        ),
      ),
      body: ListView(
        children: [
          buildFirstContainer(height: deviceHeight, img: imgUrl),
          buildSecondContainer(
              height: deviceHeight, title: title, description: description)
        ],
      ),
    );
  }
}

Widget buildFirstContainer({required double height, String? img}) {
  return Container(
    padding: const EdgeInsets.all(20.0),
    height: 0.5 * height,
    width: double.infinity,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(img!),
        )),
  );
}

Widget buildSecondContainer(
    {required double height,
    required String? title,
    required String? description}) {
  TextStyle _styleTitle = TextStyle(
      color: Colors.grey.shade900,
      fontSize: 25.0,
      fontFamily: 'Lorabold',
      fontWeight: FontWeight.w600);
  TextStyle _styleDescription = TextStyle(
      color: Colors.grey.shade900,
      fontSize: 21.0,
      fontFamily: 'Solitas',
      fontWeight: FontWeight.w600);
  return Material(
    elevation: 5.0,
    color: Colors.white,
    child: Container(
      padding: const EdgeInsets.all(20.0),
      width: double.infinity,
      height: 0.7 * height,
      child: Column(
        children: [
          Text(
            title!,
            style: _styleTitle,
          ),
          const SizedBox(
            height: 20.0,
          ),
          Text(
            description!,
            style: _styleDescription,
          )
        ],
      ),
    ),
  );
}
