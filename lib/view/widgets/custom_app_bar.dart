// import 'package:book_sotre/widgets/drawer_side.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar({Key? key, this.title}) : super(key: key);
  final String? title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title!),
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
            ))
      ],
    );
  }
}
