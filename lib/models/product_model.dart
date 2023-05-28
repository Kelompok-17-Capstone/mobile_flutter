import 'dart:convert';

class ProductModel {

  final String id;
  final String name;
  final String description;
  final int stock;
  final int price;
  final String imgUrl;

  const ProductModel({required this.id, required this.name, required this.description, required this.stock, required this.price, required this.imgUrl});

  static ProductModel fromJson({required json}) {
    final result = jsonDecode(json);
    return ProductModel(
      id: result['id'],
      name: result['name'],
      description: result['description'],
      stock: result['stock'],
      price: result['price'],
      imgUrl: result['image']
    );
  }

  String formatedPrice(){
    String priceToString = price.toString();
    String priceInText = "";
    int counter = 0;
    for(int i = (priceToString.length - 1);  i >= 0; i--){
      counter++;
      String str = priceToString[i];
      if((counter % 3) != 0 && i !=0){
        priceInText = "$str$priceInText";
      }else if(i == 0 ){
        priceInText = "$str$priceInText";
      
      }else{
        priceInText = ".$str$priceInText";
      }
    }

    return 'Rp${priceInText.trim()}';
  }

}