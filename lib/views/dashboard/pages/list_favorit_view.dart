import 'package:flutter/material.dart';
import 'package:mobile_flutter/arguments/detail_product_view_argument.dart';
import 'package:mobile_flutter/models/product_model.dart';
import 'package:mobile_flutter/shared/format_rupiah.dart';
import 'package:mobile_flutter/shared/headers.dart';
import 'package:mobile_flutter/views/dashboard/product/product_provider.dart';
import 'package:provider/provider.dart';

class ListFavoritView extends StatefulWidget {
  const ListFavoritView({super.key});

  @override
  State<ListFavoritView> createState() => _ListFavoritViewState();
}

class _ListFavoritViewState extends State<ListFavoritView> {

  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((timeStamp) {
      Provider.of<ProductProvider>(context, listen: false).getFavoriteProduct();
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<ProductModel> products = Provider.of<ProductProvider>(context).favoriteProducts;
    final ProductState state = Provider.of<ProductProvider>(context).state;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              customHeader(
                context,
                title: 'Favorit',
                content: Container(
                  margin: const EdgeInsets.only(top: 70),
                  color: Colors.white,
                  width: 380,
                  height: 180,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Image(
                        image: AssetImage('assets/icons/alta_icon.png'),
                        height: 73,
                      ),
                      Text('Alta Tech', style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500))
                    ],
                  ),
                )
              ),
              const SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: state == ProductState.loading
                ? CircularProgressIndicator(color: const Color(0xFF264ECA).withOpacity(0.8))
                : products.isEmpty
                ? const Center(child: Text('Saat ini tidak ada favorit produk'))
                : GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:  2 ,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 10,
                    childAspectRatio: 1/1.3
                  ),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final ProductModel product = products[index];
                    return Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              height: MediaQuery.of(context).size.width * 0.4,
                              color: Colors.white,
                              child: Hero(
                                tag: 'tag-$index-favorite',
                                child: Image(image: NetworkImage(product.imgUrl))
                              ),
                            ),
                            Positioned(
                              right: 0,
                              child: IconButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: const Text('Hapus produk dari favorit?'),
                                        actions: [
                                          TextButton(
                                            onPressed: () async {
                                              if(!mounted) return;
                                              Navigator.pop(context);
                                            },
                                            child: const Text('Yes', style: TextStyle(color: Colors.redAccent))
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text('No')
                                          )
                                        ],
                                      );
                                    },
                                  );
                                },
                                icon: const Icon(Icons.favorite, color: Colors.red),
                              ),
                            )
                          ],
                        ),
                        Expanded(
                          child: Text(
                            product.name,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            formatRupiah(product.price),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF264ECA)
                            ),
                          ),
                        )
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}