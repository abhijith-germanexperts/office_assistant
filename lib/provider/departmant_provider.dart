import 'package:flutter/foundation.dart';

class StringProvider extends ChangeNotifier {
  String _stringValue = "All Departments";

  String get stringValue => _stringValue;

  void setStringValue(String value) {
    _stringValue = value;
    notifyListeners();
  }
}
