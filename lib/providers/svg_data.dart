import 'package:flutter/material.dart';

/// A [ChangeNotifier] that holds the svg text data.
class SVGData with ChangeNotifier {
  /// Holds the `SVG` Formatted Code.
  String code = '';

  SVGData(this.code);

  void updateCode(String previousColor, String newColor) {
    code = code.replaceAll(previousColor, newColor);
    notifyListeners();
  }

  @override
  String toString() => 'SVGData(code:$code)';
}
