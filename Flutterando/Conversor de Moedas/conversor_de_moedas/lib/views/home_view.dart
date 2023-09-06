import 'package:conversor_de_moedas/app/components/currency_box.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.only(
          left: 30,
          top: 100,
          right: 30,
          bottom: 20,
          ),
          child: Column(
            children: [
              Image.asset('assets/images/logo.png', 
              width: 100,
              height: 100,
              ),
            SizedBox(height: 50),
            CurrencyBox(),
            SizedBox(height: 10),
            CurrencyBox(),
            SizedBox(height: 50),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
              ),
              onPressed: () {}, 
              child: const Text('Converter'),
            )
            ],
          ),
        ),
      ),
    );
  }
}