import 'package:flutter/material.dart';
import 'package:mobile_flutter/models/product_model.dart';

Padding productsGrid({required List<ProductModel> products, bool isProductPage = false}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              'Produk Terbaru',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14
              ),
            ),
            Text(
              'lihat semua',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12,
                color: Colors.grey
              ),
            )
          ],
        ),
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
            return Column(
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
            );
          },
        )
      ],
    ),
  );
}