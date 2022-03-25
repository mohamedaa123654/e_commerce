import 'package:flutter/material.dart';

class CustomTextFormFeild extends StatelessWidget {
  CustomTextFormFeild(
      {Key? key,
      this.label,
      this.obscureText = false,
      this.type = TextInputType.text,
      this.controller,
      this.onChange,
      this.validate,
      this.suffix,
      this.prefix})
      : super(key: key);
  String? label;
  // String hint;
  bool obscureText;
  TextEditingController? controller;
  TextInputType type;
  // Function? onSubmit,
  Function? onChange;
  // Function? onTap,
  // bool isPassword = false,
  Function? validate;
  // String label;
  IconData? prefix;
  IconData? suffix;
  // Function? suffixPressed,
  // bool isClickable = true,
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: obscureText,
      // enabled: isClickable,
      // onFieldSubmitted:(s){onSubmit!(s);} ,
      onChanged: (s) {
        onChange!(s);
      },
      // onTap:(){onTap!();} ,
      validator: (s) {
        validate!(s);
      },
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: () {
                  // suffixPressed!();
                },
                icon: Icon(
                  suffix,
                ),
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(60),
        ),
      ),
    );
  }
}
