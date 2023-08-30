import 'package:flutter/material.dart';

main(){
  runApp(AppWidget(title: 'Flutterando'));
  }

class AppWidget extends StatelessWidget{
  final String title;

  const AppWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return HomePageState();
  }
}

class HomePageState extends State<HomePage>{
  int counter = 0;

  @override
  Widget build(BuildContext context) {
  return Container(
        child: Center(child: GestureDetector(
          child: Text('Contador interativo : $counter'), 
          onTap: (){
          setState(() {
            counter++;
          });
        },)),
  );
  }

}