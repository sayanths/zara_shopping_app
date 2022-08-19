import 'package:cloud_firestore/cloud_firestore.dart';

class CartModel {
  String? cartImage;
  int? cartPrice;
  String? cartBrandName;
  int? cartquantity;
  String? cartName;

  CartModel({
    this.cartImage,
    this.cartPrice,
    this.cartBrandName,
    this.cartquantity,
    this.cartName,
  });
  factory CartModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snap) {
    return CartModel(
        cartName: snap['cartName'],
        cartImage: snap['cartImage'],
        cartPrice: snap['cartPrice'],
        cartBrandName: snap['cartBrandName']);
  }
  Map<String, dynamic> toSnapShot() => {
        "cartName": cartName,
        "cartImage": cartImage,
        "cartPrice": cartPrice,
        "cartBrandName": cartBrandName,
      };
}
