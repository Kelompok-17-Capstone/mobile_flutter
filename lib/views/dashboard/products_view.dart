import 'package:flutter/material.dart';
import 'package:mobile_flutter/models/product_model.dart';
import 'package:mobile_flutter/shared/products_grid.dart';
import 'package:mobile_flutter/views/dashboard/product/product_provider.dart';
import 'package:provider/provider.dart';

class ProductsView extends StatefulWidget {
  const ProductsView({super.key});

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {

  late TabController _tabController;
  
  @override
  void initState() {
    // Specifies number of Tabs here
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final List<ProductModel> products = Provider.of<ProductProvider>(context).products;
    final PriceState priceState = Provider.of<ProductProvider>(context).priceState;

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF4F4F4),
        body: Column(
          children: [
            Container(
              color: Colors.white,
              height: 40,
              child: Row(
                children: [
                  Expanded(
                    child: TabBar(
                      controller: _tabController,
                      onTap: (value) {
                        Provider.of<ProductProvider>(context, listen: false).setProductTab(productTab: value == 0 ? 'terbaru': 'terfavorit');
                      },
                      labelColor: const Color(0xFF264ECA), //<-- selected text color
                      unselectedLabelColor: Colors.grey,
                      indicatorColor: const Color(0xFF264ECA),
                      tabs: const [
                        Tab(
                          child: Text(
                            'Terbaru',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            )
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Terfavorit',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            )
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (priceState == PriceState.none) {
                          Provider.of<ProductProvider>(context, listen: false).setPriceState(state: PriceState.ascending);
                        } else if (priceState == PriceState.ascending) {
                          Provider.of<ProductProvider>(context, listen: false).setPriceState(state: PriceState.descending);
                        } else {
                          Provider.of<ProductProvider>(context, listen: false).setPriceState(state: PriceState.none);
                        }
                      });
                      print(priceState);
                    },
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.33,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Harga',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: priceState == PriceState.none ? Colors.grey : const Color(0xFF264ECA)
                            ),
                          ),
                          Icon(
                            priceState == PriceState.none
                            ? Icons.unfold_more_outlined
                            : priceState == PriceState.ascending
                            ? Icons.expand_less_outlined
                            : Icons.expand_more_outlined, // unfold_more_rounded
                            size: 18,
                            color: priceState == PriceState.none ? Colors.grey : const Color(0xFF264ECA),
                          ),
                        ]
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: productsGrid(products: products, isProductPage: true),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  
  @override
  bool get wantKeepAlive => true;
  }
