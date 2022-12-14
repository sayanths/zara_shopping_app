import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/core/color/colors.dart';

class ReviewCartController extends ChangeNotifier {
  void addReviewCartData({
    required String cartName,
    required String cartmage,
    required int cartPrice,
    required String cartBrandName,
    // required int cartQuantity,
  }) async {
    FirebaseFirestore.instance
        .collection("userProfile")
        .doc(FirebaseAuth.instance.currentUser?.email)
        .collection("cart")
        .doc(cartName)
        .set(
      {
        "cartName": cartName,
        "cartmage": cartmage,
        "cartPrice": cartPrice,
        "cartBrandName": cartBrandName,
        // "cartQuantity":cartQuantity,
      },
    );

    notifyListeners();
  }

  deleteCartItem(String name) {
    FirebaseFirestore.instance
        .collection("userProfile")
        .doc(FirebaseAuth.instance.currentUser?.email)
        .collection("cart")
        .doc(name)
        .delete();
  }

  snackbarFunction(context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      duration: Duration(seconds: 2),
      dismissDirection: DismissDirection.up,
      backgroundColor: red,
      content: Text('Added to cart Sucessfully '),
    ));
    notifyListeners();
  }
}
