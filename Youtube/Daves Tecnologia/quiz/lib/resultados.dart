import "package:flutter/material.dart";

class Resultado extends StatelessWidget {
  const Resultado({super.key, required this.acertos});

  final int acertos;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Quiz - Curso de Flutter'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text('Resultado', style:  TextStyle(fontSize: 20)),
                Center(
                  child: Text('Você acertou \n $acertos de 10 perguntas', style:  TextStyle(fontSize: 20))
                  ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: (){
                      print('precionado');
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                    ), 
                    child: const Text('Jogar novamente', style: TextStyle(fontSize: 30),),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}