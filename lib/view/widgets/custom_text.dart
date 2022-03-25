import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  String text;
  Color color;
  double fontSize;
  AlignmentGeometry? alignment;
  FontWeight? fontWeight;
  double height;
  CustomText(
      {Key? key,
      required this.text,
      this.color = Colors.black,
      this.fontSize = 16,
      this.fontWeight,
      this.alignment = Alignment.topLeft,
      this.height = 1})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(
        text,
        style: TextStyle(
          height: height,
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
