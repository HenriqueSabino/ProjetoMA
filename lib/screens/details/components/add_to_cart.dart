import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/components/TextWithSpeach.dart';
import 'package:shop_app/models/Product.dart';

import '../../../constants.dart';

class AddToCart extends StatelessWidget {
  const AddToCart({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: kDefaultPaddin),
            height: 50,
            width: 58,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: MediaQuery.of(context).highContrast
                    ? Theme.of(context).primaryColorLight
                    : product.color,
              ),
            ),
            child: Semantics(
              label: "Add to cart",
              child: IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/add_to_cart.svg",
                  color: MediaQuery.of(context).highContrast
                      ? Theme.of(context).primaryColorLight
                      : product.color,
                ),
                onPressed: () {},
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 50,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: MediaQuery.of(context).highContrast
                        ? Theme.of(context).primaryColorLight
                        : product.color,
                  ),
                ),
                child: Semantics(
                  label: "Buy now",
                  child: TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    onPressed: () {},
                    child: TextWithSpeach(
                      textSpans: [
                        TextSpan(
                          text: "Buy Now".toUpperCase(),
                          style: Theme.of(context).textTheme.bodyLarge.copyWith(
                                fontWeight: FontWeight.bold,
                                color: MediaQuery.of(context).highContrast
                                    ? Theme.of(context).primaryColorLight
                                    : product.color,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
