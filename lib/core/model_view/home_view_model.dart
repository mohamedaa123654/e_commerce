import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/core/services/home_services.dart';
import 'package:e_commerce/models/category_model.dart';
import 'package:e_commerce/models/product_model.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);

  List<CategoryModel> get categoryModel => _categoryModel;
  List<CategoryModel> _categoryModel = [];

  List<ProductModel> get productsModel => _productsModel;
  List<ProductModel> _productsModel = [];
  // final CollectionReference _categoryCollectionRef =
  //     FirebaseFirestore.instance.collection('Categories');
  HomeViewModel() {
    getCategory();
    getProducts();
  }
  getCategory() async {
    _loading.value = true;
    HomeServices().getCategory().then((value) {
      // print(value.docs[0].data());
      for (int i = 0; i < value.length; i++) {
        _categoryModel.add(
            CategoryModel.fromJson(value[i].data() as Map<dynamic, dynamic>));
        _loading.value = false;
      }
      // print(
      //     'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX  home view ${categoryModel.length}');
      update();
    });
  }

  getProducts() async {
    _loading.value = true;
    HomeServices().getProducts().then((value) {
      // print(value.docs[0].data());
      for (int i = 0; i < value.length; i++) {
        _productsModel.add(
            ProductModel.fromJson(value[i].data() as Map<dynamic, dynamic>));
        _loading.value = false;
      }
      print(
          'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX  home view P ${productsModel.length}');
      update();
    });
  }
}
