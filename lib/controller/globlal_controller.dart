import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getx_demo/models/product.dart';

class GlobalController extends GetxController {
  List<Product> _products = [];
  Map<String, Product> _favorites = Map();

  List<Product> get products => _products;
  Map<String, Product> get favorites => _favorites;

  @override
  void onInit() {
    super.onInit();
    print("😁 global onInit");
    _loadProducts();
  }

  Future<void> _loadProducts() async {
    final String productsString =
        await rootBundle.loadString('assets/products.json');

    this._products = (jsonDecode(productsString) as List)
        .map((e) => Product.fromJson(e))
        .toList();
    print("😃 produtos carregados");
    update(['products']);
  }

  onFavorite(int index, bool isFavorite) {
    Product product = this._products[index];
    product.isFavorite = isFavorite;
    if (isFavorite) {
      this._favorites[product.name] = product;
    } else {
      this._favorites.remove(product.name);
    }
    update(['products', 'favorites']);
  }
}
