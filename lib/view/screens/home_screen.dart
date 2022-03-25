import 'package:e_commerce/core/model_view/home_view_model.dart';
import 'package:e_commerce/view/auth/login.dart';
import 'package:e_commerce/view/items/category.dart';
import 'package:e_commerce/view/screens/details_view.dart';
import 'package:e_commerce/view/screens/profile_screen.dart';
import 'package:e_commerce/view/screens/cart_screen.dart';
import 'package:e_commerce/view/widgets/bottom_navigation_bar.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:e_commerce/view/widgets/custom_text_button.dart';
import 'package:e_commerce/view/widgets/custom_text_form_feild.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/model_view/control_view_model.dart';
import '../widgets/custom_card.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  FirebaseAuth _auth = FirebaseAuth.instance;
  final List<String> names = <String>[
    'men',
    's',
    's',
    's',
    's',
    's',
    's',
    's',
    's',
    's',
    's',
    's',
    's',
    's',
    's',
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: HomeViewModel(),
      builder: (controller) => controller.loading.value
          ? Center(child: CircularProgressIndicator())
          : Scaffold(
              body: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
              child: ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextFormFeild(
                      prefix: Icons.search,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CustomText(
                      text: 'Categories',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    _listViewCategory(),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: 'Best Selling',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        CustomTextButton(
                          text: 'See all',
                          fontSize: 16,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 235,
                      child: GetBuilder<HomeViewModel>(
                        builder: (controller) => ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.productsModel.length,
                            itemBuilder: (context, index) {
                              return CustomCard(
                                desc: controller
                                    .productsModel[index].description
                                    .toString(),
                                image: controller.productsModel[index].image
                                    .toString(),
                                name: controller.productsModel[index].name
                                    .toString(),
                                price:
                                    '\$${controller.productsModel[index].price}'
                                        .toString(),
                                onTap: () {
                                  Get.to(DetailsView(
                                      model: controller.productsModel[index]));
                                },
                              );
                              // CustomCart(product: products[index]);
                            }),
                      ),
                    )
                  ]),
            )),
    );
  }

  Widget _listViewCategory() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Container(
        height: 100,
        child: ListView.separated(
          itemCount: controller.categoryModel.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: ((context, index) => Column(
                children: [
                  SizedBox(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.grey.shade100,
                      ),
                      height: 60,
                      width: 60,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.network(
                            controller.categoryModel[index].image.toString()),
                        // child: Icon(Icons.man),
                        // Image.asset('/assets/images/Icon_Mens Shoe.png'),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomText(
                    text: controller.categoryModel[index].name.toString(),
                  ),
                ],
              )),
          separatorBuilder: (context, index) => SizedBox(
            width: 20,
          ),
        ),
      ),
    );
  }
}
