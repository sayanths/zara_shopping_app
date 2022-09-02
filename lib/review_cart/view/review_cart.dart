import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/core/color/colors.dart';
import 'package:food_delivery/core/styles/fonts.dart';
import 'package:food_delivery/over_view/view/payment.dart';
import 'package:food_delivery/routes/routes.dart';
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
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('userProfile')
            .doc(FirebaseAuth.instance.currentUser?.email)
            .collection('cart')
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    final reviewData = snapshot.data!.docs[index];
                    return ReviewCartList(reviewCartData: reviewData);
                  })
              : const Center(
                  child: CupertinoActivityIndicator(),
                );
        },
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
              color: const Color.fromARGB(255, 183, 0, 61),
              onPressed: () {
                Routes.push(screen: const PaymentPage());
              },
              child: Text(
                "Submit",
                style: gFontsSans(cl: whiteColor, fw: FontWeight.w500),
              )),
        ),
      ),
    );
  }
}
