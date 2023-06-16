import 'package:flutter/material.dart';
import 'package:mobile_flutter/arguments/detail_product_view_argument.dart';
import 'package:mobile_flutter/models/product_model.dart';
import 'package:mobile_flutter/shared/format_rupiah.dart';

Widget productsGrid({required List<ProductModel> products, bool isProductPage = false}) {
  return Column(
    children: [
      GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: !isProductPage ? 3 : 2 ,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          childAspectRatio: 1/1.3
        ),
        itemCount: !isProductPage && products.length > 6 ? 6 : products.length,
        itemBuilder: (context, index) {
          final ProductModel product = products[index];
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context, 
                '/detail_product',
                arguments: DetailProductViewArgument(index: index)
              );
            },
            child: Column(
              children: [
                Container(
                  width: !isProductPage ? MediaQuery.of(context).size.width * 0.25 : MediaQuery.of(context).size.width * 0.4,
                  height: !isProductPage ? MediaQuery.of(context).size.width * 0.25 : MediaQuery.of(context).size.width * 0.4,
                  color: Colors.white,
                  child: Hero(
                    tag: '${product.id}-$isProductPage',
                    child: Image(image: NetworkImage(product.imgUrl))
                  ),
                ),
                Expanded(
                  child: Text(
                    product.name,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 10
                    ),
                  ),
                ),
                !isProductPage
                ? const SizedBox()
                : Expanded(
                  child: Text(
                    formatRupiah(product.price),
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF264ECA)
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