import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../main.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: ThemeData());
  }
}

class Produk extends StatefulWidget {
  const Produk({
    super.key,
  });

  @override
  // ignore: no_logic_in_create_state
  State<Produk> createState() => _ProdukState('image');
}

class _ProdukState extends State<Produk> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final String image;

  _ProdukState(this.image);

  final List<AssetImage> produk = [
    const AssetImage("assets/produk.png"),
    const AssetImage("assets/produk1.png"),
    const AssetImage("assets/produk2.png"),
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
        backgroundColor: HexColor('#F4F4F4'),
        body: Padding(
          padding: const EdgeInsets.all(0),
          child: Column(
            children: [
              Container(
                color: HexColor('#FFFFFF'),
                padding: const EdgeInsets.only(top: 0),
                height: 40,
                child: TabBar(
                  controller: _tabController,

                  // HexColor('#FFFFFF'),
                  labelColor: HexColor('#264ECA'), //<-- selected text color
                  unselectedLabelColor: HexColor('#7D828C'),
                  indicatorColor: HexColor('#264ECA'),

                  tabs: [
                    Tab(
                      child: Text('Terbaru',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          )),
                    ),
                    Tab(
                      child: Text('Terlaris',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          )),
                    ),
                    Row(children: [
                      Text(
                        'Harga',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(width: 0),
                      const Icon(
                        Icons.unfold_more_rounded,
                        size: 18,
                      ),
                    ]),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
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
                                    decoration: BoxDecoration(
                                      color: HexColor('#FFFFFF'),
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
                                            style: GoogleFonts.poppins(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          subtitle: Text(
                                            harga[index],
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.poppins(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: HexColor('#264ECA')),
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
