import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  final String text;
  final double textSize;
  final FontWeight fontWeight;
  final Color color;
  final String fontFamily;

  const CustomTextWidget(
      {Key? key,
      required this.text,
      this.textSize = 14.0,
      this.fontWeight = FontWeight.normal,
      this.color = Colors.black,
      this.fontFamily = 'Poppins'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: textSize,
        fontWeight: fontWeight,
        color: color,
        fontFamily: fontFamily,
      ),
    );
  }
}
