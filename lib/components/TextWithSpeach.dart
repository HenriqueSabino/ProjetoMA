import 'dart:async';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class TextWithSpeach extends StatefulWidget {
  const TextWithSpeach({
    this.textSpans,
  }) : super();

  final List<TextSpan> textSpans;

  @override
  _TextWithSpeachState createState() => _TextWithSpeachState();
}

enum TtsState { playing, stopped, paused, continued }

class _TextWithSpeachState extends State<TextWithSpeach> {
  FlutterTts flutterTts;
  String language;
  String engine;
  double volume = 0.5;
  double pitch = 1.0;
  double rate = 0.5;

  TtsState ttsState = TtsState.stopped;

  get isPlaying => ttsState == TtsState.playing;
  get isStopped => ttsState == TtsState.stopped;
  get isPaused => ttsState == TtsState.paused;
  get isContinued => ttsState == TtsState.continued;

  bool get isIOS => !kIsWeb && Platform.isIOS;
  bool get isAndroid => !kIsWeb && Platform.isAndroid;
  bool get isWindows => !kIsWeb && Platform.isWindows;
  bool get isWeb => kIsWeb;

  @override
  initState() {
    super.initState();
    initTts();
  }

  initTts() {
    flutterTts = FlutterTts();

    _setAwaitOptions();

    if (isAndroid) {
      _getDefaultEngine();
      _getDefaultVoice();
    }

    flutterTts.setStartHandler(() {
      setState(() {
        ttsState = TtsState.playing;
      });
    });

    flutterTts.setCompletionHandler(() {
      setState(() {
        ttsState = TtsState.stopped;
      });
    });

    flutterTts.setCancelHandler(() {
      setState(() {
        ttsState = TtsState.stopped;
      });
    });

    if (isWeb || isIOS || isWindows) {
      flutterTts.setPauseHandler(() {
        setState(() {
          ttsState = TtsState.paused;
        });
      });

      flutterTts.setContinueHandler(() {
        setState(() {
          ttsState = TtsState.continued;
        });
      });
    }

    flutterTts.setErrorHandler((msg) {
      setState(() {
        ttsState = TtsState.stopped;
      });
    });
  }

  Future _getDefaultEngine() async {
    var engine = await flutterTts.getDefaultEngine;
    if (engine != null) {
      print(engine);
    }
  }

  Future _getDefaultVoice() async {
    var voice = await flutterTts.getDefaultVoice;
    if (voice != null) {
      print(voice);
    }
  }

  Future _speak(String text) async {
    await flutterTts.setVolume(volume);
    await flutterTts.setSpeechRate(rate);
    await flutterTts.setPitch(pitch);
    await flutterTts.setLanguage("en-US");

    if (text != null) {
      if (text.isNotEmpty) {
        setState(() => ttsState = TtsState.playing);
        await flutterTts.speak(text);
      }
    }
  }

  Future _setAwaitOptions() async {
    await flutterTts.awaitSpeakCompletion(true);
  }

  Future _stop() async {
    var result = await flutterTts.stop();
    if (result == 1) setState(() => ttsState = TtsState.stopped);
  }

  @override
  void dispose() {
    super.dispose();
    flutterTts.stop();
  }

  bool isPlaingVoice = false;

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
            if (isPlaying) {
              _stop();
            } else {
              _speak(element.text);
            }
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
