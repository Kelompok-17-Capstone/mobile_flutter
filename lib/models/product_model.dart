import 'dart:convert';

class ProductModel {

  final dynamic id;
  final String name;
  final String description;
  final int stock;
  final int price;
  final String imgUrl;
  final int? favoriteCount;

  const ProductModel({required this.id, required this.name, required this.description, required this.stock, required this.price, required this.imgUrl, required this.favoriteCount});

  static ProductModel fromJson({required json}) {
    final result = jsonDecode(json);
    return ProductModel(
      id: result['id'],
      name: result['name'],
      description: result['description'],
      stock: result['stock'],
      price: result['price'],
      imgUrl: result['image'],
      favoriteCount: result['favorit']
    );
  }

}