import 'package:flutter/material.dart';
import 'package:shop_app/components/TextWithSpeach.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/screens/components/semantic_image.dart';

import '../../../constants.dart';

class ItemCard extends StatelessWidget {
  final Product product;
  final Function press;
  final int index;
  final int totalCount;
  const ItemCard(
      {Key key,
      @required this.product,
      @required this.press,
      @required this.index,
      @required this.totalCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MergeSemantics(
      child: Semantics(
        hint: "Item ${(this.index + 1)} of ${this.totalCount}",
        onTapHint: "Open product",
        child: GestureDetector(
          onTap: press,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(kDefaultPaddin),
                  decoration: BoxDecoration(
                    color: product.color,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Hero(
                    tag: "${product.id}",
                    child: SemanticImage(product.image),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
                child: TextWithSpeach(
                  textSpans: [
                    TextSpan(
                      // products is out demo list
                      text: product.title,
                      style: TextStyle(color: kTextLightColor),
                    ),
                  ],
                ),
              ),
              TextWithSpeach(
                textSpans: [
                  TextSpan(
                    text: "\$${product.price}",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
