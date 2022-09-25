import 'package:flutter/material.dart';
import 'package:shop_app/components/TextWithSpeach.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/screens/components/semantic_image.dart';
import 'package:shop_app/screens/image/image_screen.dart';

import '../../../constants.dart';

class ProductTitleWithImage extends StatelessWidget {
  const ProductTitleWithImage({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MergeSemantics(
            child: Column(
              children: [
                TextWithSpeach(
                  textSpans: [
                    TextSpan(
                      text: "Aristocratic Hand Bag",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                TextWithSpeach(
                  textSpans: [
                    TextSpan(
                      text: product.title,
                      style: Theme.of(context).textTheme.headline4.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: kDefaultPaddin),
          Center(
            child: SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.25,
              child: Hero(
                tag: "${product.id}",
                child: GestureDetector(
                  excludeFromSemantics:
                      MediaQuery.of(context).accessibleNavigation,
                  onTap: () => _openZoomImage(context),
                  child: SemanticImage(
                    product.image,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _openZoomImage(BuildContext context) {
    if (!MediaQuery.of(context).accessibleNavigation) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ImageScreen(
            product: this.product,
          ),
        ),
      );
    }
  }
}
