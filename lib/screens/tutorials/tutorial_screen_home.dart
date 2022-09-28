import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/constants.dart';

import '../../components/TutorialCarousel.dart';

class TutorialHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: TutorialCarousel(
        tutorials: [
          TutorialData(
            imagePath: 'assets/images/home_2.jpg',
            text: "Selecione uma categoria",
          ),
          TutorialData(
            imagePath: 'assets/images/home_1.jpg',
            text: "Selecione um produto",
          ),
          TutorialData(
            imagePath: 'assets/images/home_3.jpg',
            text: "Realizar pesquisa",
          ),
          TutorialData(
            imagePath: 'assets/images/home_4.jpg',
            text: "Ir para o carrinho",
          ),
          TutorialData(
            imagePath: 'assets/images/home_5.jpg',
            text: "Visitar tutorial de compra",
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/back.svg"),
        color:
            MediaQuery.of(context).highContrast ? Colors.white : Colors.black,
        onPressed: () => Navigator.pop(context),
      ),
      actions: <Widget>[SizedBox(width: kDefaultPaddin / 2)],
    );
  }
}
