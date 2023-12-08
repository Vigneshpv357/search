import 'package:flutter/cupertino.dart';

import 'package:http/http.dart';

import 'package:http/http.dart' as http;
import 'package:search/model/product.dart';

class ProductProvider extends ChangeNotifier {
  static const apiEndpoint =
      'https://mocki.io/v1/02af12fd-41ad-42f6-9137-b405e0c1d8df';

  bool isLoading = true;
  String error = '';
  Products product = Products(food: []);
  Products serachedProduct = Products(food: []);
  String searchText = '';

  //
  getDataFromAPI() async {
    try {
      Response response = await http.get(Uri.parse(apiEndpoint));
      if (response.statusCode == 200) {
        product = productsFromJson(response.body);
      } else {
        error = response.statusCode.toString();
      }
    } catch (e) {
      error = e.toString();
    }
    isLoading = false;
    updateData();
  }

  updateData() {
    serachedProduct.food.clear();
    if (searchText.isEmpty) {
      serachedProduct.food.addAll(product.food);
    } else {
      serachedProduct.food.addAll(product.food
          .where((element) =>
              element.productName.toLowerCase().startsWith(searchText))
          .toList());
    }
    notifyListeners();
  }

  search(String username) {
    searchText = username;
    updateData();
  }
  //
}