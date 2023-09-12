import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Quiz - Curso de Flutter'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const FlutterLogo(size: 300),
              ElevatedButton(
                onPressed: (){
                  print('precionado');
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.fromLTRB(100, 20, 100, 20),
                ), 
                child: const Text('Jogar', style: TextStyle(fontSize: 50),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}