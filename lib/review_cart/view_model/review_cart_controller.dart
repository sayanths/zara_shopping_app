import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
        .doc()
        .set({
      "cartName": cartName,
      "cartmage": cartmage,
      "cartPrice": cartPrice,
      "cartBrandName": cartBrandName,
      // "cartQuantity":cartQuantity,
    });

    notifyListeners();
  }
}
