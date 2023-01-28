import 'dart:convert';

import 'package:ecom/models/product_model.dart';
import 'package:ecom/models/product_quantity_model.dart';
import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  List<ProductQuantityModel> _items = [];
  double totalPrice = 0;
  int totalItemsCount = 0;

  List<ProductQuantityModel> get items {
    return _items;
  }

  void addProduct(ProductModel product) {
    for (var item in _items) {
      if (item.product.id == product.id) {
        item.quantity += 1;
        notifyListeners();
        _calculateTotalPriceAndItems();
        return;
      }
    }
    _items.add(ProductQuantityModel(product: product, quantity: 1));
    notifyListeners();
    _calculateTotalPriceAndItems();
  }

  void removeProduct(ProductModel product) {
    for (var item in _items) {
      if (item.product.id == product.id) {
        item.quantity -= 1;
        if (item.quantity == 0) {
          _items.remove(item);
        }
        notifyListeners();
        _calculateTotalPriceAndItems();
      }
    }
    notifyListeners();
    _calculateTotalPriceAndItems();
  }

  void _calculateTotalPriceAndItems() {
    totalPrice = 0;
    totalItemsCount = 0;
    for (var item in _items) {
      totalPrice = (item.product.price ?? 0) * item.quantity;
      totalItemsCount = item.quantity;
    }
    notifyListeners();
  }

  int countProduct(ProductModel product) {
    for (var item in _items) {
      if (item.product.id == product.id) {
        return item.quantity;
      }
    }
    return 0;
  }

  bool payNow(String cardNumber) {
    Map response = jsonDecode(FakePaymentClient.pay(cardNumber));
    if (response["success"] == true) {
      _items = [];
      notifyListeners();
      return true;
    }
    return false;
  }
}

class FakePaymentClient {
  static String pay(String cardNumber) {
    if (cardNumber == "1111") {
      return '''
      {
        "success": true
      }
      ''';
    }
    return '''
    {
      "success": false
    }
    ''';
  }
}
