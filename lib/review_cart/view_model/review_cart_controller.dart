import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/cupertino.dart';

class ReviewCartController extends ChangeNotifier {
  
  void addReviewCartData({
    String? cartId,
    String? cartName,
    String? cartImage,
    String? cartPrice,
    String? cartQuantity,
  }) async {
    await FirebaseFirestore.instance
        .collection('reviewCart')
        .doc()
        .collection("cart")
        .doc(cartId)
        .set({
      "cartId": cartId,
      "cartName": cartName,
      "cartImage": cartImage,
      "cartPrice": cartPrice,
      "cartQuantity": cartQuantity,
    });

    notifyListeners();
  }
  // Future<void> already() async {
  //  try{
  //   await FirebaseFirestore.instance.collection('reviewCart').doc(FirebaseAuth.instance.currentUser!.uid).collection('cart').where('cartId',isEqualTo: );
  //  }catch(){}

  // }
}
