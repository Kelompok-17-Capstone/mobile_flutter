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

class _ProductsViewState extends State<ProductsView> with TickerProviderStateMixin{

  late TabController _tabController;
  
  @override
  void initState() {
    // Specifies number of Tabs here
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<ProductModel> products = Provider.of<ProductProvider>(context).products;

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF4F4F4),
        body: Column(
          children: [
            Container(
              color: Colors.white,
              height: 40,
              child: TabBar(
                controller: _tabController,
                labelColor: const Color(0xFF264ECA), //<-- selected text color
                unselectedLabelColor: const Color(0xFF7D828C),
                indicatorColor: const Color(0xFF264ECA),
                tabs: [
                  const Tab(
                    child: Text(
                      'Terbaru',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      )
                    ),
                  ),
                  const Tab(
                    child: Text(
                      'Terfavorit',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      )
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Harga',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Icon(
                        Icons.unfold_more_rounded,
                        size: 18,
                      ),
                    ]
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _tabController,
                children: [
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: productsGrid(products: products, isProductPage: true)
                    ),
                  ),
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: productsGrid(products: products, isProductPage: true),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: productsGrid(products: products, isProductPage: true),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  }
