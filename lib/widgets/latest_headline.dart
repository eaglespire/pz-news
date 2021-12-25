import 'package:flutter/material.dart';
import 'package:pt_news/constants.dart';
import 'package:pt_news/widgets/country_badge.dart';

class LatestHeadline extends StatelessWidget {
  const LatestHeadline(
      {Key? key,
      required this.imageUrl,
      required this.countryColor,
      required this.countryCode,
      required this.headlineTitle,
      required this.headlineSource})
      : super(key: key);

  final String imageUrl;
  final Color countryColor;
  final String countryCode;
  final String headlineTitle;
  final String headlineSource;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      shadowColor: Colors.grey.shade200,
      elevation: 3.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
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
                  image: NetworkImage(imageUrl),
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
                  CountryBadge(
                      size: 30.0,
                      countryColor: countryColor,
                      textColor: Colors.grey.shade900,
                      countryCode: countryCode),
                  Flexible(
                    child: Text(
                      headlineTitle,
                      style: kArticleTitleStyling,
                    ),
                  ),
                  Flexible(
                    child: Text(
                      'Source - $headlineSource',
                      style: kArticleTitleStyling,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
