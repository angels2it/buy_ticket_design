import 'dart:collection';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:buy_tickets_design/product.dart';
import 'package:buy_tickets_design/models/product_response.dart';
import 'package:flutter/cupertino.dart';

class AppState extends ChangeNotifier {
  final List<Product> _items = [];

  /// An unmodifiable view of the items in the cart.
  UnmodifiableListView<Product> get items => UnmodifiableListView(_items);

  /// The current total price of all items (assuming all items cost $42).
  int get totalPrice => _items.length * 42;

  /// Adds [item] to cart. This is the only way to modify the cart from outside.
  void add(Product item) {
    _items.add(item);
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

  Future<List<Product>> fetchFoods() async {
    final response = await http
        .get('http://wet-api.ezs.network/api/services/app/Food/GetAll');

    if (response.statusCode == 200) {
      Map<String, dynamic> res = json.decode(response.body);
      var result = res['result'];

      ProductResponse productResponse = ProductResponse.fromJson(result);

      _items.clear();
      for (var item in productResponse.items) {
        _items.add(Product.fromJson(item));
      }
      return _items;
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load foods');
    }
  }
}
