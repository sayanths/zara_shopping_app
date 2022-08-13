import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:food_delivery/core/color/colors.dart';
import 'package:food_delivery/core/styles/fonts.dart';
import 'package:food_delivery/over_view/view/widgets/widgets.dart';
import 'package:food_delivery/routes/routes.dart';

class ProductOverView extends StatelessWidget {
  QueryDocumentSnapshot<Object?> lastestData;
   ProductOverView(
      {Key? key, required this.lastestData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: whiteColor,
        leading: IconButton(
          onPressed: () {
            Routes.pop();
          },
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 1),
            child: Text(
              "Jelly Doll",
              style: gFontsSans(fw: FontWeight.bold, sz: 40),
            ),
          ),
          Stack(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: size.width / 2.6,
                  ),
                  Container(
                    height: size.height / 1.5,
                    width: size.width,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 237, 234, 254),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(130),
                            topRight: Radius.circular(1))),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: size.height / 2,
                    width: size.width / 1.1,
                    decoration:  BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(lastestData['productImage']),
                      ),
                    ),
                  ),
                  Text(
                    "Available Options",
                    style: gFontsSans(fw: FontWeight.w500),
                  ),
                  height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      SmallMeduimSizeNotifyWidget(
                        title: 'S',
                      ),
                      SmallMeduimSizeNotifyWidget(
                        title: 'M',
                      ),
                      SmallMeduimSizeNotifyWidget(
                        title: 'L',
                      ),
                    ],
                  ),
                  height,
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$ 500",
                          style: gFontsSans(
                              sz: 30,
                              cl: const Color.fromARGB(255, 11, 88, 152)),
                        ),
                        Text(
                          "12 piece Avaliable",
                          style: gFontsSans(
                              sz: 18,
                              cl: const Color.fromARGB(255, 254, 13, 13)),
                        ),
                      ],
                    ),
                  ),
                  height,
                  Text(
                    "Description",
                    style: gFontsSans(cl: greyColor),
                  ),
                  height,
                  const Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printe It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
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
