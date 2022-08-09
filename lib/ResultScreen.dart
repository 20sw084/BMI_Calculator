import 'package:bmi_calculator/Container.dart';
import 'package:bmi_calculator/InputPage.dart';
import 'package:flutter/material.dart';

import 'ConstantsFile.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen(
      {required this.bmiResult,
      required this.resultText,
      required this.interpretation});
  final String bmiResult;
  final String resultText;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Result'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Center(
              child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: const Text(
                  'Your Result',
                  style: kResultScreenStyle1,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: RepeatContainerCode(
              colors: activeColor,
              cardWidget: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    resultText.toUpperCase(),
                    style: kResultScreenStyle2,
                  ),
                  Text(
                    bmiResult,
                    style: kResultScreenStyle1,
                  ),
                  Text(
                    interpretation,
                    style: kResultScreenStyle3,
                  ),
                ],
              ),
              onPressed: () {},
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => InputPage(
                          title: 'BMI Calculator',
                        )),
              );
            },
            child: Container(
              child: Center(
                child: Text(
                  'Re-Calculate',
                  style: kLargeButtonTextStyle,
                ),
              ),
              color: Color(0xFFEB1555),
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: 40.0,
            ),
          ),
        ],
      ),
    );
  }
}
