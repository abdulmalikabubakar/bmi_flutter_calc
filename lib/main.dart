import 'package:flutter/material.dart';
import 'Input_Page.dart';
import 'package:bmi_calculator/result_page.dart';
import 'package:bmi_calculator/calculator_brain.dart';


void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0D22),
        scaffoldBackgroundColor: Color(0xFF0A0D22),
      ),
      home: InputPage(),
      //initialRoute: '/',
      /*routes: {
        '/': (context) => InputPage(),
        'result_page': (context) => ResultPage(),
      },*/
    );
  }
}