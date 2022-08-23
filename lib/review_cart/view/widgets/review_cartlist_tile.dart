import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/core/color/colors.dart';
import 'package:food_delivery/core/styles/fonts.dart';
import 'package:food_delivery/review_cart/view_model/review_cart_controller.dart';
import 'package:provider/provider.dart';

class ReviewCartList extends StatelessWidget {
  final QueryDocumentSnapshot<Object?> reviewCartData;
  const ReviewCartList({
    Key? key,
    required this.reviewCartData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pov = context.read<ReviewCartController>();
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
                Expanded(
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Image.network(
                            reviewCartData['cartmage'],
                            height: 100,
                          ),
                          height,
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 6),
                            height: size.height / 25,
                            width: size.width / 5.5,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: greyColor)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Icon(Icons.add),
                                Text("0"),
                                Icon(Icons.remove),
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
                            reviewCartData['cartName'],
                            style: gFontsSans(fw: FontWeight.w700),
                          ),
                          Text(
                            reviewCartData['cartBrandName'],
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
                          onPressed: () {
                            pov.deleteCartItem(
                              reviewCartData['cartName'],
                            );
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: red,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
