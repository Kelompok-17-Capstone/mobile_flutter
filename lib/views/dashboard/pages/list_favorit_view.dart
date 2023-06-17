import 'package:flutter/material.dart';
import 'package:mobile_flutter/shared/headers.dart';

class ListFavoritView extends StatelessWidget {
  const ListFavoritView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              customHeader(
                context,
                title: 'Favorit',
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

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:  2 ,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 10,
                    childAspectRatio: 1/1.3
                  ),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        
                      },
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: MediaQuery.of(context).size.width * 0.4,
                            color: Colors.white,
                            child: Hero(
                              tag: 'tag-$index',
                              child: const Image(image: AssetImage('assets/icons/alta_icon.png'))
                            ),
                          ),
                          const Expanded(
                            child: Text(
                              'Blue Alien Curved Monitor 34 Inch',
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12
                              ),
                            ),
                          ),
                          const Expanded(
                            child: Text(
                              'Rp5.000.000',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF264ECA)
                              ),
                            ),
                          )
                        ],
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