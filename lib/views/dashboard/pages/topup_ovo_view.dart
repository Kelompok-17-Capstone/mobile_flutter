import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_flutter/shared/buttons.dart';
import 'package:mobile_flutter/shared/custom_appbar.dart';
import 'package:mobile_flutter/shared/format_rupiah.dart';

class TopupOvoView extends StatefulWidget {
  const TopupOvoView({super.key});

  @override
  State<TopupOvoView> createState() => _TopupOvoViewState();
}

class _TopupOvoViewState extends State<TopupOvoView> {

  int selectedCardIndex = -1;

  final formKey = GlobalKey<FormState>();
  final TextEditingController amountController = TextEditingController();
  final int administrativeCost = 1000;

  List<String> cardAmounts = [
    '1000000',
    '3000000',
    '5000000',
    '10000000',
    '13000000',
    '15000000',
  ];

  Widget buildCard(int index, String amount) {
    bool isSelected = selectedCardIndex == index;
    Color borderColor = isSelected ? const Color(0XFF264ECA) : Colors.grey;
    Color fontColor = isSelected ? const Color(0XFF264ECA) : Colors.black;

    return GestureDetector(
      onTap: () {
        setState(() {
          if (selectedCardIndex == index) {
            selectedCardIndex = -1;
            amountController.text = '';
          } else {
            selectedCardIndex = index;
            amountController.text = amount;
          }
        });
      },
      child: Container(
        width: 120,
        height: 54,
        decoration: BoxDecoration(
          border: Border.all(
            color: borderColor,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: Text(
            formatRupiah(int.parse(amount)),
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: fontColor,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: customAppBar(context, title: 'Top Up', isBackButton: true, isElevated: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Jumlah Top Up (Rp)',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
                  ),
                  const Divider(),
                  const SizedBox(height: 10),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            
                        children: [
                          buildCard(0, cardAmounts[0]),
                          buildCard(1, cardAmounts[1]),
                          buildCard(2, cardAmounts[2]),
                        ],
                      ),
                      const SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buildCard(3, cardAmounts[3]),
                          buildCard(4, cardAmounts[4]),
                          buildCard(5, cardAmounts[5]),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Divider(),
                ],
              ),
            ),

            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Masukkan Jumlah (Rp)',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
                  ),
                  Form(
                    key: formKey,
                    child: TextFormField(
                      controller: amountController,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      onChanged: (value) {
                        setState(() {
                          // empty setState
                        });
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Mohon masukan jumlah saldo';
                        }
                        if (int.parse(value) < 200000) {
                          return 'Minimal top-up saldo Rp200.000';
                        }
                        if (int.parse(value) > 20000000) {
                          return 'Maksimum top-up saldo Rp20.000.000';
                        }
                        
                      },
                      style: const TextStyle(
                        color: Color(0XFF264ECA),
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                      decoration: InputDecoration(
                        prefixIcon: const Text('Rp. ', style: TextStyle(color: Color(0XFF264ECA), fontSize: 24, fontWeight: FontWeight.w500)),
                        prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
                        border: InputBorder.none,
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: const Color(0XFF264ECA).withOpacity(0.5))
                        ),
                        hintText: '0',
                        hintStyle: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Pembayaran',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Image.asset('assets/icons/OVO.png'),
                      const SizedBox(width: 12),
                      const Text(
                        'Top Up dengan OVO',
                        style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Jumlah Pembayaran',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Top Up Saldo',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        formatRupiah(amountController.text.isEmpty ? 0 : int.parse(amountController.text)),
                        style: const TextStyle(fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Biaya Admin',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        formatRupiah(administrativeCost),
                        style: const TextStyle(fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        formatRupiah(amountController.text.isEmpty ? 0 : int.parse(amountController.text) + administrativeCost),
                        style: const TextStyle(
                          color: Color(0XFF264ECA),
                          fontWeight: FontWeight.w500
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 90),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: fullWidthButton(
                label: 'Bayar Sekarang',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    print('success');
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
