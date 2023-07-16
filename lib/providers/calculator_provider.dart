import 'package:flutter/foundation.dart';

class CalculationProvider extends ChangeNotifier {
  String _output = "";
  double num1 = 0.0, num2 = 0.0;
  String _operator = "";
  bool _isNegativeSign = false;

  String get output => _output;

  void numButtonPressed(String keyName) {
    _output += keyName;
    notifyListeners();
  }

  void operatorButtonPressed(String operator) {
    num1 = double.parse(_output);
    _operator = operator;
    _output = "";
    notifyListeners();
  }

  void equalButtonPressed() {
    num2 = double.parse(_output);
    if (_operator == "+") {
      _output = (num1 + num2).toString();
      notifyListeners();
    } else if (_operator == "-") {
      _output = (num1 - num2).toString();
      notifyListeners();
    } else if (_operator == "x") {
      _output = (num1 * num2).toString();
      notifyListeners();
    } else if (_operator == "÷") {
      _output = (num1 / num2).toString();
      notifyListeners();
    } else if (_operator == "%") {
      _output = (num1 % num2).toString();
      notifyListeners();
    }
  }

  void clearButtonPressed() {
    _output = "";
    num1 = 0.0;
    num2 = 0.0;
    notifyListeners();
  }

  void signChangePressed() {
    if (!_isNegativeSign) {
      _output = (-(double.parse(_output))).toString();
      _isNegativeSign = false;
      notifyListeners();
    }
    else{
      _output = ((double.parse(_output))).toString();
      _isNegativeSign = true;
      notifyListeners();      
    }
  }
}
