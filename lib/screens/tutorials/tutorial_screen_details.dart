import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/constants.dart';

import '../../components/TutorialCarousel.dart';

class TutorialDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: TutorialCarousel(
        tutorials: [
          TutorialData(
            imagePath: 'assets/images/details_1.jpg',
            text: "Zoom product image",
          ),
          TutorialData(
            imagePath: 'assets/images/details_2.jpg',
            text: "Choose product color",
          ),
          TutorialData(
            imagePath: 'assets/images/details_3.jpg',
            text: "Items quantity",
          ),
          TutorialData(
            imagePath: 'assets/images/details_4.jpg',
            text: "Add to cart",
          ),
          TutorialData(
            imagePath: 'assets/images/details_5.jpg',
            text: "Go to cart",
          ),
          TutorialData(
            imagePath: 'assets/images/details_6.jpg',
            text: "Favorite product",
          ),
          TutorialData(
            imagePath: 'assets/images/details_7.jpg',
            text: "Go back to shopping page",
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      elevation: 0,
      leading: Semantics(
        label: "Back",
        child: IconButton(
          icon: SvgPicture.asset("assets/icons/back.svg"),
          color:
              MediaQuery.of(context).highContrast ? Colors.white : Colors.black,
          onPressed: () => Navigator.pop(context),
        ),
      ),
      actions: <Widget>[SizedBox(width: kDefaultPaddin / 2)],
    );
  }
}
