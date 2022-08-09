import 'CalculatorBrain.dart';
import 'package:bmi_calculator/ConstantsFile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'Container.dart';
import 'IconAndText.dart';
import 'package:bmi_calculator/ResultScreen.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.male;
  int sliderPosition = 180;
  int sliderWeight = 60;
  int sliderAge = 20;
  // Color maleColor = deActiveColor;
  // Color femaleColor = deActiveColor;
  // void updateColor(Gender type) {
  //   if (type == Gender.male) {
  //     maleColor = activeColor;
  //     femaleColor = deActiveColor;
  //   } else if (type == Gender.female) {
  //     femaleColor = activeColor;
  //     maleColor = deActiveColor;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(children: <Widget>[
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                // child: GestureDetector(
                //   onTap: () {
                //     setState(() {
                //       selectedGender = Gender.male;
                //       // updateColor(Gender.male);
                //     });
                //   },
                child: RepeatContainerCode(
                  onPressed: () {
                    setState(() {
                      selectedGender = Gender.male;
                      // updateColor(Gender.male);
                    });
                  },
                  colors: selectedGender == Gender.male
                      ? activeColor
                      : deActiveColor,
                  cardWidget: IconAndTextWidget(
                    iconData: FontAwesomeIcons.male,
                    label: 'Male',
                  ),
                ),
                // ),
              ),
              Expanded(
                // child: GestureDetector(
                //   onTap: () {
                //     setState(() {
                //       selectedGender = Gender.female;
                //       // updateColor(Gender.female);
                //     });
                //   },
                child: RepeatContainerCode(
                  onPressed: () {
                    setState(() {
                      selectedGender = Gender.female;
                      // updateColor(Gender.male);
                    });
                  },
                  colors: selectedGender == Gender.female
                      ? activeColor
                      : deActiveColor,
                  cardWidget: IconAndTextWidget(
                    iconData: FontAwesomeIcons.female,
                    label: 'Female',
                  ),
                ),
                // ),
              ),
            ],
          ),
        ),
        Expanded(
          child: RepeatContainerCode(
            onPressed: () {
              setState(() {});
            },
            colors: Color.fromARGB(255, 83, 79, 79),
            cardWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Height',
                  style: kLabelStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      sliderPosition.toString(),
                      style: kSliderWidgetTextStyle,
                    ),
                    Text(
                      'cm',
                      style: kLabelStyle,
                    ),
                  ],
                ),
                Slider(
                  value: sliderPosition.toDouble(),
                  min: 120.0,
                  max: 220.0,
                  activeColor: Color(0xFFEB1555),
                  inactiveColor: Color(0xFF8D8E98),
                  onChanged: (double value) {
                    setState(() {
                      sliderPosition = value.round();
                    });
                  },
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                child: RepeatContainerCode(
                  onPressed: () {
                    setState(() {});
                  },
                  colors: Color.fromARGB(255, 83, 79, 79),
                  cardWidget: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'Weight',
                        style: kLabelStyle,
                      ),
                      Text(
                        sliderWeight.toString(),
                        style: kSliderWidgetTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIcon(
                            icon: FontAwesomeIcons.minus,
                            onPressed: (() {
                              setState(
                                () {
                                  sliderWeight--;
                                },
                              );
                            }),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          RoundIcon(
                            icon: FontAwesomeIcons.plus,
                            onPressed: (() {
                              setState(
                                () {
                                  sliderWeight++;
                                },
                              );
                            }),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: RepeatContainerCode(
                  onPressed: () {
                    setState(() {});
                  },
                  colors: Color.fromARGB(255, 83, 79, 79),
                  cardWidget: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'Age',
                        style: kLabelStyle,
                      ),
                      Text(
                        sliderAge.toString(),
                        style: kSliderWidgetTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIcon(
                            icon: FontAwesomeIcons.minus,
                            onPressed: (() {
                              setState(
                                () {
                                  sliderAge--;
                                },
                              );
                            }),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          RoundIcon(
                            icon: FontAwesomeIcons.plus,
                            onPressed: (() {
                              setState(
                                () {
                                  sliderAge++;
                                },
                              );
                            }),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            CalculatorBrain calc = CalculatorBrain(
              height: sliderPosition,
              weight: sliderWeight,
            );
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ResultScreen(
                  bmiResult: calc.calculateBMI(),
                  resultText: calc.getResult(),
                  interpretation: calc.getInterpretation(),
                ),
              ),
            );
          },
          child: Container(
            child: Center(
              child: Text(
                'Calculate',
                style: kLargeButtonTextStyle,
              ),
            ),
            color: Color(0xFFEB1555),
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: 40.0,
          ),
        ),
      ]),
    );
  }
}

class RoundIcon extends StatelessWidget {
  RoundIcon({
    required this.icon,
    required this.onPressed,
  });
  final IconData icon;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      elevation: 6.0,
      constraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
