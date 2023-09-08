import 'package:conversor_de_moedas/app/models/currency_model.dart';
import 'package:flutter/material.dart';

class HomeController {
  // List<CurrencyModel> currencies;
  
  final TextEditingController toText;
  final TextEditingController fromText;
   List<CurrencyModel> currencies = [];

  late CurrencyModel toCurrency;
  late CurrencyModel fromCurrency;

  HomeController({required this.toText, required this.fromText}){
    currencies = CurrencyModel.getCurrencies();
    toCurrency = currencies[0];
    fromCurrency = currencies[1];
  }

// pega o texto que foi digitado, converter ele para double 

  void converter() {
    String text = toText.text;
    double value = double.tryParse(text.replaceAll(',', '.')) ?? 1.0;
    double returnValue = 0;

    if (fromCurrency.name == 'Real') {
      returnValue = value * toCurrency.real;
    } else if (fromCurrency.name == 'Dolar') {
      returnValue = value * toCurrency.dolar;
    } else if (fromCurrency.name == 'Euro') {
      returnValue = value * toCurrency.euro;
    } else if (fromCurrency.name == 'bitcoin') {
      returnValue = value * toCurrency.bitcoin;
    }

    // Converte para string
    fromText.text = returnValue.toStringAsFixed(2);
  }


}

