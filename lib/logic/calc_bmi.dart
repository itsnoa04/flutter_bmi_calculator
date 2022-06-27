import 'dart:math';

import 'package:bmi_calculator/constants/colors.dart';
import 'package:flutter/material.dart';

class BmiLogic {
  final int heightInCm;
  final int weight;
  BmiLogic({required this.heightInCm, required this.weight});

  var _bmi = 0.0;

  String calcBMI() {
    final height = heightInCm / 100;
    _bmi = (weight / pow(height, 2));
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25.0) {
      return "overweight".toUpperCase();
    } else if (_bmi > 18.5) {
      return "normal".toUpperCase();
    } else {
      return "underweight".toUpperCase();
    }
  }

  Color getColor() {
    if (_bmi >= 25.0) {
      return kBadHexColor;
    } else if (_bmi > 18.5) {
      return kGoodHexColor;
    } else {
      return kOkHexColor;
    }
  }
}


// String getResult() {
//   if 
// }
