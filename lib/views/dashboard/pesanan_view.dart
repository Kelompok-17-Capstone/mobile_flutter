import 'package:flutter/material.dart';
import '../../main.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: ThemeData());
  }
}

class Pesanan extends StatefulWidget {
  const Pesanan({
    super.key,
  });

  @override
  // ignore: no_logic_in_create_state
  State<Pesanan> createState() => _PesananState();
}

class _PesananState extends State<Pesanan> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // Specifies number of Tabs here
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF4F4F4),
        body: Padding(
          padding: const EdgeInsets.all(0),
          child: Column(
            children: [
              Container(
                color: Colors.white,
                padding: const EdgeInsets.only(top: 0),
                height: 48,
                child: TabBar(
                  controller: _tabController,

                  // HexColor('#FFFFFF'),

                  labelColor: const Color(0xff264ECA), //<-- selected text color
                  unselectedLabelColor: const Color(0xff7D828C),
                  indicatorColor: const Color(0xff264ECA),

                  tabs: const [
                    Tab(
                      child: Text('Dikemas',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          )),
                    ),
                    Tab(
                      child: Text('Dikirim',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          )),
                    ),
                    Tab(
                      child: Text('Diterima',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          )),
                    ),
                    Tab(
                      child: Text('Dibatalkan',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          )),
                    ),
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
                        child: Column(
                          children: const [
                            Image(
                              image: AssetImage('assets/images/pesanan.png'),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              'Belum ada pesanan',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey),
                            )
                          ],
                        )),
                    Padding(
                        padding: const EdgeInsets.only(
                          left: 24,
                          top: 18,
                          right: 24,
                        ),
                        child: Column(
                          children: const [
                            Image(
                              image: AssetImage('assets/images/pesanan.png'),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              'Belum ada pesanan',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey),
                            )
                          ],
                        )),
                    Padding(
                        padding: const EdgeInsets.only(
                          left: 24,
                          top: 18,
                          right: 24,
                        ),
                        child: Column(
                          children: const [
                            Image(
                              image: AssetImage('assets/images/pesanan.png'),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              'Belum ada pesanan',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey),
                            )
                          ],
                        )),
                    Padding(
                        padding: const EdgeInsets.only(
                          left: 24,
                          top: 18,
                          right: 24,
                        ),
                        child: Column(
                          children: const [
                            Image(
                              image: AssetImage('assets/images/pesanan.png'),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              'Belum ada pesanan',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey),
                            )
                          ],
                        )),
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
