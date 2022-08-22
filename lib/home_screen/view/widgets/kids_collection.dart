import 'package:flutter/material.dart';
import 'package:food_delivery/home_screen/model/home_model.dart';

import '../../../core/color/colors.dart';
import '../../../core/styles/fonts.dart';

class KidsCollection extends StatelessWidget {
  final ProductModel kidsDatas;
  const KidsCollection({
    Key? key,
    required this.kidsDatas,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
            height: 250,
            width: 180,
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Image.network(kidsDatas.productImage, height: 120),
                ),
                height,
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          kidsDatas.productName,
                          style: gFontsSans(fw: FontWeight.bold),
                        ),
                        Text(
                          kidsDatas.brandName,
                          style: const TextStyle(color: greyColor),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 40,
                              width: 80,
                              decoration: BoxDecoration(
                                  border: Border.all(color: greyColor),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: const [
                                  Text("size"),
                                  Icon(Icons.arrow_drop_down),
                                ],
                              ),
                            ),
                            width,
                            // Container(
                            //   height: 40,
                            //   width: 80,
                            //   decoration: BoxDecoration(
                            //     // color: Colors.red,
                            //     border: Border.all(color: greyColor),
                            //     borderRadius: BorderRadius.circular(10),
                            //   ),
                            //   child: Row(
                            //     children: [
                            //       Expanded(
                            //         child: IconButton(
                            //           onPressed: () {},
                            //           icon: const Icon(
                            //             Icons.add,
                            //             color: primaryColor,
                            //           ),
                            //         ),
                            //       ),
                            //       const Text("0"),
                            //       Expanded(
                            //         child: IconButton(
                            //           onPressed: () {},
                            //           icon: const Icon(
                            //             Icons.remove,
                            //             color: red,
                            //           ),
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                          ],
                        ),
                        // ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
