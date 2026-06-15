import '../models/unit_category.dart';

class ConversionLogic {
  static const Map<UnitCategory, List<String>> unitLists = {
    UnitCategory.length: [
      'Meter',
      'Kilometer',
      'Centimeter',
      'Millimeter',
      'Mile',
      'Foot',
      'Inch'
    ],
    UnitCategory.weight: [
      'Gram',
      'Kilogram',
      'Milligram',
      'Pound',
      'Ounce'
    ],
    UnitCategory.temperature: [
      'Celsius',
      'Fahrenheit',
      'Kelvin'
    ],
  };

  static double convert(
      double value, String fromUnit, String toUnit, UnitCategory category) {
    if (fromUnit == toUnit) return value;

    switch (category) {
      case UnitCategory.length:
        return _convertLength(value, fromUnit, toUnit);
      case UnitCategory.weight:
        return _convertWeight(value, fromUnit, toUnit);
      case UnitCategory.temperature:
        return _convertTemperature(value, fromUnit, toUnit);
    }
  }

  static double _convertLength(double value, String from, String to) {
    // Convert to Meter (base)
    double valueInMeters;
    switch (from) {
      case 'Kilometer':
        valueInMeters = value * 1000;
        break;
      case 'Centimeter':
        valueInMeters = value / 100;
        break;
      case 'Millimeter':
        valueInMeters = value / 1000;
        break;
      case 'Mile':
        valueInMeters = value * 1609.34;
        break;
      case 'Foot':
        valueInMeters = value * 0.3048;
        break;
      case 'Inch':
        valueInMeters = value * 0.0254;
        break;
      case 'Meter':
      default:
        valueInMeters = value;
    }

    // Convert from Meter to target unit
    switch (to) {
      case 'Kilometer':
        return valueInMeters / 1000;
      case 'Centimeter':
        return valueInMeters * 100;
      case 'Millimeter':
        return valueInMeters * 1000;
      case 'Mile':
        return valueInMeters / 1609.34;
      case 'Foot':
        return valueInMeters / 0.3048;
      case 'Inch':
        return valueInMeters / 0.0254;
      case 'Meter':
      default:
        return valueInMeters;
    }
  }

  static double _convertWeight(double value, String from, String to) {
    // Convert to Gram (base)
    double valueInGrams;
    switch (from) {
      case 'Kilogram':
        valueInGrams = value * 1000;
        break;
      case 'Milligram':
        valueInGrams = value / 1000;
        break;
      case 'Pound':
        valueInGrams = value * 453.592;
        break;
      case 'Ounce':
        valueInGrams = value * 28.3495;
        break;
      case 'Gram':
      default:
        valueInGrams = value;
    }

    // Convert from Gram to target unit
    switch (to) {
      case 'Kilogram':
        return valueInGrams / 1000;
      case 'Milligram':
        return valueInGrams * 1000;
      case 'Pound':
        return valueInGrams / 453.592;
      case 'Ounce':
        return valueInGrams / 28.3495;
      case 'Gram':
      default:
        return valueInGrams;
    }
  }

  static double _convertTemperature(double value, String from, String to) {
    // Convert to Celsius (base)
    double valueInCelsius;
    switch (from) {
      case 'Fahrenheit':
        valueInCelsius = (value - 32) * 5 / 9;
        break;
      case 'Kelvin':
        valueInCelsius = value - 273.15;
        break;
      case 'Celsius':
      default:
        valueInCelsius = value;
    }

    // Convert from Celsius to target unit
    switch (to) {
      case 'Fahrenheit':
        return (valueInCelsius * 9 / 5) + 32;
      case 'Kelvin':
        return valueInCelsius + 273.15;
      case 'Celsius':
      default:
        return valueInCelsius;
    }
  }
}
