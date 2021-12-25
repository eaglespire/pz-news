import 'package:flutter/material.dart';
import 'package:pt_news/constants.dart';
import 'package:pt_news/widgets/country_badge.dart';

class DiscoverMore extends StatelessWidget {
  const DiscoverMore(
      {Key? key, required this.image, required this.title, required this.child})
      : super(key: key);

  final String image;
  final String title;
  final CountryBadge child;
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: 0.45 * deviceWidth,
      child: Card(
        color: Colors.grey.shade50,
        elevation: 2.0,
        child: Column(
          children: [
            Image.network(image),
            Container(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Text(
                    title,
                    style: kArticleTitleStyling,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                    child: child,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
