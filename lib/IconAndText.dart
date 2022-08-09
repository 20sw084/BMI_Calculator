import 'package:bmi_calculator/ConstantsFile.dart';
import 'package:flutter/material.dart';

class IconAndTextWidget extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  IconAndTextWidget({required this.iconData, required this.label});
  final IconData iconData;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            iconData,
            size: 80.0,
          ),
          SizedBox(
            height: 15.0,
          ),
          Text(
            label,
            style: kLabelStyle,
          ),
        ]);
  }
}
