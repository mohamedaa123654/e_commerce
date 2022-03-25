import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  CustomCard(
      {Key? key,
      required this.name,
      required this.image,
      required this.desc,
      required this.price,
      this.onTap})
      : super(key: key);

  String image, name, desc, price;
  Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      // () {
      //   // Navigator.pushNamed(context, UpdateProductPage.id, arguments: product);
      // },
      child: Container(
        width: 180,
        height: 240,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            blurRadius: 50,
            color: Colors.grey.withOpacity(.1),
            spreadRadius: 20,
            offset: Offset(10, 10),
          ),
        ]),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.network(
                    image,
                    width: 175,
                    height: 160,
                    // fit: BoxFit.contain,
                  ),
                ),
                Text(
                  name,
                  // product.title.substring(0, 6),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      desc,
                      // r'$' '${product.price.toString()}',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 10,
                      ),
                    ),
                    // Icon(
                    //   Icons.star,
                    //   color: Color.fromARGB(255, 244, 114, 54),
                    //   size: 18,
                    // ),
                    Text(
                      price,
                      // product.title.substring(0, 6),
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 10,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
