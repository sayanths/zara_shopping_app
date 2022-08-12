import 'package:flutter/material.dart';
import 'package:food_delivery/core/color/colors.dart';
import 'package:food_delivery/core/styles/fonts.dart';
import 'widgets/review_cartlist_tile.dart';

class ReviewCart extends StatelessWidget {
  const ReviewCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 222, 221, 221),
      appBar: AppBar(
        backgroundColor: blackColor,
        title: const Text("Review Cart"),
      ),
      body: ListView(
        children: const [
          ReviewCartList(),
        ],
      ),
      bottomNavigationBar: ListTile(
        title: Text(
          "Total Amount",
          style: gFontsSans(sz: 19, fw: FontWeight.w600),
        ),
        subtitle: Text(
          "\$500.00",
          style: gFontsSans(cl: green, ls: 1, sz: 17),
        ),
        trailing: SizedBox(
          width: 160,
          child: MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: red,
              onPressed: () {},
              child: Text(
                "Submit",
                style: gFontsSans(cl: whiteColor, fw: FontWeight.w500),
              )),
        ),
      ),
    );
  }
}
