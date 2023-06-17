import 'dart:convert';

class ProductModel {

  final String id;
  final String name;
  final String description;
  final int price;
  final String imgUrl;

  const ProductModel({required this.id, required this.name, required this.description, required this.price, required this.imgUrl});

  static ProductModel fromJson({required json}) {
    final result = jsonDecode(json);
    return ProductModel(
      id: result['id'],
      name: result['name'],
      description: result['description'],
      price: result['price'],
      imgUrl: result['image']
    );
  }

}