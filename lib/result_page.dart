import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/Reusable_Card.dart';
import 'package:bmi_calculator/calculator_brain.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {@required this.result,
      @required this.weight,
      @required this.interpretation});

  //these are the passed in parameters for height, weight and interpretation which is necessarily required to run the page
  final String result;
  final String weight;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Text(
            'Your Result!',
            style: kTextStyle.copyWith(
              fontSize: 50.0,
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: activeColor,
              contChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    result,
                    style: kTextStyle2,
                  ),
                  Text(
                    weight,
                    style: kTextStyle.copyWith(
                      fontSize: 70.0,
                    ),
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: kTextStyle.copyWith(
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
