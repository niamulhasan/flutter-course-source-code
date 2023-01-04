import 'dart:convert';

import 'package:ecom/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeFragmentProvider with ChangeNotifier {
  List<ProductModel> products = [];

  bool isLoading = true;

  HomeFragmentProvider() {
    loadAllProducts();
  }

  void loadAllProducts() async {
    http.Response res =
        await http.get(Uri.parse("https://fakestoreapi.com/products"));
    if (res.statusCode == 200) {
      List allProducts = jsonDecode(res.body);
      allProducts.forEach((productMap) {
        products.add(ProductModel.fromJson(productMap));
      });
    } else {
      print("Error");
    }
    print(products);
    isLoading = false;
    notifyListeners();
  }
}
