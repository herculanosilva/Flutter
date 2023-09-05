class CurrencyModel {
  final String name;
  final double real;
  final double dolar;
  final double euro;
  final double bitcoin;

  CurrencyModel({required this.name, required this.real, required this.dolar, required this.euro, required this.bitcoin});

static List<CurrencyModel> getCurrencies() {
  return <CurrencyModel>[
    CurrencyModel(name: 'Real', real: 1.0, dolar: 0.20, euro: 0.19, bitcoin: 0.0000078),
    CurrencyModel(name: 'Dolar', real: 4.68, dolar: 1.0, euro: 0.93, bitcoin: 0.000039),
    CurrencyModel(name: 'Euro', real: 5.34, dolar: 1.07, euro: 1.0, bitcoin: 0.000042),
    CurrencyModel(name: 'Bitcoin', real: 128.013, dolar: 25.732, euro: 23.966, bitcoin: 1.0)
  ];
}

}