import 'package:conversor_de_moedas/app/components/currency_box.dart';
import 'package:conversor_de_moedas/app/controllers/home_controller.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  // const HomeView({super.key});
  const HomeView({Key? key}) : super(key: key);
  
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController toText = TextEditingController();

  final TextEditingController fromText = TextEditingController();
  late HomeController homeController;

  @override
  void initState() {
    super.initState();
    homeController = HomeController(toText: toText, fromText: fromText);
  } 
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
            CurrencyBox(
              selectedItem: homeController.toCurrency,
              controller: toText,
              items: homeController.currencies,
              onChanged: (model) {
                setState(() {
                  homeController.toCurrency = model;
                });
              },
              ),
            SizedBox(height: 10),
            CurrencyBox(
              selectedItem: homeController.fromCurrency,
              controller: fromText,
              items: homeController.currencies,
              onChanged: (model) {
                setState(() {
                  homeController.fromCurrency = model;
                });
              },
            ),
            SizedBox(height: 50),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
              ),
              onPressed: () {
                homeController.converter();
              }, 
              child: const Text('Converter'),
            )
            ],
          ),
        ),
      ),
    );
  }
}