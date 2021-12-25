import 'package:flutter/material.dart';
import 'package:pt_news/constants.dart';

class AboutDeveloper extends StatelessWidget {
  const AboutDeveloper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(
          child: CircleAvatar(
            backgroundImage: AssetImage(
              'assets/images/andrew'
              '.jpg',
            ),
            radius: 100.0,
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Text(
                'Ohwofasa Andrew',
                style: kArticleTitleStyling,
              ),
              Text(
                'whymeandrew@gmail.com',
                style: kArticleTitleStyling,
              ),
              const SizedBox(
                height: 30.0,
              ),
              Text(
                'A software developer with 4 years experience building web'
                ' and mobile applications.',
                textAlign: TextAlign.center,
                style: kArticleBodyStyling,
              )
            ],
          ),
        ),
      ],
    );
  }
}
