import 'package:e_commerce/view/screens/cart_screen.dart';
import 'package:e_commerce/view/screens/home_screen.dart';
import 'package:e_commerce/view/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControlViewModel extends GetxController {
  int _navigatorValue = 0;

  get navigatorValue => _navigatorValue;

  Widget currentScreen = HomeScreen();

  void changeSelectedValue(int selectedValue) {
    _navigatorValue = selectedValue;
    switch (selectedValue) {
      case 0:
        {
          // currentScreen = GetPage(
          //   name: 'Home Screen',
          //   page: () => HomeScreen(),
          // ) as Widget;
          currentScreen = HomeScreen();
          break;
        }
      case 1:
        {
          // currentScreen = GetPage(
          //   name: 'Cart Screen',
          //   page: () => CartScreen(),
          // ) as Widget;
          currentScreen = CartScreen();
          break;
        }
      case 2:
        {
          // currentScreen = GetPage(
          //   name: 'Profile Screen',
          //   page: () => ProfileScreen(),
          // ) as Widget;
          currentScreen = ProfileScreen();

          break;
        }
    }
    update();
  }
}
