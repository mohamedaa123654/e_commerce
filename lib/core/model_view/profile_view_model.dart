import 'dart:developer';

import 'package:e_commerce/helper/local_storage_data.dart';
import 'package:e_commerce/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfileViewModel extends GetxController {
  final LocalStorageData? localStorageData = Get.put(LocalStorageData());
  UserModel? get userModel => _userModel;
  UserModel? _userModel;

  @override
  void onInit() {
    super.onInit();
    getCurrentUser();
  }

  Future<void> signOut() async {
    GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
    localStorageData?.deleteUser();
  }

  void getCurrentUser() async {
    await localStorageData?.getUser.then((value) {
      if (value == null) {
        _userModel = UserModel(
          userId: 'xxxx',
          email: 'xxxxx',
          name: 'xx@xx.xx',
          pic: 'empity',
        );
      } else
        _userModel = value;
      print(value);
    });
  }
}
