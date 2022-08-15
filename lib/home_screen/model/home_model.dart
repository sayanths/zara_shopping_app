import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  String productName;
  String productImage;
  int productPrice;
  String brandName;
  double productRating;
  int productoffers;
 // int discountPrice;

  ProductModel({
    required this.productName,
    required this.productImage,
    required this.productPrice,
    required this.brandName,
    required this.productRating,
    required this.productoffers,
   // required this.discountPrice,
  });

//databaseill ninn vernna value namaa
  factory ProductModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snap) {
    return ProductModel(
      productName: snap['productName'],
      productImage: snap['productImage'],
      productPrice: snap['productPrice'],
      brandName: snap['brandName'],
      productRating: snap['productRating'],
      productoffers: snap['productoffers'],
    //  discountPrice: snap['discountPrice'],
    );
  }

//evidnn data databaseillek ayakan 
  Map<String, dynamic> toSnapShot() => {
        "productName": productName,
        "productImage": productImage,
        "productPrice": productPrice,
        "brandName": brandName,
        "productRating": productRating,
        "productoffers": productoffers,
     //   "discountPrice":discountPrice,
      };
}
