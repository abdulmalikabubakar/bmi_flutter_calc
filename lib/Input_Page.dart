import 'package:flutter/material.dart';
import 'package:bmi_calculator/cardContent.dart';
import 'package:bmi_calculator/Reusable_Card.dart';
import 'package:bmi_calculator/result_page.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/calculator_brain.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

Color maleCardColor;
Color femaleCardColor;

enum Gender { male, female }

int height = 180;
int age = 10;
int weight = 120;

Gender selectedGender;

void updateColor(Gender selectedGender) {
  //selectedGender == Gender.male? maleCardColor = activeColor : femaleCardColor = activeColor;
  if (selectedGender == Gender.male) {
    maleCardColor = activeColor;
    femaleCardColor = inactiveColor;
  } else {
    femaleCardColor = activeColor;
    maleCardColor = inactiveColor;
  }

  if (selectedGender == Gender.female) {
    femaleCardColor = activeColor;
    maleCardColor = inactiveColor;
  } else {
    maleCardColor = activeColor;
    femaleCardColor = inactiveColor;
  }
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? activeColor
                        : inactiveColor,
                    contChild:
                        cardContent(icon_name: Icons.clear, icon_text: 'Male'),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? activeColor
                        : inactiveColor,
                    contChild:
                        cardContent(icon_name: Icons.mail, icon_text: 'Female'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: activeColor,
                    contChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'HEIGHT',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              height.toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 50.0,
                              ),
                            ),
                            Text(
                              'cm',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            thumbColor: Color(0xFFEB1155),
                            activeTrackColor: Colors.white,
                            inactiveTrackColor: Colors.grey,
                            overlayColor: Color(0x29EB1555),
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 15.0),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 25.0),
                          ),
                          child: Slider(
                            value: height.toDouble(),
                            min: 120.0,
                            max: 220.0,
                            onChanged: (double newVal) {
                              setState(() {
                                height = newVal.round();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: activeColor,
                    contChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kTextStyle.copyWith(
                            fontSize: 50.0,
                            color: Colors.white,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: Icons.exposure_minus_2,
                              onPress: () {
                                setState(() {
                                  if (weight >= 70) {
                                    weight -= 2;
                                  } else {
                                    weight = 70;
                                  }
                                });
                              },
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            RoundIconButton(
                              icon: Icons.add,
                              onPress: () {
                                setState(() {
                                  if (weight < 200) {
                                    weight += 1;
                                  } else {
                                    weight = 199;
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                      colour: activeColor,
                      contChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style: kTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kTextStyle.copyWith(
                              fontSize: 50.0,
                              color: Colors.white,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: Icons.exposure_minus_2,
                                onPress: () {
                                  setState(() {
                                    if (age > 0) {
                                      age -= 1;
                                    } else {
                                      age = 1;
                                    }
                                  });
                                },
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              RoundIconButton(
                                icon: Icons.add,
                                onPress: () {
                                  setState(() {
                                    if (age <= 190) {
                                      age += 1;
                                    } else {
                                      age = 190;
                                    }
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              //this block calculates the bmi
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);
              calc.BMICalculate();

              //this codes (either of them)helps navigate to the next code
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultPage(
                            result: calc.getResult(),
                            weight: calc.getWeight(),
                            interpretation: calc.getInterpretation(),
                          )));
              //Navigator.pushNamed(context, 'result_page');
            },
            child: Container(
              child: Center(child: Text('CALCULATE', style: kTextStyle)),
              padding: EdgeInsets.only(bottom: 13.0),
              margin: EdgeInsets.only(top: 10.0),
              color: bottomContainerColor,
              height: bottomContainerHeight,
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon, @required this.onPress});

  final IconData icon;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPress,
      shape: CircleBorder(),
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        height: 56.0,
        width: 56.0,
      ),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
