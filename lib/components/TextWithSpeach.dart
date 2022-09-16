import 'dart:ffi';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TextWithSpeach extends StatefulWidget {
  const TextWithSpeach({
    this.textSpans,
  }) : super();

  final List<TextSpan> textSpans;

  @override
  _TextWithSpeachState createState() => _TextWithSpeachState();
}

class _TextWithSpeachState extends State<TextWithSpeach> {
  List<InlineSpan> textSpansWithRecognizer(List<TextSpan> entryTextSpans) {
    List<InlineSpan> tempListTextSpans = [];
    if (entryTextSpans == null) {
      return entryTextSpans;
    }
    for (var element in entryTextSpans) {
      tempListTextSpans.add(TextSpan(
        text: element.text,
        style: element.style,
        children: textSpansWithRecognizer(element.children),
        recognizer: LongPressGestureRecognizer()
          ..onLongPress = () {
            print("Lonng press " + element.text);
          },
        mouseCursor: element.mouseCursor,
        onEnter: element.onEnter,
        onExit: element.onExit,
        semanticsLabel: element.semanticsLabel,
        locale: element.locale,
        spellOut: element.spellOut,
      ));
    }
    return tempListTextSpans;
  }

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: textSpansWithRecognizer(widget.textSpans),
      ),
    );
  }
}
