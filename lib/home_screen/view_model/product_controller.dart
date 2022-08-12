import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_delivery/home_screen/model/home_model.dart';

class ProductController extends ChangeNotifier {
  ProductController() {
    fetchLatestProductData();
  }
  List<ProductModel> lastestProductLst = [];
  late ProductModel productModel;
  fetchLatestProductData() async {
    List<ProductModel> newList = [];
    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("LatestModel").get();

    for (var element in value.docs) {
      print(element.data());
      productModel = ProductModel(
        productImage: element.get("productImage"),
        productName: element.get("productName"),
        productPrice: element.get("productPrice"),
      );
      newList.add(productModel);
    }
    lastestProductLst = newList;
    notifyListeners();
  }

  get getlastestProductLst {
    return lastestProductLst;
  }
}
