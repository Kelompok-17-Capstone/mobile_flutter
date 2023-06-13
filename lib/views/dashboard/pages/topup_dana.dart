import 'package:flutter/material.dart';
import 'package:mobile_flutter/shared/buttons.dart';
import 'package:mobile_flutter/shared/custom_appbar.dart';
import 'package:mobile_flutter/views/dashboard/home_view.dart';

class TopupDana extends StatefulWidget {
  const TopupDana({Key? key});

  @override
  State<TopupDana> createState() => _TopupDanaState();
}

class _TopupDanaState extends State<TopupDana> {
  int selectedCardIndex = -1;
  TextEditingController amountController = TextEditingController();
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
    Color borderColor =
        isSelected ? Color.fromRGBO(38, 78, 202, 1) : Colors.black;
    Color fontColor =
        isSelected ? Color.fromRGBO(38, 78, 202, 1) : Colors.black;

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
        width: 106,
        height: 54,
        decoration: BoxDecoration(
          border: Border.all(
            color: borderColor,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: Text(
            amount,
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
    int topUp = 0;
    int admin = 1000;
    int amount = 0;
    try {
      amount = int.parse(amountController.text);
    } catch (e) {
      amount = 0;
    }
    bool isButtonEnabled = amountController.text.isNotEmpty;

    int total = amount + admin;
    return Scaffold(
      appBar: customAppBar(context,
          title: 'Top Up', isBackButton: true, isElevated: true),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(24, 16, 0, 0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Jumlah Top Up (Rp)',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      buildCard(0, cardAmounts[0]),
                      SizedBox(width: 10.0),
                      buildCard(1, cardAmounts[1]),
                      SizedBox(width: 10.0),
                      buildCard(2, cardAmounts[2]),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    children: [
                      buildCard(3, cardAmounts[3]),
                      SizedBox(width: 10.0),
                      buildCard(4, cardAmounts[4]),
                      SizedBox(width: 10.0),
                      buildCard(5, cardAmounts[5]),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(24, 16, 0, 0),
              child: Column(
                children: [
                  Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Masukkan Jumlah (Rp)',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'Rp',
                        style: TextStyle(
                          color: Color.fromRGBO(38, 78, 202, 1),
                          fontWeight: FontWeight.w500,
                          fontSize: 24,
                        ),
                      ),
                      Flexible(
                        child: TextField(
                          controller: amountController,
                          style: TextStyle(
                            color: Color.fromRGBO(38, 78, 202, 1),
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '0',
                            hintStyle: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(24, 16, 0, 0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Pembayaran',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(24, 0, 0, 0),
              child: Row(
                children: [
                  Image.asset('assets/icons/Dana.png'),
                  SizedBox(
                    width: 12,
                  ),
                  const Text(
                    'Top Up dengan Dana',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                  ),
                  SizedBox(
                    width: 122,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(24, 16, 0, 0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Jumlah Pembayaran',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(24, 16, 30, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Top Up Saldo',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Text(
                    'Rp ${amountController.text}',
                    style: TextStyle(fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(24, 16, 30, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Biaya Admin',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Text(
                    'Rp ${admin}',
                    style: TextStyle(fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(24, 16, 30, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Total',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Text(
                    'Rp ${total}',
                    style: TextStyle(
                        color: Color.fromRGBO(38, 78, 202, 1),
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 90,
            ),
            fullWidthButton(
            label: 'Bayar Sekarang',
            onPressed: () {Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomePageView()));
                    },
          ),
          ],
        ),
      ),
    );
  }
}
