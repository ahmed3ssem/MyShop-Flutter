import 'package:flutter/material.dart';

class CartItem{
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem({
    @required this.id,
    @required this.title,
    @required this.quantity,
    @required this.price
});


}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  void addItem(String productId, double price, String title) {
    if (_items.containsKey(productId)) {
      _items.update(productId, (exsistingItem) =>
          CartItem(
              id: exsistingItem.id,
              title: exsistingItem.title,
              quantity: exsistingItem.quantity + 1,
              price: exsistingItem.price
          ));
    }
    else {
      _items.putIfAbsent(productId, () =>
          CartItem(id: DateTime.now().toString(),
              title: title,
              quantity: 1,
              price: price));
    }
    notifyListeners();
  }

  int get itemCount{
    return  _items.length;
  }

  double get totalAmount{
    double totalAmount = 0.0;
    _items.forEach((key , cartItem){
      totalAmount += cartItem.price*cartItem.quantity;
    });
    return totalAmount;
  }

  void removeItem(String id)
  {
    _items.remove(id);
    notifyListeners();
  }
}