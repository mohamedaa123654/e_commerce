import 'package:e_commerce/core/model_view/auth_view_model.dart';
import 'package:e_commerce/core/model_view/profile_view_model.dart';
import 'package:e_commerce/view/auth/login.dart';
import 'package:e_commerce/view/widgets/custom_button.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
      init: ProfileViewModel(),
      builder: (controller) => Scaffold(
        body: Container(
          // color: const Color(0xffd4d181),
          child: ListView(
            children: [
              DrawerHeader(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          image: DecorationImage(
                            image: NetworkImage(
                                'https://firebasestorage.googleapis.com/v0/b/e-commerce-9c780.appspot.com/o/Image2.png?alt=media&token=473a2072-c0d9-41d1-9dc9-ca1a75cc556e'),

                            // NetworkImage(
                            //     '${controller.googleAccount.value?.photoUrl ?? 'https://firebasestorage.googleapis.com/v0/b/e-commerce-9c780.appspot.com/o/Image2.png?alt=media&token=473a2072-c0d9-41d1-9dc9-ca1a75cc556e'}'),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                            text: '${controller.userModel?.name ?? 'empty'}',
                            //  '${controller.name}',
                            // '${controller.googleAccount.value?.displayName ?? 'name empty'}',
                            fontSize: 26,
                          ),
                          CustomText(
                            text: '${controller.userModel?.email ?? 'empty'}',

                            // text: 'maabdel22@gmail.com',
                            // '${controller.googleAccount.value?.email ?? 'email.empty'}',

                            fontSize: 14,
                          ),
                          // Text('Welcome to my App'),
                          // Text(
                          //   'Login',
                          //   overflow: TextOverflow.ellipsis,
                          // ),

                          // Text(userData.userName),
                          // Text(
                          //   userData.userEmail,
                          // overflow: TextOverflow.ellipsis,
                          // ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              listTile(
                iconData: Icons.home_outlined,
                title: "Home",
                onTap: () {
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (context) => HomeScreen(),
                  //   ),
                  // );
                },
              ),
              listTile(
                iconData: Icons.shop_outlined,
                title: "Review Cart",
                onTap: () {
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (context) => ReviewCart(),
                  //   ),
                  // );
                },
              ),
              listTile(
                iconData: Icons.person_outlined,
                title: "My Profile",
                onTap: () {
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (context) => MyProfile(),
                  //   ),
                  // );
                },
              ),
              listTile(
                  iconData: Icons.notifications_outlined, title: "Notificatio"),
              listTile(iconData: Icons.star_outline, title: "Rating & Review"),
              listTile(
                iconData: Icons.favorite_outline,
                title: "Wishlist",
                // onTap: () {
                //   Navigator.of(context).push(
                //     MaterialPageRoute(
                //       builder: (context) => WishLsit(),
                //     ),
                //   );
                // }
              ),
              listTile(
                  iconData: Icons.copy_outlined, title: "Raise a Complaint"),
              listTile(iconData: Icons.format_quote_outlined, title: "FAQs"),
              listTile(
                  iconData: Icons.copy_outlined,
                  title: "Log Out",
                  onTap: () {
                    controller.signOut();
                    Get.offAll(LoginScreen());
                  }),
              Container(
                height: 350,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Contact Support"),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: const [
                        Text("Call us:"),
                        SizedBox(
                          width: 10,
                        ),
                        Text("+201117196088"),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: const [
                          Text("Mail us:"),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "maabdel22@gmail.com",
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget listTile({
    required String title,
    required IconData iconData,
    VoidCallback? onTap,
  }) {
    return SizedBox(
      height: 50,
      child: ListTile(
        onTap: onTap,
        leading: Icon(
          iconData,
          size: 28,
        ),
        title: Text(
          title,
          style: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
