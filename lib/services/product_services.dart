// import 'dart:convert';
// import 'package:food/model/product.dart';
// import 'package:http/http.dart' as http;


// class ProductService {
//   Future<List<Products>> getAll() async {
//     const url = 'https://retoolapi.dev/EWXPqd/food';
//     final uri = Uri.parse(url);
//     final response = await http.get(uri);
//     if (response.statusCode == 200) {
//       final json = jsonDecode(response.body) as List;
//       final product = json.map((e) {
//         return Products(
//           id: e['id'],
//           image: e['image'],
//           productName: e['productName'],
//           categoryName: e['categoryName'],
//            price: e['price'],
//         );
//       }).toList();
//       return product;
//     }
//     return [];
//     // throw "Something went wrong";
//   } 
 
// }
