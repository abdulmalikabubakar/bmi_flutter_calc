import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class cardContent extends StatelessWidget {
  cardContent({@required this.icon_name, @required this.icon_text});

  final IconData icon_name;
  final String icon_text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon_name,
          size: 25.0,
          color: Colors.white,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          icon_text,
          style: kTextStyle,
        )
      ],
    );
  }
}
