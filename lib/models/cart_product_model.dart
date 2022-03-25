import 'package:e_commerce/helper/extenstion.dart';
import 'package:flutter/cupertino.dart';

class CartProductModel {
  String? productId, name, image, price;
  int? quantity;

  CartProductModel(
      {this.productId, this.name, this.image, this.quantity, this.price});

  CartProductModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }

    name = map['name'];
    image = map['image'];
    quantity = map['quantity'];
    productId = map['productId'];
    price = map['price'];
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'quantity': quantity,
      'productId': productId,
      'price': price,
    };
  }
}
