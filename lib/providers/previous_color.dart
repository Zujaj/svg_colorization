import 'package:flutter/material.dart';

/// A [ChangeNotifier] that holds the previous hex color value.
class PreviousColor with ChangeNotifier {
  /// Holds the Hex Color Value.
  String value = '';

  PreviousColor(this.value);

  void updateValue(String newValue) {
    value = newValue;
    notifyListeners();
  }

  @override
  String toString() => 'PreviousColor(value:$value)';
}
