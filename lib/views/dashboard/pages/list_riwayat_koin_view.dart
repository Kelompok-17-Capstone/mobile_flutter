import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile_flutter/models/coin_model.dart';
import 'package:mobile_flutter/shared/format_rupiah.dart';
import 'package:mobile_flutter/shared/headers.dart';
import 'package:mobile_flutter/views/dashboard/pages/provider/coin_provider.dart';
import 'package:provider/provider.dart';

class ListRiwayatKoin extends StatefulWidget {
  const ListRiwayatKoin({super.key});

  @override
  State<ListRiwayatKoin> createState() => _ListRiwayatKoinState();
}

class _ListRiwayatKoinState extends State<ListRiwayatKoin> {

  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((timeStamp) {
      Provider.of<CoinProvider>(context, listen: false).getHistory();
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<CoinModel> history = Provider.of<CoinProvider>(context, listen: false).history;
    final CoinState state = Provider.of<CoinProvider>(context).state;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              customHeader(
                context,
                title: 'Koin',
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
              Container(
                height: 48,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: const Center(
                  child: Text(
                    'Klaim Sekarang',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500
                    ),
                  )
                ),
              ),
              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: state == CoinState.loading
                ? CircularProgressIndicator(color: const Color(0xFF264ECA).withOpacity(0.8))
                : ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: history.length,
                  itemBuilder: (context, index) {
                    final CoinModel item = history[index];
                    final date = DateFormat('dd-MM-yyyy').format(DateTime.parse(item.date));
                    final String total = formatRupiah(item.total);
                    return ListTile(
                      isThreeLine: true,
                      leading: Icon(
                        Icons.monetization_on_outlined,
                        color: item.status == 'increase' ? Colors.orange : Colors.grey[350], 
                        size: 40
                      ),
                      title: Text(
                        item.status == 'increase' ? 'Diperoleh $date' : 'Ditukar $date',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF264ECA)
                        ),
                      ),
                      subtitle: item.status == 'increase'
                      ? const Text('Cashback 1% koin dari topup')
                      : const Text('Pembelian produk'),
                      trailing: Text(
                        item.status == 'increase' ? '+ $total' : '- $total',
                        style: TextStyle(
                          color: item.status == 'increase' ? Colors.orange : Colors.grey[350]
                        ),
                      ),
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