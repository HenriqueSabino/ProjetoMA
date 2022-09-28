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
            text: "Ampliar imagem do produto",
          ),
          TutorialData(
            imagePath: 'assets/images/details_2.jpg',
            text: "Escolher cor do produto",
          ),
          TutorialData(
            imagePath: 'assets/images/details_3.jpg',
            text: "Quantidade de itens",
          ),
          TutorialData(
            imagePath: 'assets/images/details_4.jpg',
            text: "Adicionar o item ao carrinho",
          ),
          TutorialData(
            imagePath: 'assets/images/details_5.jpg',
            text: "Ir para o carrinho",
          ),
          TutorialData(
            imagePath: 'assets/images/details_6.jpg',
            text: "Favoritar o produto",
          ),
          TutorialData(
            imagePath: 'assets/images/details_7.jpg',
            text: "Voltar para tela de compra",
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
