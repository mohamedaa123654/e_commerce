import 'package:e_commerce/core/model_view/cart_view_model.dart';
import 'package:e_commerce/view/constance.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:e_commerce/view/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreenItem extends StatelessWidget {
  CartScreenItem({
    Key? key,
    this.image,
    this.name,
    this.price,
    this.increase,
    this.decrease,
    this.quantity = 1,
  }) : super(key: key);
  String? image, name, price;
  Function()? increase;
  Function()? decrease;

  int quantity;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.2,
        child: Row(
          children: [
            Image.network(
              image!,
              fit: BoxFit.fill,
            ),
            SizedBox(
              width: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  CustomText(
                    text: name!,
                    fontSize: 16,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  CustomText(
                    text: '\$${price!}',
                    fontSize: 16,
                    color: primaryColor,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 30,
                    width: 95,
                    child: GetBuilder<CartViewModel>(
                      init: CartViewModel(),
                      builder: (controller) => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomTextButton(
                              text: '+',
                              onTap: increase,
                              // () {
                              //   controller.increaseQuantity(quantity);
                              // }
                            ),
                            CustomTextButton(text: '$quantity'),
                            CustomTextButton(text: '-', onTap: decrease
                                // () {
                                //   controller.decreaseQuantity(quantity);
                                // }
                                ),
                          ]),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
