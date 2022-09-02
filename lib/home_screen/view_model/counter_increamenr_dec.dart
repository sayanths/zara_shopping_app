import 'package:flutter/cupertino.dart';
import 'package:food_delivery/home_screen/model/home_model.dart';

class CounterIncreamentDec extends ChangeNotifier {
  List<ProductModel> specificIncDec = [];
  int count = 1;
  bool isAdded = false;
  getCounter() => count;
  setCounter(int counter) => count = counter;

  incrementCounter(String valueInc) {
    // ignore: unrelated_type_equality_checks
    valueInc != 0 ? count++ : count;
    notifyListeners();
  }

  decrementCounter(String valueDec) {
    // ignore: unrelated_type_equality_checks
    valueDec != 0 ? count-- : count;
    notifyListeners();
  }
}
