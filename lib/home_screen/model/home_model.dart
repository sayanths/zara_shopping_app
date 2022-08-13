import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  String productName;
  String productImage;
  int productPrice;
  String brandName;

  ProductModel({
   required this.productName,
   required this.productImage,
   required this.productPrice,
   required this.brandName,
  });

   factory ProductModel.fromSnapshot(DocumentSnapshot<Map<String,dynamic>> snap) {
    return ProductModel(
      productName: snap['productName'],
      productImage: snap['productImage'],
      productPrice: snap['productPrice'],
      brandName: snap['brandName'],
    );

  }

  Map<String, dynamic> toSnapShot() => {
        "productName": productName,
        "productImage": productImage,
        "productPrice": productPrice,
        "brandName": brandName,
      };
}
