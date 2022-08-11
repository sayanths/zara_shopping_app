import 'package:flutter/material.dart';

import 'package:food_delivery/core/color/colors.dart';
import 'package:food_delivery/over_view/view/widgets/widgets.dart';

class ProductOverView extends StatelessWidget {
  const ProductOverView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: whiteColor,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back,
            color: blackColor,
          ),
        ),
        actions: [
          Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.share,
                    color: blackColor,
                  )),
            ],
          ),
        ],
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: size.width / 2,
                  ),
                  Container(
                    height: size.height,
                    width: size.width,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 220, 215, 214),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(130),
                            topRight: Radius.circular(1))),
                            child: Column(
                              children: [
                                Row(
                                   children: [
                                    Text("data")
                                   ],
                                ),
                              ],
                            ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: size.height / 2,
                    width: size.width / 1.1,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/women_pic.png"),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Row(
        children: const [
          CustomBottomNavBar(
            iconColor: whiteColor,
            backgroundColor: blackColor,
            color: whiteColor,
            title: "Add to watch lsit",
            iconData: Icons.favorite,
          ),
          CustomBottomNavBar(
            iconColor: blackColor,
            backgroundColor: greyColor,
            color: blackColor,
            title: "Buy Now",
            iconData: Icons.shopping_bag,
          ),
        ],
      ),
    );
  }
}
