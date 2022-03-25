import 'package:e_commerce/core/model_view/auth_view_model.dart';
import 'package:e_commerce/view/screens/control_view.dart';

import 'package:e_commerce/view/screens/home_screen.dart';
import 'package:e_commerce/view/widgets/custom_button.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:e_commerce/view/widgets/custom_text_button.dart';
import 'package:e_commerce/view/widgets/custom_text_form_feild.dart';
import 'package:e_commerce/view/widgets/scaffold_messenger.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:e_commerce/view/auth/login.dart';

class RegisterScreen extends GetWidget<AuthViewModel> {
  RegisterScreen({Key? key}) : super(key: key);

  // bool isLoading = false;

  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthViewModel>(
      init: AuthViewModel(),
      builder: (controller) => Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 50, right: 20, left: 20),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: 'Sign Up',
                        fontSize: 30,
                      ),
                      CustomTextButton(
                        text: 'Sign In,',
                        fontSize: 18,
                        color: const Color(0xff00C569),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  CustomTextFormFeild(
                    label: 'Name',
                    prefix: Icons.person_outline,
                    type: TextInputType.text,
                    onChange: (data) {
                      controller.name = data;
                    },
                    validate: (String data) {
                      if (data.isEmpty) {
                        return 'Put Your Name';
                      }
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CustomTextFormFeild(
                    label: 'Email',
                    prefix: Icons.email_outlined,
                    type: TextInputType.emailAddress,
                    onChange: (data) {
                      controller.email = data;
                    },
                    validate: (String data) {
                      if (data.isEmpty) {
                        return 'Put Your Email';
                      }
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CustomTextFormFeild(
                    label: 'Password',
                    obscureText: true,
                    prefix: Icons.lock_outlined,
                    // controller: passwordController!,
                    type: TextInputType.text,
                    onChange: (data) {
                      controller.password = data;
                    },
                    validate: (String data) {
                      if (data.isEmpty) {
                        return 'Put Your Password';
                      }
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CustomTextButton(
                    text: 'Forgot Password?',
                    fontSize: 14,
                    alignment: Alignment.centerRight,
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => RegisterScreen(),
                      //   ),
                      // );
                      Get.to(RegisterScreen());
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CustomButton(
                    text: 'Sign up',
                    onPressed: () async {
                      // if (_formKey.currentState!.validate()) {
                      //   isLoading = true;
                      //   setState(() {});
                      //   if (_formKey.currentState!.validate()) {
                      //     await register();
                      //   }
                      //   isLoading = false;
                      //   setState(() {});
                      // }

                      // _formKey.currentState!.save();

                      if (_formKey.currentState!.validate()) {
                        controller.register();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
