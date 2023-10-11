import 'package:flutter/material.dart';
import 'package:quiz/resultados.dart';
// import 'package:quiz/data/questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int perguntaNumero = 1;
  int acertos = 0;
  int errors = 0;
  List quiz = List.from(questions);

  @override
  Widget build(BuildContext context) {
    quiz.shuffle();

    quiz.forEach((element) {
      int alternativaCorreta = element['alternativa_correta'];
      List respostas = element['respostas'];
      String respostaCorreta = element['respostas'][alternativaCorreta - 1];

      respostas.shuffle();

      int i = 1;
      respostas.forEach((element) {
        if (element == respostaCorreta) {
          alternativaCorreta = i;
        }
        i++;
      });
      element['alternativa_correta'] = alternativaCorreta;
    });

    void respondeu(int respostaNumero) {
      setState(() {
        if (quiz[perguntaNumero - 1]['alternativa_correta'] == respostaNumero) {
          print('acertou');
          acertos++;
        } else {
          print('errou');
          errors++;
        }

        if (perguntaNumero == 10) {
          Navigator.pushNamed(context, 'Resultado',
              arguments: Argumentos(acertos));
        } else {
          perguntaNumero++;
        }
      });
    }

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Center(child: Text('Quiz')),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Align(
                      alignment: Alignment.topRight,
                      child: Text('Pergunta $perguntaNumero de 10',
                          style: TextStyle(fontSize: 20))),
                  Text(quiz[perguntaNumero - 1]['pergunta'],
                      style: TextStyle(fontSize: 20)),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        respondeu(1);
                      },
                      child: Text(
                        quiz[perguntaNumero - 1]['respostas'][0],
                        style: TextStyle(fontSize: 20),
                      ),
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.fromLTRB(5, 20, 5, 20)),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        respondeu(2);
                      },
                      child: Text(
                        quiz[perguntaNumero - 1]['respostas'][1],
                        style: TextStyle(fontSize: 20),
                      ),
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.fromLTRB(5, 20, 5, 20)),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        respondeu(3);
                      },
                      child: Text(
                        quiz[perguntaNumero - 1]['respostas'][2],
                        style: TextStyle(fontSize: 20),
                      ),
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.fromLTRB(5, 20, 5, 20)),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        respondeu(4);
                      },
                      child: Text(
                        quiz[perguntaNumero - 1]['respostas'][3],
                        style: TextStyle(fontSize: 20),
                      ),
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.fromLTRB(5, 20, 5, 20)),
                    ),
                  ),
                ]),
          )),
    );
  }
}