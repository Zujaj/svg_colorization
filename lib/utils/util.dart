import 'dart:convert';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'dart:ui';

import 'package:flutter/services.dart';

/// A class that handles basic utility functions.
class Util {
  /// Prevents From Object Instantiation.
  Util._();

  /// Formats the given [input] to hex value & copies it to the [Clipboard].
  /// ```dart
  /// print(copyToClipboard('#f7ebcb')); //F7EBCB
  /// ```
  static Future<void> copyToClipboard(String input) async {
    String textToCopy = input.replaceFirst('#', '').toUpperCase();
    if (textToCopy.startsWith('FF') && textToCopy.length == 8) {
      textToCopy = textToCopy.replaceFirst('FF', '');
    }
    await Clipboard.setData(ClipboardData(text: '#$textToCopy'));
  }

  /// Converts the [Color] object to Hex Formatted String.
  ///
  /// ```dart
  /// const color = Color(0xFFFF00FF);
  /// print(colorToHexString(color)); //'#FF00FF'
  /// ```
  static String colorToHexString(Color color) =>
      '#${color.value.toRadixString(16).substring(2)}';

  /// Works for `Web` only.
  static Future<void> saveAsSVG(String svgCode) async {
    html.AnchorElement()
      ..href =
          '${Uri.dataFromString(svgCode, mimeType: 'image/svg+xml', encoding: utf8)}'
      ..download = 'result.svg'
      ..style.display = 'none'
      ..click();
  }
}
