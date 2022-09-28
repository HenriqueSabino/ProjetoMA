import 'package:flutter/material.dart';
import 'package:shop_app/components/TextWithSpeach.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/screens/details/details_screen.dart';

import 'categories.dart';
import 'item_card.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  ScrollController _scrollController = new ScrollController();
  bool _showBackToTop = false;

  @override
  Widget build(BuildContext context) {
    _scrollController.addListener(() => _scrollListener(context));

    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
              child: TextWithSpeach(
                textSpans: [
                  TextSpan(
                    text: "Women",
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Categories(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
                child: GridView.builder(
                  itemCount: products.length,
                  controller: _scrollController,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: kDefaultPaddin,
                    crossAxisSpacing: kDefaultPaddin,
                    childAspectRatio: 0.75,
                  ),
                  itemBuilder: (context, index) => ItemCard(
                    index: index,
                    totalCount: products.length,
                    product: products[index],
                    press: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(
                          product: products[index],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(kDefaultPaddin),
          child: _backToTopButton(),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _scrollController.removeListener(() => _scrollListener(context));
    super.dispose();
  }

  Widget _backToTopButton() {
    if (_showBackToTop) {
      return Align(
        alignment: Alignment.bottomRight,
        child: MergeSemantics(
          child: Semantics(
            label: "Back to top",
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColorLight,
                shape: CircleBorder(),
                padding: EdgeInsets.all(kDefaultPaddin),
              ),
              onPressed: () {
                _scrollController.animateTo(0,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.decelerate);
              },
              child: Icon(
                Icons.arrow_upward,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  void _scrollListener(BuildContext context) {
    setState(() {
      _showBackToTop =
          _scrollController.offset >= 0.1 * MediaQuery.of(context).size.height;
    });
  }
}
