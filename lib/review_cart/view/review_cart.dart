import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_delivery/core/color/colors.dart';

import 'widgets/Review_cart_list_tile.dart';

class ReviewCart extends StatelessWidget {
  const ReviewCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 222, 221, 221),
      appBar: AppBar(
        backgroundColor: blackColor,
        title: Text("Review Cart"),
      ),
      body: ListView(
        children: [
          ReviewCartList()
        ],
      ),
    );
  }
}
