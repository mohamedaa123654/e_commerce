import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  CustomTextButton(
      {Key? key,
      required this.text,
      this.onTap,
      this.color = Colors.black,
      this.fontSize = 16,
      this.alignment})
      : super(key: key);
  String text;
  Function()? onTap;
  Color color;
  double fontSize;
  AlignmentGeometry? alignment;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
        ),
      ),
      onTap: onTap,
    );
  }
}
