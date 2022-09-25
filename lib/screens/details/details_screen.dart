import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/screens/details/components/body.dart';

class DetailsScreen extends StatelessWidget {
  final Product product;

  const DetailsScreen({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // each product have a color
      backgroundColor: MediaQuery.of(context).highContrast ? Theme.of(context).backgroundColor : product.color,
      appBar: buildAppBar(context),
      body: Body(product: product),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: MediaQuery.of(context).highContrast ? Theme.of(context).backgroundColor : product.color,
      elevation: 0,
      leading: Semantics(
        label: "Back",
        child: IconButton(
          icon: SvgPicture.asset(
            'assets/icons/back.svg',
            color: Colors.white,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      actions: <Widget>[
        Semantics(
          label: "Search",
          onTapHint: "Search products",
          child: IconButton(
            icon: SvgPicture.asset("assets/icons/search.svg"),
            onPressed: () {},
          ),
        ),
        Semantics(
          label: "Cart",
          onTapHint: "View your cart",
          child: IconButton(
            icon: SvgPicture.asset("assets/icons/cart.svg"),
            onPressed: () {},
          ),
        ),
        SizedBox(width: kDefaultPaddin / 2)
      ],
    );
  }
}
