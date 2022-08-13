import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_delivery/home_screen/model/home_model.dart';


class ProductRespository with ChangeNotifier {
  List<ProductModel> lastestProductLst = [];
  final obj = FirebaseFirestore.instance.collection('LatestModel');
}
