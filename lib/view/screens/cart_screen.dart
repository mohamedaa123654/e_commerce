import 'package:e_commerce/core/model_view/cart_view_model.dart';
import 'package:e_commerce/core/model_view/home_view_model.dart';
import 'package:e_commerce/view/widgets/cart_screen_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constance.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_text_button.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartViewModel>(
      // init: Get.find(),
      init: CartViewModel(),
      builder: (controller) => Scaffold(
        body:
            // Center(child: Text('Cart')),
            Column(
          children: [
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: controller.cartProductModel.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: Row(
                      children: [
                        Image.network(
                          controller.cartProductModel[index].image.toString(),
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
                                text: controller.cartProductModel[index].name
                                    .toString(),
                                fontSize: 16,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              CustomText(
                                text:
                                    '\$${controller.cartProductModel[index].price.toString()}',
                                fontSize: 16,
                                color: primaryColor,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                height: 30,
                                width: 95,
                                child: Container(
                                  color: Colors.grey,
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          height: 20,
                                          width: 30,
                                          child: Center(
                                            child: CustomTextButton(
                                              text: '+',
                                              onTap: () {
                                                controller
                                                    .increaseQuantity(index);
                                              },
                                              // () {
                                              //   controller.increaseQuantity(quantity);
                                              // }
                                            ),
                                          ),
                                        ),
                                        CustomTextButton(
                                            text:
                                                '${controller.cartProductModel[index].quantity}'),
                                        SizedBox(
                                          height: 20,
                                          width: 30,
                                          child: Center(
                                            child: CustomTextButton(
                                                text: '-',
                                                onTap: () {
                                                  controller
                                                      .decreaseQuantity(index);
                                                }
                                                // () {
                                                //   controller.decreaseQuantity(quantity);
                                                // }
                                                ),
                                          ),
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
                ),
                // CartScreenItem(
                //   image: controller.cartProductModel[index].image.toString(),
                //   name: controller.cartProductModel[index].name.toString(),
                //   price: controller.cartProductModel[index].price.toString(),
                //   increase: controller.increaseQuantity(index),
                //   decrease: controller.decreaseQuantity(index),
                //   quantity: controller.cartProductModel[index].quantity!,
                // ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      CustomText(
                        text: "Total ",
                        fontSize: 22,
                        color: Colors.grey,
                      ),
                      GetBuilder<CartViewModel>(
                        // init: Get.find(),
                        builder: (controller) => CustomText(
                          text: '\$${controller.totalPrice}',
                          color: primaryColor,
                          fontSize: 18,
                        ),
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    width: 140,
                    height: 70,
                    child: CustomButton(
                      onPressed: () {},
                      text: 'CHECKOUT',
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
