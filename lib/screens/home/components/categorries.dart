import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shop_app/components/TextWithSpeach.dart';

import '../../../constants.dart';

// We need satefull widget for our categories

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories = ["Hand bag", "Jewellery", "Footwear", "Dresses"];
  // By default our first item will be selected
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    double textHeight = _textSize(
        categories.first,
        Theme.of(context).textTheme.bodyLarge,
        MediaQuery.textScaleFactorOf(context));

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: SizedBox(
        height: textHeight + kDefaultPaddin / 4 + 2,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) => buildCategory(index),
        ),
      ),
    );
  }

  Widget buildCategory(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextWithSpeach(
              textSpans: [
                TextSpan(
                  text: categories[index],
                  style: Theme.of(context).textTheme.bodyLarge.copyWith(
                        fontWeight: FontWeight.bold,
                        color: selectedIndex == index
                            ? kTextLightColor
                            : (MediaQuery.of(context).highContrast
                                ? kHighContrastTextLightColor
                                : kTextLightColor),
                      ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: kDefaultPaddin / 4), //top padding 5
              height: 2,
              width: 30,
              color: selectedIndex == index
                  ? (MediaQuery.of(context).highContrast
                      ? kHighContrastTextLightColor
                      : Colors.black)
                  : Colors.transparent,
            )
          ],
        ),
      ),
    );
  }

  // Here it is!
  double _textSize(String text, TextStyle style, double textScaleFactor) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: style),
        maxLines: 1,
        textScaleFactor: textScaleFactor,
        textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: double.infinity);

    return textPainter.height;
  }
}
