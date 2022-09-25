import 'package:flutter/material.dart';
import 'package:shop_app/components/TextWithSpeach.dart';
import 'package:shop_app/models/Product.dart';

import '../../../constants.dart';

class ColorAndSize extends StatefulWidget {
  ColorAndSize({
    Key key,
    @required this.product,
  })  : selectedColor = 0,
        super(key: key);

  final Product product;
  int selectedColor;
  final List<ColorData> colors = [
    ColorData(color: Color(0xFF356C95), description: "Blue"),
    ColorData(color: Color(0xFFF8C078), description: "Beige"),
    ColorData(color: Color(0xFFA29B9B), description: "Gray")
  ];

  @override
  State<ColorAndSize> createState() => _ColorAndSizeState();
}

class _ColorAndSizeState extends State<ColorAndSize> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextWithSpeach(textSpans: [TextSpan(text: "Color")]),
              Row(
                children: widget.colors
                    .asMap()
                    .entries
                    .map(
                      (e) => Semantics(
                        label: widget.colors[e.key].description,
                        onTapHint: "Select as product color",
                        inMutuallyExclusiveGroup: true,
                        selected: widget.selectedColor == e.key,
                        child: ColorDot(
                          colorData: widget.colors[e.key],
                          isSelected: widget.selectedColor == e.key,
                          onTap: () =>
                              setState(() => widget.selectedColor = e.key),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
        Expanded(
          child: TextWithSpeach(
            textSpans: <TextSpan>[
              TextSpan(
                style: TextStyle(color: kTextColor),
                children: <TextSpan>[
                  TextSpan(
                    text: "Size\n",
                    style: TextStyle(
                      color: MediaQuery.of(context).highContrast
                          ? kHighContrastTextLightColor
                          : kTextColor,
                    ),
                  ),
                  TextSpan(
                    text: "${widget.product.size} cm",
                    style: Theme.of(context).textTheme.headline5.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ColorData {
  const ColorData({this.color, this.description});

  final Color color;
  final String description;
}

class ColorDot extends StatelessWidget {
  final ColorData colorData;
  final bool isSelected;
  final Function onTap;

  const ColorDot({
    Key key,
    this.colorData,
    // by default isSelected is false
    this.isSelected = false,
    this.onTap = null,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(
          top: kDefaultPaddin / 4,
          right: kDefaultPaddin / 2,
        ),
        padding: EdgeInsets.all(2.5),
        height: 24,
        width: 24,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected ? colorData.color : Colors.transparent,
          ),
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: colorData.color,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
