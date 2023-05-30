import 'package:flutter/material.dart';

class ProductsView extends StatefulWidget {
  const ProductsView({super.key});

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> with TickerProviderStateMixin{
  late TabController _tabController;

  final List<AssetImage> produk = [
    const AssetImage("assets/images/produk.png"),
    const AssetImage("assets/images/produk1.png"),
    const AssetImage("assets/images/produk2.png"),
  ];
  List<String> detail = [
    'Blue Alien 2TB SSD Gaming PC',
    'Blue Alien Electric Standing Desk',
    'Blue Alien Mechanical Keyborad',
  ];
  List<String> harga = ['Rp.10.000.000', 'Rp.2.000.000', 'Rp.8.000.000'];
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF4F4F4),
        body: Padding(
          padding: const EdgeInsets.all(0),
          child: Column(
            children: [
              Container(
                color: Colors.white,
                padding: const EdgeInsets.only(top: 0),
                height: 40,
                child: TabBar(
                  controller: _tabController,

                  // HexColor('#FFFFFF'),
                  labelColor: const Color(0xFF264ECA), //<-- selected text color
                  unselectedLabelColor: const Color(0xFF7D828C),
                  indicatorColor: const Color(0xFF264ECA),

                  tabs: [
                    const Tab(
                      child: Text('Terbaru',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          )),
                    ),
                    const Tab(
                      child: Text('Terlaris',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          )),
                    ),
                    Row(children: const [
                      Text(
                        'Harga',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(width: 0),
                      Icon(
                        Icons.unfold_more_rounded,
                        size: 18,
                      ),
                    ]),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: _tabController,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 24,
                        top: 18,
                        right: 24,
                      ),
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 18,
                          mainAxisSpacing: 90,
                          crossAxisCount: 2,
                        ),
                        itemCount: produk.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {},
                            child: Wrap(
                              children: [
                                ClipRRect(
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                        left: 30,
                                        right: 30,
                                        top: 22,
                                        bottom: 22),
                                    height: 164,
                                    width: 180,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: Image.asset(
                                      produk[index].assetName,
                                      height: 120,
                                      width: 120,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ListTile(
                                          title: Text(
                                            detail[index],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          subtitle: Text(
                                            harga[index],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xFF264ECA)
                                              ),
                                          ))
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Column(
                        children: const [
                          Text("Tab2"),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Column(
                        children: const [
                          Text("Tab3"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  }
