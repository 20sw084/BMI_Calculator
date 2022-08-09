import 'package:flutter/material.dart';

class RepeatContainerCode extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const RepeatContainerCode(
      {required this.colors,
      required this.cardWidget,
      required this.onPressed});
  final Color colors;
  final Widget cardWidget;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.all(15.0),
        child: cardWidget,
        decoration: BoxDecoration(
          color: colors,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
