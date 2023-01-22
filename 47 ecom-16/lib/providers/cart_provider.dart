import 'package:ecom/models/product_model.dart';
import 'package:ecom/models/product_quantity_model.dart';
import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  List<ProductQuantityModel> _items = [];

  List<ProductQuantityModel> get items {
    return _items;
  }

  void addProduct(ProductModel product) {
    for (var item in _items) {
      if (item.product.id == product.id) {
        item.quantity += 1;
        notifyListeners();
        return;
      }
    }
    _items.add(ProductQuantityModel(product: product, quantity: 1));
    notifyListeners();
  }

  void removeProduct(ProductModel product) {
    for (var item in _items) {
      if (item.product.id == product.id) {
        item.quantity -= 1;
        if (item.quantity == 0) {
          _items.remove(item);
        }
        notifyListeners();
      }
    }
    notifyListeners();
  }
}
