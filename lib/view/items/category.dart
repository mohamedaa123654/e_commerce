import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  Category(
      {Key? key,
      required this.icon,
      required this.onPressed,
      required this.text})
      : super(key: key);
  IconData? icon;
  void Function()? onPressed;
  String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          icon: Icon(icon),
          onPressed: onPressed,
        ),
        CustomText(text: text),
      ],
    );
  }
}
