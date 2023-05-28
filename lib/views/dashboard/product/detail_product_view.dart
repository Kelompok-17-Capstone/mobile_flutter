import 'package:flutter/material.dart';
import 'package:mobile_flutter/models/product_model.dart';
import 'package:mobile_flutter/shared/buttons.dart';
import 'package:mobile_flutter/shared/popup_dialog.dart';
import 'package:mobile_flutter/views/dashboard/product/product_provider.dart';
import 'package:provider/provider.dart';

class DetailProductView extends StatefulWidget {
  final int index;
  const DetailProductView({super.key, required this.index});

  @override
  State<DetailProductView> createState() => _DetailProductViewState();
}

class _DetailProductViewState extends State<DetailProductView> {

  @override
  Widget build(BuildContext context) {
    final ProductModel product = Provider.of<ProductProvider>(context).products[widget.index];
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
                        child: Hero(
                          tag: product.id,
                          child: Image(
                            fit: BoxFit.fitWidth,
                            image: NetworkImage(product.imgUrl),
                          ),
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
                                  showDialog(
                                    context: context,
                                    builder:(context) => popupMessageDialog(
                                      context,
                                      judul: 'Maaf',
                                      content: ' Akun Anda belum terdaftar. Silahkan daftar akun untuk menikmati fitur ini.'
                                    ),
                                  );
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
                            product.formatedPrice(),
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
                        showBuyNowDialog(context, product);
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
                        notAMember(context);
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

  Future<void> notAMember(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12)
      ),
      builder:(context) {
        return Wrap(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const Image(image: AssetImage('assets/images/sorry.png')),
                  const Text(
                    'Maaf, akun Anda belum terdaftar. Silahkan daftar akun untuk dapat melakukan pembelian produk.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey
                    ),
                  ),
                  const SizedBox(height: 20),
                  fullWidthButton(label: 'Daftar Akun', onPressed:() {
                    Navigator.pushNamedAndRemoveUntil(context, '/welcome', (route) => false);
                  }),
                  const SizedBox(height: 20)
                ],
              ),
            ),
            
          ],
        );
      },
    );
  }

  Future<void> showBuyNowDialog(BuildContext context, ProductModel product) {
    int itemCount = 1;
    return showModalBottomSheet<void>(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12)
      ),
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Wrap(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Image(
                            width: MediaQuery.of(context).size.width * 0.4,
                            image: NetworkImage(product.imgUrl),
                          ),
                          Expanded(
                            child: Text(
                              product.formatedPrice(),
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF264ECA)
                              ),
                              textAlign: TextAlign.end
                            )
                          )
                        ],
                      ),
                      const SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Jumlah'),
                          Container(
                            height: 36,
                            decoration: BoxDecoration(
                              color: const Color(0xFFEAF2FF),
                              borderRadius: BorderRadius.circular(6)
                            ),
                            child: Row(
                              children: [
                                miniButton(icon: Icons.remove, onPressed: () {
                                  if (itemCount > 1) {
                                    setState(() {
                                      itemCount--;
                                    });
                                  }
                                }),
                                SizedBox(
                                  width: 30,
                                  child: Text(itemCount.toString(), textAlign: TextAlign.center,),
                                ),
                                miniButton(icon: Icons.add, onPressed: () {
                                  setState(() {
                                    itemCount++;
                                  });
                                },)
                              ],
                            ),
                          )
                        ],
                      ),
              
                      const SizedBox(height: 40),
                      fullWidthButton(label: 'Beli Sekarang', onPressed: () {
                        Navigator.pop(context);
                        notAMember(context);
                      },)
                    ],
                  ),
                ),
              ]
            );
          },
        );
      },
    );
  }
}