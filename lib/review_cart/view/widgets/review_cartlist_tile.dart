import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/core/color/colors.dart';
import 'package:food_delivery/core/styles/fonts.dart';

class ReviewCartList extends StatelessWidget {
 final QueryDocumentSnapshot<Object?> reviewCartData;
   ReviewCartList({
    Key? key, required this.reviewCartData,
  }) : super(key: key);

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
                        Image.network(
                          reviewCartData['cartImage'],
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
                        Container(
                          height: 10,
                          width: 40,
                          decoration: BoxDecoration(
                            color: red,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Text.rich(
                          TextSpan(
                            text: 'This item costs\n\n',
                            children: <TextSpan>[
                              const TextSpan(
                                text: '\$1500.99 ',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                              TextSpan(
                                text: ' \$500.00',
                                style: gFontsSans(fw: FontWeight.w600, sz: 20),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.delete,
                          color: red,
                        ),
                      ),
                    )
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
