import 'package:flutter/material.dart';
import 'package:mobile_flutter/shared/headers.dart';

class ListPesananView extends StatefulWidget {
  const ListPesananView({
    super.key,
  });

  @override
  State<ListPesananView> createState() => _ListPesananViewState();
}

class _ListPesananViewState extends State<ListPesananView> with SingleTickerProviderStateMixin {
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
              customHeader(
                context,
                title: 'Pesanan',
                content: Image(
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fill,
                  image: const AssetImage('assets/images/diskon.png')
                ),
              ),

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
                        )
                      ),
                    ),
                    Tab(
                      child: Text('Dikirim',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        )
                      ),
                    ),
                    Tab(
                      child: Text('Diterima',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        )
                      ),
                    ),
                    Tab(
                      child: Text('Dibatalkan',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        )
                      ),
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
                      )
                    ),
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
                      )
                    ),
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
                      )
                    ),
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
                      )
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
