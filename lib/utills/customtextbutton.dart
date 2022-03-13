import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextButton extends StatelessWidget {
  String buttonName;
  Color buttoncolor;
  double width;
  double height;
  final VoidCallback onPressed;
  TextStyle textStyle, buttonTextStyle;

  CustomTextButton({
    required this.buttonName,
    required this.buttoncolor,
    required this.height,
    required this.width,
    required this.onPressed,
    required this.buttonTextStyle,
    required this.textStyle,
    highlightColor,
  });

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return FlatButton(
      minWidth: width - 35,
      height: height,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Text(
        buttonName,
        style: buttonTextStyle,
      ),
      color: buttoncolor,
      onPressed: onPressed,
    );
  }
}
