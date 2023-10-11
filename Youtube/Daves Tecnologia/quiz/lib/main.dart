import 'package:flutter/material.dart';
import 'package:quiz/homepage.dart';
import 'package:quiz/quiz.dart';
import 'package:quiz/resultados.dart';

void main() {
  // runApp(const Resultado(acertos: 9));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: '/', routes: {
      '/': (context) => const HomePage(),
      'Quiz': (context) => const Quiz(),
      Resultado.routerName: (context) => const Resultado(),
    });
  }
}
