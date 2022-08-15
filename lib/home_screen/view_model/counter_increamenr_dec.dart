import 'package:flutter/cupertino.dart';
import 'package:food_delivery/home_screen/model/home_model.dart';

class CounterIncreamentDec extends ChangeNotifier {
  List<ProductModel> specificIncDec = [];
  int count = 1;
  bool isAdded = false;
  getCounter() => count;
  setCounter(int counter) => count = counter;

  incrementCounter(String valueInc) {
    valueInc != 0 ? count++ : count;
    notifyListeners();
  }

  decrementCounter(String valueDec) {
     valueDec != 0 ? count-- : count;
    notifyListeners();
  }
}
