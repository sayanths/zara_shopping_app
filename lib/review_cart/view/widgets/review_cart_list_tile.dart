import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_delivery/core/color/colors.dart';
import 'package:food_delivery/core/styles/fonts.dart';

class ReviewCartList extends StatelessWidget {
  const ReviewCartList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Card(
          child: Container(
            height: size.height / 5,
            width: size.width,
            color: whiteColor,
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          "assets/images/women_pic.png",
                          height: 100,
                        ),
                        height,
                        Container(
                          height: 35,
                          width: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: greyColor)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "qty:1",
                                style: gFontsSans(ls: 1, fw: FontWeight.w500),
                              ),
                              const Icon(Icons.arrow_drop_down),
                              
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: size.width / 6,
                    ),
                    Column(
                      children: [
                        Text(
                          "Jolly Doll",
                          style: gFontsSans(fw: FontWeight.w700),
                        ),
                        Text(
                          "American Brand",
                          style: gFontsSans(cl: greyColor),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// Column(
//                     children: [
//                       Expanded(
//                           child: Image.asset(
//                         "assets/images/women_pic.png",
//                         height: 90,
//                       )),
//                       height,
//                       Expanded(
//                         child: Container(
//                           color: Colors.red,
//                           height: 30,
//                           width: 60,
//                         ),
//                       ),
//                     ],
//                   ),