// import 'package:e_commerce/core/model_view/home_view_model.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// Widget bottomNavigationBar() {
//   return GetBuilder<HomeViewModel>(
//     init: HomeViewModel(),
//     builder: (controller) => BottomNavigationBar(
//       items: [
//         BottomNavigationBarItem(
//             activeIcon: Padding(
//               padding: const EdgeInsets.only(top: 25),
//               child: Text('Explore'),
//             ),
//             icon: Image.asset('assets/images/Icon_Explore.png')),
//         BottomNavigationBarItem(
//             activeIcon: Padding(
//               padding: const EdgeInsets.only(top: 25),
//               child: Text('Cart'),
//             ),
//             icon: Image.asset('assets/images/Icon_Cart.png')),
//         BottomNavigationBarItem(
//             activeIcon: Padding(
//               padding: const EdgeInsets.only(top: 25),
//               child: Text('Account'),
//             ),
//             icon: Image.asset('assets/images/Icon_User.png')),
//       ],
//       currentIndex: 0,
//       onTap: (index) => controller.changeSelectedValue(index),
//     ),
//   );
// }
