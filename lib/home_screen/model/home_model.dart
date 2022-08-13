import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  String? productName;
  String? productImage;
  int? productPrice;
  String? brandName;

  ProductModel({
    this.productName,
    this.productImage,
    this.productPrice,
    this.brandName,
  });

  static ProductModel fromSnapshot(DocumentSnapshot snap) {
    ProductModel product = ProductModel(
      productName: snap['productName'],
      productImage: snap['productImage'],
      productPrice: snap['productPrice'],
      brandName: snap['brandName'],
    );
    return product;
  }

  Map<String, dynamic> toSnapShot() => {
        "productName": productName,
        "productImage": productImage,
        "productPrice": productPrice,
        "brandName": brandName,
      };
}
