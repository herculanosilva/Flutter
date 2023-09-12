import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  @override
  Widget build(BuildContext context) {

    List quiz = [
      {
        "pergunta":"Quem descobriu o brasil",
        "respostas": [
          "Dom Pedro 1",
          "Pedro Alvares Cabral",
          "Tiradentes",
          "Dom Pedro 2",
        ],
        "alternativa_correta":2
      }
    ];

    quiz.add(
      {
      "pergunta":"Flutter é",
        "respostas": [
          "Uma liguagem",
          "Aplicativo",
          "Um SDK",
          "Um notebook",
        ],
        "alternativa_correta":3
      }
    );
    print('dados do quiz'); 
    print(quiz); 

    int perguntaNumero = 1;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Quiz - Curso de Flutter'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Text('Pergunta $perguntaNumero de 10', style: TextStyle(fontSize: 20))),
                
              Text('Pergunta :\n\n' + quiz[perguntaNumero -1]['pergunta'], 
              
              style: TextStyle(fontSize: 20)),
              
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    print('precionado 1');
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.fromLTRB(100, 20, 100, 20),
                  ),
                  child: Text(
                    quiz[perguntaNumero -1]['respostas'][0],
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
        
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    print('precionado 2');
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.fromLTRB(100, 20, 100, 20),
                  ),
                  child: Text(
                    quiz[perguntaNumero -1]['respostas'][1],
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
        
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    print('precionado 3');
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.fromLTRB(100, 20, 100, 20),
                  ),
                  child: Text(
                    quiz[perguntaNumero -1]['respostas'][2],
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
        
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    print('precionado 4');
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.fromLTRB(100, 20, 100, 20),
                  ),
                  child: Text(
                    quiz[perguntaNumero -1]['respostas'][3],
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
