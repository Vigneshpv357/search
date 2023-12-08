// To parse this JSON data, do
//
//     final products = productsFromJson(jsonString);

import 'dart:convert';

Products productsFromJson(String str) => Products.fromJson(json.decode(str));

String productsToJson(Products data) => json.encode(data.toJson());

class Products {
    List<Food> food;

    Products({
        required this.food,
    });

    factory Products.fromJson(Map<String, dynamic> json) => Products(
        food: List<Food>.from(json["food"].map((x) => Food.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "food": List<dynamic>.from(food.map((x) => x.toJson())),
    };
}

class Food {
    int id;
    String image;
    String price;
    String productName;
    String categoryName;

    Food({
        required this.id,
        required this.image,
        required this.price,
        required this.productName,
        required this.categoryName,
    });

    factory Food.fromJson(Map<String, dynamic> json) => Food(
        id: json["id"],
        image: json["image"],
        price: json["price"],
        productName: json["productName"],
        categoryName: json["categoryName"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "price": price,
        "productName": productName,
        "categoryName": categoryName,
    };
}
