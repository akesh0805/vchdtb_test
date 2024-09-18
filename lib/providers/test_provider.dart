import 'package:flutter/material.dart';
import 'package:vchdtb_test/models/test.dart';

class TestProvider with ChangeNotifier {
  Test? _test;

  Test? get test => _test;

  void setTest(Test newTest) {
    _test = newTest;
    notifyListeners();
  }

  void clearTest() {
    _test = null;
    notifyListeners();
  }
}