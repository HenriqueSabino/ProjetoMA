import 'package:flutter/material.dart';

class HighContrast {
  static bool _toggleStatus = false;
  static bool _useToggle = false;

  static void toggleHighContrast(bool value) {
    _toggleStatus = value;
    _useToggle = true;
  }

  static bool isHighContrastActive(BuildContext context) {
    if(_useToggle) {
      return _toggleStatus;
    }
    return _toggleStatus || MediaQuery.of(context).highContrast;
  }
}