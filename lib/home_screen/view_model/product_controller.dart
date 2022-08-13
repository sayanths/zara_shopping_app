import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_delivery/home_screen/model/home_model.dart';

class ProductRespository with ChangeNotifier {
  ProductRespository() {
    fetchEmployee();
  }
  List<ProductModel> lastestProductLst = [];
  final obj = FirebaseFirestore.instance.collection('LatestModel');

  fetchEmployee() async {
    QuerySnapshot<Map<String, dynamic>> snapshots =
        await FirebaseFirestore.instance.collection('LatestModel').get();

    final list = snapshots.docs
        .map((docSnap) => ProductModel.fromSnapshot(docSnap))
        .toList();
    lastestProductLst.addAll(list);

    notifyListeners();
  }
}
