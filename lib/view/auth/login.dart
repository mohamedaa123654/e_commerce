import 'package:e_commerce/core/model_view/auth_view_model.dart';
import 'package:e_commerce/core/services/firestore_user.dart';
import 'package:e_commerce/models/user_model.dart';
import 'package:e_commerce/view/auth/register.dart';
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

import '../screens/control_view.dart';

class LoginScreen extends GetWidget<AuthViewModel> {
//   LoginScreen({Key? key}) : super(key: key);

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {

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
                        text: 'Welcome,',
                        fontSize: 30,
                      ),
                      CustomTextButton(
                        text: 'Sign Up,',
                        fontSize: 18,
                        color: const Color(0xff00C569),
                        onTap: () {
                          Get.to(RegisterScreen());
                        },
                      )
                    ],
                  ),
                  CustomText(
                    text: 'Sign in to Continue',
                    fontSize: 14,
                    color: const Color(0xff929292),
                  ),
                  SizedBox(
                    height: 30,
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
                    onTap: () {},
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CustomButton(
                    text: 'login',
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        // isLoading = true;
                        // setState(() {});
                        if (_formKey.currentState!.validate()) {
                          // signInWithEmailAndPassword();
                          controller.signInWithEmailAndPassword();
                        }
                        // isLoading = false;
                        // setState(() {});
                      }

                      // _formKey.currentState!.save();

                      // if (_formKey.currentState!.validate()) {
                      //   controller.signInWithEmailAndPassword();
                      // }
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  CustomText(
                    text: '-OR-',
                    fontSize: 18,
                    alignment: Alignment.center,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: SignInButton(
                      Buttons.Google,
                      text: "Sign in with Google",
                      onPressed: () async {
                        // googleSignInMethod();
                        controller.signInWithGoogle();
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: SignInButton(
                      Buttons.Facebook,
                      text: "Sign in with FaceBook",
                      onPressed: () {},
                    ),
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
