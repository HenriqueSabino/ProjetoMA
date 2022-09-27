import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height,
      ),
      items: [
        TutorialCard(imagePath: 'assets/images/home_1.jpg', text: "A"),
        TutorialCard(imagePath: 'assets/images/home_2.jpg', text: "A"),
        TutorialCard(imagePath: 'assets/images/home_3.jpg', text: "A"),
        TutorialCard(imagePath: 'assets/images/home_4.jpg', text: "A"),
        TutorialCard(imagePath: 'assets/images/home_5.jpg', text: "A")
      ].map((tutorialData) {
        return Builder(builder: (BuildContext context) {
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
                  child: Text(
                    tutorialData.text,
                    style: Theme.of(context).textTheme.bodySmall.copyWith(
                          fontWeight: FontWeight.bold,
                          color: MediaQuery.of(context).highContrast
                              ? kHighContrastTextLightColor
                              : kTextColor,
                        ),
                  ),
                ),
              ),
            ],
          );
        });
      }).toList(),
    );
  }
}

class TutorialCard {
  final String imagePath;
  final String text;

  TutorialCard({
    this.imagePath,
    this.text,
  });
}
