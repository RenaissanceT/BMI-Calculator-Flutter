import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({this.height, this.weight});

  final int height;

  final int weight;

  //Access to the PRIVATE property value "BMI"
  double _bmi;

  // import dart:math external file
  // power in Flutter is pow (component, number);
  // ps: height is in the cm unit

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    // convert to string, meanwhile fixed to the one decimal figure
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 30) {
      return 'Obesity';
    } else if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi >= 18.5) {
      return 'Normal weight';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 30) {
      return 'High risk of developing heart disease, high blood pressure, stroke, diabetes mellitus. Metabolic Syndrome';
    } else if (_bmi >= 25) {
      return 'Moderate risk of developing heart disease, high blood pressure, stroke, diabetes mellitus';
    } else if (_bmi >= 18.5) {
      return 'Low risk (healthy range)';
    } else {
      return 'Possible nutritional deficiency and osteoporosis';
    }
  }
}
