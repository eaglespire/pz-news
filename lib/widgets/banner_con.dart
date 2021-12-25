import 'package:flutter/material.dart';

import 'country_badge.dart';

class BannerCon extends StatelessWidget {
  const BannerCon({Key? key, required this.text, required this.color})
      : super(key: key);
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double firstContainerHeight = deviceHeight * 0.6;
    return Container(
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40.0),
        //color: Colors.red,
        image: DecorationImage(
          colorFilter: ColorFilter.mode(color, BlendMode.modulate),
          fit: BoxFit.cover,
          alignment: Alignment.centerRight,
          image: const AssetImage('assets/images/network-2.jpg'),
        ),
      ),
      width: double.infinity,
      height: firstContainerHeight,
      child: Padding(
        padding: EdgeInsets.only(top: 0.45 * firstContainerHeight),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(
              child: Text(
                'PZ NEWS',
                style: TextStyle(
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
            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                    fontSize: 26.0,
                    color: Colors.white,
                    fontFamily: 'Nazli',
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CountryBadge(
                    size: 40.0,
                    countryColor: Colors.green.shade900,
                    textColor: Colors.grey.shade200,
                    countryCode: 'NEWS'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
