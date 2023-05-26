import 'package:flutter/material.dart';
import 'package:mobile_flutter/models/product_model.dart';

Widget productsGrid({required List<ProductModel> products, bool isProductPage = false}) {
  return Column(
    children: [
      const SizedBox(height: 5),
      GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: !isProductPage ? 3 : 2 ,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          childAspectRatio: 1/1.2
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final ProductModel product = products[index];
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context, 
                '/detail_product',
                arguments: index
              );
            },
            child: Column(
              children: [
                Container(
                  width: !isProductPage ? MediaQuery.of(context).size.width * 0.25 : MediaQuery.of(context).size.width * 0.4,
                  height: !isProductPage ? MediaQuery.of(context).size.width * 0.25 : MediaQuery.of(context).size.width * 0.4,
                  color: Colors.white,
                  child: Image(image: NetworkImage(product.imgUrl)),
                ),
                Expanded(
                  child: Text(
                    product.name,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 8
                    ),
                  ),
                )
              ],
            ),
          );
        },
      )
    ],
  );
}