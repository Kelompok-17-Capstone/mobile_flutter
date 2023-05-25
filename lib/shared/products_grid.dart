import 'package:flutter/material.dart';

Padding productsGrid({bool isProductPage = false}) {
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
          itemCount: 6,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  width: !isProductPage ? MediaQuery.of(context).size.width * 0.25 : MediaQuery.of(context).size.width * 0.4,
                  height: !isProductPage ? MediaQuery.of(context).size.width * 0.25 : MediaQuery.of(context).size.width * 0.4,
                  color: Colors.white,
                  child: const Image(image: AssetImage('assets/icons/alta_icon.png')),
                ),
                const Expanded(
                  child: Text(
                    '#PRODUCT_NAME',
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
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