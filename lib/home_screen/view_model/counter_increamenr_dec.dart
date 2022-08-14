import 'package:flutter/cupertino.dart';
import 'package:food_delivery/home_screen/model/home_model.dart';

class CounterIncreamentDec extends ChangeNotifier {
  List<ProductModel> specificIncDec = [];
  int count = 1;
  bool isAdded = false;
  getCounter() => count;
  setCounter(int counter) => count = counter;

  incrementCounter() {
    count++;
    notifyListeners();
  }

  decrementCounter() {
    count--;
    notifyListeners();
  }
}
