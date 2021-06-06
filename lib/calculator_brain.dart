import 'package:flutter/material.dart';
import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({@required this.height, @required this.weight});

  final int height;
  final int weight;
  double _bmi;

  String BMICalculate() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  //the getter functions to return height and weight
  String getHeight() => height.toString();

  String getWeight() => weight.toString();

  String getResult() {
    print('BMI is: $_bmi');
    if (_bmi >= 25) {
      return 'OVERWEIGHT';
    } else if (_bmi > 18.5) {
      return 'NORMAL';
    } else {
      return 'UNDERWEIGHT';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have a higher than normal please try to exercise more.';
    } else if (_bmi > 18.5) {
      return 'You have a normal, bravo! keep it up.';
    } else {
      return 'You have a lower than normal, damn! please eat more and nutritiosly. Thakyou';
    }
  }
}
