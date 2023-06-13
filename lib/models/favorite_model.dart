import 'dart:convert';

class AppConstant {
  final String databaseId = "REPLACE WITH YOUR DATABASE ID";
  final String projectId = "REPLACE WITH YOUR PROJECT ID";
  final String endpoint = "http://10.0.2.2/v1";
  final String collectionId = "REPLACE WITH YOUR COLLECTION ID";
}

class FavoriteModel {
  String? $id;

  String name;
  String description;
  int stock;
  int price;
  String imgUrl;
  bool isFav;

  FavoriteModel(
      {this.$id,
      required this.name,
      required this.description,
      required this.stock,
      required this.price,
      required this.imgUrl,
      required this.isFav});

  factory FavoriteModel.fromJson(Map<dynamic, dynamic> json) {
    return FavoriteModel(
      $id: json['\$id'],
      name: json['name'],
      description: json['description'],
      stock: json['stock'],
      price: json['price'],
      imgUrl: json['image'],
      isFav: json['isFav'],
    );
  }

  Map<dynamic, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'stock': stock,
      'price': price,
      'imgUrl': imgUrl,
      'isFav': isFav
    };
  }
}
