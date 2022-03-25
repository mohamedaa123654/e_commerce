import 'package:e_commerce/core/model_view/auth_view_model.dart';
import 'package:e_commerce/core/model_view/cart_view_model.dart';
import 'package:get/instance_manager.dart';

import '../core/model_view/control_view_model.dart';
import '../core/model_view/home_view_model.dart';
import '../core/model_view/profile_view_model.dart';
import 'local_storage_data.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => HomeViewModel());
    Get.lazyPut(() => ControlViewModel());
    Get.lazyPut(() => CartViewModel());
    Get.lazyPut(() => LocalStorageData());
    Get.lazyPut(() => ProfileViewModel());
  }
}
