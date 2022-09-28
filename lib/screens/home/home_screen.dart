import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/screens/home/components/body.dart';

import '../tutorials/tutorial_screen_home.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
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
          onPressed: () {},
        ),
      ),
      actions: <Widget>[
        Semantics(
          label: "Search",
          onTapHint: "Search products",
          child: IconButton(
            icon: SvgPicture.asset(
              "assets/icons/search.svg",
              // By default our  icon color is white
              color: MediaQuery.of(context).highContrast
                  ? Colors.white
                  : Colors.black,
            ),
            onPressed: () {},
          ),
        ),
        Semantics(
          label: "Cart",
          onTapHint: "View your cart",
          child: IconButton(
            icon: SvgPicture.asset(
              "assets/icons/cart.svg",
              // By default our  icon color is white
              color: MediaQuery.of(context).highContrast
                  ? Colors.white
                  : Colors.black,
            ),
            onPressed: () {},
          ),
        ),
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/question-mark-svgrepo-com.svg",
            // By default our  icon color is white
            color: MediaQuery.of(context).highContrast
                ? Colors.white
                : Color.fromARGB(255, 252, 6, 6),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TutorialHomeScreen(),
              ),
            );
          },
        ),
        SizedBox(width: kDefaultPaddin / 2)
      ],
    );
  }
}
