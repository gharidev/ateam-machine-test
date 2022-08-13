import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/product.dart';

const BASE_URL = 'https://fakestoreapi.com';

enum ProductsStatus { loading, success, error }

class ProductsProvider with ChangeNotifier {
  List<Product>? _products;
  ProductsStatus? _status;

  List<Product>? get products => _products;
  ProductsStatus? get status => _status;

  Future<void> getProducts() async {
    if (status == ProductsStatus.loading) return;
    _status = ProductsStatus.loading;
    // try {
    final response = await http.get(Uri.parse('$BASE_URL/products'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List;
      _products = data.map((product) => Product.parseJSON(product)).toList();
      _status = ProductsStatus.success;
    } else {
      _status = ProductsStatus.error;
    }
    // } catch (err) {
    //   print(err);
    //   _status = ProductsStatus.error;
    // }
    notifyListeners();
  }
}
