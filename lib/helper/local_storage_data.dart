import 'dart:convert';

import 'package:e_commerce/models/user_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../view/constance.dart';

class LocalStorageData extends GetxController {
  Future<UserModel> get getUser async {
    // UserModel userModel = await _getUserData();
    // return userModel;
    try {
      UserModel? userModel = await _getUserData();
      if (userModel == null) {
        return UserModel(
          userId: 'null',
          email: 'null',
          name: 'null',
          pic: '',
        );
      }
      return userModel;
    } catch (e) {
      print(e.toString());
      return UserModel(
        userId: 'null',
        email: 'null',
        name: 'null',
        pic: '',
      );
    }
  }

  _getUserData() async {
    SharedPreferences? prefs = await SharedPreferences.getInstance();
    var value = prefs.getString(CACHED_USER_DATA);
    return UserModel.fromJson(json.decode(value!));
  }

  setUser(UserModel? model) async {
    SharedPreferences? prefs = await SharedPreferences.getInstance();
    await prefs.setString(CACHED_USER_DATA, json.encode(model!.toJson()));
  }

  void deleteUser() async {
    SharedPreferences? prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
