import 'package:flutter/material.dart';
import 'package:mobile_flutter/models/item_cart_model.dart';
import 'package:mobile_flutter/shared/buttons.dart';
import 'package:mobile_flutter/shared/custom_appbar.dart';
import 'package:mobile_flutter/shared/format_rupiah.dart';
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
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((timeStamp) {
      Provider.of<CartProvider>(context, listen: false).getCart();
    });
  }
  
  @override
  Widget build(BuildContext context) {
    final List<ItemCartModel> items = Provider.of<CartProvider>(context).items;

    return Scaffold(
      appBar: customAppBar(context, title: 'Keranjang', isBackButton: true, isElevated: true),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return CatalogProductCard(index: index);
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1, 
                blurRadius: 1, 
                offset: const Offset(0, 2), 
              ),
            ]
          ),
          width: 428,
          height: 66,
          child: Row(
            children: [
              Checkbox(
                value: isCheckedall,
                onChanged: (bool? value) {
                  setState(() {
                    isCheckedall = value ?? false;
                  });
                },
              ),
              const Text('Semua', style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w500
              ),),
              const SizedBox(width:27),
              const Text('Total', style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w500
              ),),
              const SizedBox(width:4),
              Text(
                formatRupiah(Provider.of<CartProvider>(context).totalProduct),
                  style: const TextStyle(
                  color: Color.fromRGBO(0, 49, 123, 1),
                  fontWeight: FontWeight.w500
                ),
              ),
              const SizedBox(width:8),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                   
                  } ,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFF264ECA)
                    ),
                    child: const Center(
                      child: Text(
                        'Bayar',
                        style: TextStyle(
                          color: Colors.white
                        ),
                      ),
                    ),     
                  ),
                ),
              )
            ],
          ),
        ),
      ),
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
  bool isChecked = false;

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
            value: isChecked,
            onChanged: (bool? value) {
              setState(() {
                isChecked = value ?? false;
              });
            },
          ),
          const SizedBox(
            width: 100,
            height: 100, 
            child: Image(image: AssetImage('assets/icons/alta_icon.png'))
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
                      onPressed: () {
                        print('delete');
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