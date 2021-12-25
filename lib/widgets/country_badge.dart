import 'package:flutter/material.dart';

class CountryBadge extends StatelessWidget {
  const CountryBadge(
      {Key? key,
      required this.size,
      required this.countryColor,
      required this.textColor,
      required this.countryCode})
      : super(key: key);

  final double size;
  final Color countryColor;
  final String countryCode;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipOval(
          child: Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              color: countryColor,
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
              countryCode,
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
}
