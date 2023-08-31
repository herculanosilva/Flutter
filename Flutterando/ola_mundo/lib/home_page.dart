
import 'package:flutter/material.dart';
import 'package:ola_mundo/app_controller.dart';

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
  return Scaffold(
    appBar: AppBar(
      title: Text('Home Page'),
      actions: [CustomSwitch()],
      ),
    body: Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Contador: $counter'),
          Container(height: 50),
          CustomSwitch(),
          Container(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 50,
                height: 50,
                color: Colors.deepOrange,
              ),
              Container(
                width: 50,
                height: 50,
                color: Colors.deepOrangeAccent,
              ),
              Container(
                width: 50,
                height: 50,
                color: Colors.orange,
              ),
            ],
          )
        ],
      ),
    ),
    floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            counter++;
          },);
        },
      ),
  );
  }

}

class CustomSwitch extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Switch(
        value: AppController.instance.isDarkTheme, 
        onChanged: (value) {
          AppController.instance.changeTheme();
      });
  }
}