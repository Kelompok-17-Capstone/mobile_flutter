import 'package:flutter/material.dart';
import 'package:mobile_flutter/models/orders_model.dart';
import 'package:mobile_flutter/shared/format_rupiah.dart';
import 'package:mobile_flutter/shared/headers.dart';
import 'package:mobile_flutter/views/dashboard/pages/provider/orders_provider.dart';
import 'package:provider/provider.dart';

class ListPesananView extends StatefulWidget {
  const ListPesananView({
    super.key,
  });

  @override
  State<ListPesananView> createState() => _ListPesananViewState();
}

class _ListPesananViewState extends State<ListPesananView> with SingleTickerProviderStateMixin {
  late TabController tabController;
  final List status = [
    'dikemas',
    'dikirim',
    'diterima',
    'dibatalkan'
  ];

  @override
  void initState() {
    // Specifies number of Tabs here
    tabController = TabController(length: 4, vsync: this);
    super.initState();
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((timeStamp) {
      Provider.of<OrdersProvider>(context, listen: false).getOrders(status: 'dikemas');
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<OrdersModel> orders = Provider.of<OrdersProvider>(context).orders;

    return Scaffold(
      backgroundColor: const Color(0xffF4F4F4),
      body: SafeArea(
        child: Padding(
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
                  onTap: (value) {
                    Provider.of<OrdersProvider>(context, listen: false).getOrders(status: status[tabController.index]);
                  },
                  controller: tabController,
                  labelColor: const Color(0xff264ECA), //<-- selected text color
                  unselectedLabelColor: const Color(0xff7D828C),
                  indicatorColor: const Color(0xff264ECA),
                  tabs: const [
                    Tab(
                      child: Text(
                        'Dikemas',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        )
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Dikirim',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        )
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Diterima',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        )
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Dibatalkan',
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
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: orders.isNotEmpty
                    ? ListView.builder(
                      itemCount: orders.length,
                      itemBuilder: (context, index) {
                        final OrdersModel order = orders[index];
                        return ListTile(
                          title: Text('Order ID: ${order.id}'),
                          subtitle: Column(
                            children: [
                              Text('Alamat pengiriman: ${order.address}'),
                              Row(
                                children: [
                                  const Text('Total belanja: '),
                                  Text(formatRupiah(order.totalPrice))
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    )
                    : Column(
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
                            color: Colors.grey
                          ),
                        ),
                      ],
                    )
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
