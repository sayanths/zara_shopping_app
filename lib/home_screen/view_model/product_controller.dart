import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_delivery/home_screen/model/home_model.dart';

class ProductRespository with ChangeNotifier {
  ProductRespository() {
    fetchEmployee();
    kidsDress();
  }
  List<ProductModel> lastestProductLst = [];
  List<ProductModel> kidsDressCollection = [];
  final obj = FirebaseFirestore.instance.collection('LatestModel');
  final kidsCollectionss =
      FirebaseFirestore.instance.collection('KidsCollections');

  fetchEmployee() async {
    QuerySnapshot<Map<String, dynamic>> snapshots =
        await FirebaseFirestore.instance.collection('LatestModel').get();

    final list = snapshots.docs
        .map((docSnap) => ProductModel.fromSnapshot(docSnap))
        .toList();
    // log(list.length.toString());
    lastestProductLst.addAll(list);

    notifyListeners();
  }

  kidsDress() async {
    QuerySnapshot<Map<String, dynamic>> snapshots =
        await FirebaseFirestore.instance.collection('KidsCollections').get();

    final list = snapshots.docs
        .map((docSnap) => ProductModel.fromSnapshot(docSnap))
        .toList();
    // log(list.length.toString());
    kidsDressCollection.addAll(list);

    notifyListeners();
  }
}
