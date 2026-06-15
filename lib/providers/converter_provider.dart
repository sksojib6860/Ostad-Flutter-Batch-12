import 'package:flutter/material.dart';
import '../models/unit_category.dart';
import '../utils/conversion_logic.dart';

class ConverterProvider with ChangeNotifier {
  UnitCategory _currentCategory = UnitCategory.length;
  String _fromUnit = 'Meter';
  String _toUnit = 'Kilometer';
  double _inputValue = 0.0;
  double _result = 0.0;

  UnitCategory get currentCategory => _currentCategory;
  String get fromUnit => _fromUnit;
  String get toUnit => _toUnit;
  double get inputValue => _inputValue;
  double get result => _result;

  void setCategory(UnitCategory category) {
    _currentCategory = category;
    _fromUnit = ConversionLogic.unitLists[category]![0];
    _toUnit = ConversionLogic.unitLists[category]![1];
    _calculateResult();
    notifyListeners();
  }

  void setFromUnit(String unit) {
    _fromUnit = unit;
    _calculateResult();
    notifyListeners();
  }

  void setToUnit(String unit) {
    _toUnit = unit;
    _calculateResult();
    notifyListeners();
  }

  void setInputValue(String value) {
    _inputValue = double.tryParse(value) ?? 0.0;
    _calculateResult();
    notifyListeners();
  }

  void swapUnits() {
    String temp = _fromUnit;
    _fromUnit = _toUnit;
    _toUnit = temp;
    _calculateResult();
    notifyListeners();
  }

  void _calculateResult() {
    _result = ConversionLogic.convert(
        _inputValue, _fromUnit, _toUnit, _currentCategory);
  }
}
