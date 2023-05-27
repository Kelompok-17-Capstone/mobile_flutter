import 'package:flutter/material.dart';
import 'package:mobile_flutter/models/product_model.dart';
import 'package:mobile_flutter/shared/buttons.dart';
import 'package:mobile_flutter/views/dashboard/product/product_provider.dart';
import 'package:provider/provider.dart';

class DetailProductView extends StatelessWidget {
  final int index;
  const DetailProductView({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final ProductModel product = Provider.of<ProductProvider>(context).products[index];
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Image(
                          fit: BoxFit.fitWidth,
                          image: NetworkImage(product.imgUrl),
                        ),
                      ),
                      Positioned(
                        top: 30,
                        left: 10,
                        child: customBackButton(context)
                      ),
                      Positioned(
                        top: 30,
                        right: -40,
                        child: Container(
                          padding: const EdgeInsets.only(right: 50, left: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100)
                          ),
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  
                                },
                                icon: const Icon(Icons.favorite_outline, color: Color(0xFF264ECA)),
                              ),
                              const SizedBox(width: 10),
                              IconButton(
                                onPressed: () {
                                  
                                },
                                icon: const Icon(Icons.shopping_cart_outlined, color: Color(0xFF264ECA)),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: const Offset(0, -1), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400
                            ),
                          ),
                          Text(
                            'Rp${product.price}',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF264ECA)
                            ),
                          ),
                          Text(
                            '100+ Terfavorit',
                            style: TextStyle(
                              color: Colors.grey[500]
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    color: Colors.white,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Deskripsi'),
                          const Divider(),
                          Text(product.description),
                          const SizedBox(height: 20)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 0.5, color: const Color(0xFF264ECA))
                    ),
                    child: IconButton(
                      onPressed: () {
                        
                      },
                      icon: const Icon(Icons.shopping_cart_outlined, color: Color(0xFF264ECA),),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF264ECA),
                      border: Border.all(width: 0.5, color: const Color(0xFF264ECA))
                    ),
                    child: TextButton(
                      onPressed: () {
                        
                      },
                      child: const Text('Beli Sekarang', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500)),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}