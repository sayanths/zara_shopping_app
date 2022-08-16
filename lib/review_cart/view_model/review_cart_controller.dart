import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_delivery/home_screen/model/home_model.dart';
import '../model/cart_model.dart';

class ReviewCartController extends ChangeNotifier {

  
  // List<CartModel> cartModel = [];
  // late Iterable<CartModel> model;
  // addReviewCartData({
  // String? cartId,
  // String? cartName,
  // String? cartImage,
  // String? cartPrice,
  // String? cartQuantity,
  // }) async {
  //   await FirebaseFirestore.instance
  //       .collection('reviewCart')
  //       .doc()
  //       .collection("cart")
  //       .doc(cartId)
  //       .set({
  //     "cartId": cartId,
  //     "cartName": cartName,
  //     "cartImage": cartImage,
  //     "cartPrice": cartPrice,
  //     "cartQuantity": cartQuantity,
  //   });

  //   notifyListeners();
  // }

  // List<CartModel> reviewCartModelList = [];
  // void getReviewCartData() async {
  //   //  QuerySnapshot reviewCartData =await FirebaseFirestore.instance
  //   //       .collection('reviewCart')
  //   //       .doc()
  //   //       .collection("cart")
  //   //       .doc().get();
  // }

  // List<ProductModel> feature = [];
  // late ProductModel features;
  // List<CartModel> cartModelList = [];
  // late CartModel cartModel;

  // void getCartData(
  //     {String? cartId,
  //     String? cartName,
  //     String? cartImage,
  //     int? cartPrice,
  //     int? cartQuantity,
  //     String? cartBrandName}) {
  //   cartModel = CartModel(
  //     cartId: cartId,
  //     cartName: cartName,
  //     cartImage: cartImage,
  //     cartBrandName: cartBrandName,
  //     cartPrice: cartPrice,
  //     cartquantity: cartQuantity,
  //   );
  //   cartModelList.add(cartModel);
  // }

  // List<CartModel> get getCartModelList {
  //   return cartModelList;
  // }
  void addReviewCartData({
    required String cartId,
    required String cartName,
    required String cartmage,
    required int cartPrice,
    required int cartQuantity,
  }) async {
    FirebaseFirestore.instance
        .collection("reviewCart")
        .doc(FirebaseAuth.instance.currentUser!.uid).collection("cart").doc(cartId).set({
          "cardId":cartId,
          "cartName":cartName,
          "cartmage":cartmage,
          "cartPrice":cartPrice,
          "cartQuantity":cartQuantity,
        });
  }
}
