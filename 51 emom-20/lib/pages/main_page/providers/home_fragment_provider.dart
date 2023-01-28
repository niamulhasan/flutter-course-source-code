import 'dart:convert';

import 'package:ecom/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeFragmentProvider with ChangeNotifier {
  List<ProductModel> products = [];
  List categories = ["All"];

  bool isProductLoading = true;
  bool isCategoriesLoading = true;
  int selectedTabIndex = 0;

  HomeFragmentProvider() {
    loadAllProducts();
    loadAllCategories();
  }

  Future<void> loadAllProducts() async {
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
    isProductLoading = false;
    notifyListeners();
  }

  Future<void> loadProductsOfCategory(String categoryName) async {
    http.Response res = await http.get(
        Uri.parse("https://fakestoreapi.com/products/category/$categoryName"));
    if (res.statusCode == 200) {
      products = [];
      List allProducts = jsonDecode(res.body);
      allProducts.forEach((productMap) {
        products.add(ProductModel.fromJson(productMap));
      });
    } else {
      print("Error");
    }
    print(products);
    isProductLoading = false;
    notifyListeners();
  }

  void loadAllCategories() async {
    http.Response res = await http
        .get(Uri.parse("https://fakestoreapi.com/products/categories"));
    if (res.statusCode == 200) {
      categories.addAll(jsonDecode(res.body));
    } else {
      print("Error");
    }
    print(categories);
    isCategoriesLoading = false;
    notifyListeners();
  }

  void changeProductCategoryTab(int index) async {
    selectedTabIndex = index;
    notifyListeners();
    isProductLoading = true;
    if (index == 0) {
      await loadAllProducts();
    } else {
      await loadProductsOfCategory(categories[index]);
    }
  }
}
