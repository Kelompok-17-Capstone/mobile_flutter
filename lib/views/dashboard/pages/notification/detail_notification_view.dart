import 'package:flutter/material.dart';
import 'package:mobile_flutter/shared/buttons.dart';

class DetailNotificationView extends StatelessWidget {
  final String date;
  final String message;

  const DetailNotificationView({super.key, required this.date, required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 253,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Color(0xFF2649CA),
                          Colors.black,
                        ],
                      )
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Image(
                          image: AssetImage('assets/icons/alta_icon_white.png'),
                        ),
                        Text(
                          'Alta Tech',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w500,
                            color: Colors.white
                          ),
                        )
                      ],
                    ),
                  ),
                  AppBar(
                    leading: customBackButton(context, color: Colors.white),
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(date),
                    const Divider(),
                    Text(message)
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