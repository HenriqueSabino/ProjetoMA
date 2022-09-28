import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/components/TextWithSpeach.dart';
import 'package:shop_app/constants.dart';

class TutorialCarousel extends StatelessWidget {
  final List<TutorialData> tutorials;

  TutorialCarousel({
    this.tutorials,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height,
        viewportFraction: 1,
      ),
      items: this.tutorials.map(
        (tutorialData) {
          return Builder(
            builder: (BuildContext context) {
              return Column(
                children: [
                  Expanded(
                    flex: 10,
                    child: Image.asset(
                      tutorialData.imagePath,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(
                    height: kDefaultPaddin,
                  ),
                  Expanded(
                    flex: 2,
                    child: SingleChildScrollView(
                      child: TextWithSpeach(
                        textSpans: [
                          TextSpan(
                            text: tutorialData.text,
                            style:
                                Theme.of(context).textTheme.bodySmall.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: MediaQuery.of(context).highContrast
                                          ? kHighContrastTextLightColor
                                          : kTextColor,
                                    ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ).toList(),
    );
  }
}

class TutorialData {
  final String imagePath;
  final String text;

  TutorialData({
    this.imagePath,
    this.text,
  });
}
