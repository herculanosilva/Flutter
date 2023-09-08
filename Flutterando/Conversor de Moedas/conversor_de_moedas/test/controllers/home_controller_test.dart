import 'package:conversor_de_moedas/app/controllers/home_controller.dart';
import 'package:conversor_de_moedas/app/models/currency_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final TextEditingController toText = TextEditingController();
  final TextEditingController fromText = TextEditingController();
  final homeController = HomeController(toText: toText, fromText: fromText);

  test('deve converter de real para dolar com virgula', () {
    toText.text = '2,0';
    homeController.converter();
    expect(fromText.text, '0.36');
  });
  test('deve converter de real para dolar com ponto', () {
    toText.text = '2.0';
    homeController.converter();
    expect(fromText.text, '0.36');
  });
  test('deve converter de dolar para real', () {
    toText.text = '1.0';
    homeController.toCurrency = CurrencyModel(
      name: 'Dolar', real: 4.68, dolar: 1.0, euro: 0.93, bitcoin: 0.000039
    );
    homeController.fromCurrency = CurrencyModel(
      name: 'Real', real: 1.0, dolar: 0.20, euro: 0.19, bitcoin: 0.0000078
    );
    homeController.converter();
    expect(fromText.text, '4.68');
  });
}