import 'package:flutter/material.dart';

import '../../../domain/model/shopping_item.dart';

class ShoppingProvider with ChangeNotifier {
  Map<ShoppingItem, int> shoppingItems = {};
  int count = 0;

  void addShoppingItem(ShoppingItem item) {
    shoppingItems[item] =
        shoppingItems[item] == null ? 1 : shoppingItems[item]! + 1;
    count++;
    notifyListeners();
  }

  void removeShoppingItem(ShoppingItem item) {
    if (shoppingItems[item] == 1) {
      shoppingItems.remove(item);
    } else {
      shoppingItems[item] = shoppingItems[item]! - 1;
    }
    count--;
    notifyListeners();
  }

  void addToCart(ShoppingItem item ,int count){
    shoppingItems[item] = count;
    performCount();
    notifyListeners();
  }

  void performCount() {
    count = shoppingItems.length;
  }

  double countTotal() {
    double total = 0;
    shoppingItems.forEach((key, value) {
      total += key.price.toDouble() * value;
    });
    return total;
  }
}
