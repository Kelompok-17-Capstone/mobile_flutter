import 'package:flutter/material.dart';
import 'package:mobile_flutter/arguments/checkout_view_argument.dart';
import 'package:mobile_flutter/models/item_cart_model.dart';
import 'package:mobile_flutter/shared/buttons.dart';
import 'package:mobile_flutter/shared/custom_appbar.dart';
import 'package:mobile_flutter/shared/format_rupiah.dart';
import 'package:mobile_flutter/shared/snack_bar.dart';
import 'package:mobile_flutter/views/dashboard/product/cart_provider.dart';
import 'package:provider/provider.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  bool isCheckedall = false;
  
  @override
  Widget build(BuildContext context) {
    final List<ItemCartModel> items = Provider.of<CartProvider>(context).items;

    return Scaffold(
      appBar: customAppBar(context, title: 'Keranjang', isBackButton: true, isElevated: true),
      body: Column(
        children: [
          Expanded(
            child: items.isEmpty
            ? const Center(
              child: Text('Cart is Empty'),
            )
            : ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return CatalogProductCard(index: index);
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.white,
                    child: Row(
                      children: [
                        Checkbox(
                          value: isCheckedall,
                          fillColor: MaterialStatePropertyAll(const Color(0xFF264ECA).withOpacity(0.9)),
                          onChanged: (bool? value) {
                            if (value != null) {
                              setState(() {
                                isCheckedall = value;
                              });
                              Provider.of<CartProvider>(context, listen: false).checkAll(checkAll: isCheckedall);
                            }
                          },
                        ),
                        const Text('Semua', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500)),
                        const Spacer(),
                        const Text('Total  ', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500)),
                        const Text('Rp5.000.000', style: TextStyle(color: Color(0xFF00317B), fontWeight: FontWeight.w500)),
                        const SizedBox(width: 10)
                      ],
                    )
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF264ECA),
                      border: Border.all(width: 0.5, color: const Color(0xFF264ECA))
                    ),
                    child: TextButton(
                      key: const Key('buy-button-key'),
                      onPressed: () {
                        final List<ItemCartModel> products = List.from(items.where((element) => element.isChecked == true));
                        if (products.isEmpty) {
                          snackBar(context, 'Silahkan pilih produk');
                        } else {
                          Navigator.pushNamedAndRemoveUntil(
                          context,
                          '/checkout',
                          ModalRoute.withName('/dashboard'),
                          arguments: CheckoutViewArgument(cart: products)
                        );
                        }
                        
                      },
                      child: const Text('Bayar', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500)),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      )
    );
  }
}

class CatalogProductCard extends StatefulWidget {
  final int index;
  const CatalogProductCard({Key? key, required this.index}) : super(key: key);

  @override
  State<CatalogProductCard> createState() => _CatalogProductCardState();
}

class _CatalogProductCardState extends State<CatalogProductCard> {

  @override
  Widget build(BuildContext context) {

    final ItemCartModel item = Provider.of<CartProvider>(context).items[widget.index];

    return Container(
      margin: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1, 
            blurRadius: 5, 
            offset: const Offset(0, 2), 
          ),
        ]
      ),
      height: 142,
      width: 428,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Checkbox(
            value: item.isChecked,
            fillColor: MaterialStatePropertyAll(const Color(0xFF264ECA).withOpacity(0.9)),
            onChanged: (bool? value) {
              if (value != null) {
                Provider.of<CartProvider>(context, listen: false).checkItem(cartId: item.cartId!, isChecked: value);
              }
            },
          ),
          Container(
            color: Colors.grey[100],
            width: 100,
            height: 100, 
            child: Image(image: NetworkImage(item.product.imgUrl))
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.product.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    Text(
                      formatRupiah(item.product.price),
                      style: const TextStyle(fontSize: 14),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () async {
                        final String result = await Provider.of<CartProvider>(context, listen: false).deleteCartItem(cartId: item.cartId!);
                        if(!mounted) return;
                        snackBar(context, '$result delete cart');
                      },
                      icon: Icon(Icons.delete_outline, color: Colors.red[600],)
                    ),
                    Container(
                      height: 36,
                      margin: const EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEAF2FF),
                        borderRadius: BorderRadius.circular(6)
                      ),
                      child: Row(
                        children: [
                          miniButton(icon: Icons.remove, onPressed: () {
                            if (item.itemCount > 1) {
                              Provider.of<CartProvider>(context, listen: false).localItemCount(index: widget.index, count: -1);
                            }
                          }),
                          SizedBox(
                            width: 30,
                            child: Text(item.itemCount.toString(), textAlign: TextAlign.center,),
                          ),
                          miniButton(icon: Icons.add, onPressed: () {
                            Provider.of<CartProvider>(context, listen: false).localItemCount(index: widget.index, count: 1);
                          },)
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      
    );
  }
}