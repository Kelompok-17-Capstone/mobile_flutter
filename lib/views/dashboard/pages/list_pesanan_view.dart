import 'package:flutter/material.dart';
import 'package:mobile_flutter/models/order_model.dart';
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
  int currentIndex = 0;
  final List status = [
    'dikemas',
    'dikirim',
    'diterima',
  ];

  @override
  void initState() {
    // Specifies number of Tabs here
    tabController = TabController(length: 3, vsync: this);
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
    final List<OrderModel> orders = Provider.of<OrdersProvider>(context).orders;
    final OrdersState state = Provider.of<OrdersProvider>(context).ordersState;

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
                    if (value != currentIndex) {
                      Provider.of<OrdersProvider>(context, listen: false).getOrders(status: status[tabController.index]);
                      setState(() {
                        currentIndex = value;
                      });
                    }
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
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: state == OrdersState.loading
                    ? CircularProgressIndicator(color: const Color(0xFF264ECA).withOpacity(0.8))
                    : orders.isNotEmpty
                    ? ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: orders.length,
                      itemBuilder: (context, index) {
                        final OrderModel order = orders[index];
                        return ListTile(
                          title: Text(
                            'Order ID: ${order.id}',
                            maxLines: 1,
                            overflow: TextOverflow.fade,
                            softWrap: false,
                          ),
                          subtitle: Column(
                            children: [
                              Text('Alamat pengiriman: ${order.address}'),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Total belanja: ', style: TextStyle(fontWeight: FontWeight.w500)),
                                  Text(
                                    formatRupiah(order.totalPrice),
                                    style: const TextStyle(
                                      color: Color(0xff264ECA),
                                      fontWeight: FontWeight.w500
                                    ),
                                  ),
                                ],
                              ),
                              const Divider(),
                              const SizedBox(height: 10)
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
