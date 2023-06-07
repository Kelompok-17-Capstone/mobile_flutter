import 'package:flutter/material.dart';

class CartView extends StatefulWidget {
  const CartView({Key? key});

  @override
  _CartViewState createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  bool isCheckedall = false;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(
            'assets/icons/back.png',
            width: 24,
            height: 24,
          ),
        ),
        title: Text(
          'Keranjang',
          style: TextStyle(
            color: Colors.black.withOpacity(0.9),
            fontWeight: FontWeight.w600,
            fontSize: 18,
            letterSpacing: 0.3,
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: CatalogProducts(),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          decoration: BoxDecoration(color: Colors.white,
        boxShadow: [
          BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5, 
                  blurRadius: 7, 
                  offset: Offset(0, 2), 

               ),
        ]),
            
          width: 428,
          height: 66,
          
          child: Row(
            children: [
              Checkbox(
                value: isCheckedall,
                onChanged: (bool? value) {
                  setState(() {
                    isCheckedall = value ?? false;
                  });
                },
              ),
              const Text('Semua', style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w500
              ),),
              SizedBox(
                width:27 ,
              ),
              const Text('Total', style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w500
              ),),
              SizedBox(
                width:4 ,
              ),
              Text('Rp'+'50000000', style: TextStyle(
                color: Color.fromRGBO(0, 49, 123, 1),
                fontWeight: FontWeight.w500
              ),),
              SizedBox(
                width:8 ,
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                   
                  } ,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(38, 78, 202, 1)
                    ),
                    child: Center(
                      child: Text('Bayar',style: TextStyle(
                        color: Colors.white
                      ),),
                    ),
                              
                  ),
                ),
              )
              
            ],
          ),
        ),
      ),
    );
  }
}


class CatalogProducts extends StatelessWidget {
  const CatalogProducts({Key? key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Product.products.length,
      itemBuilder: (BuildContext context, int index) {
        return CatalogProductCard(index: index);
      },
    );
  }
}

class CatalogProductCard extends StatefulWidget {
  final int index;
  CatalogProductCard({Key? key, required this.index}) : super(key: key);

  @override
  _CatalogProductCardState createState() => _CatalogProductCardState();
}

class _CatalogProductCardState extends State<CatalogProductCard> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5, 
                  blurRadius: 7, 
                  offset: Offset(0, 2), 

               ),
        ]
      ),
      height: 142,
      width: 428,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0,10,0,0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0,25,0,0),
              child: Checkbox(
                value: isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value ?? false;
                  });
                },
              ),
            ),
            Container(
              width: 100,
              height: 100, 
              child: Image.network(
                Product.products[widget.index].imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Product.products[widget.index].nama,
                    maxLines: 2,
                    
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 16,
                    fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Rp. " + Product.products[widget.index].harga.toString(),
                    style: TextStyle(fontSize: 14),
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