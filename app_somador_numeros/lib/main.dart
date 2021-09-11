import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController n1Controller = TextEditingController();
  TextEditingController n2Controller = TextEditingController();
String infoResultado = "";

void _calcular(){
  setState(() {
    double n1 = double.parse(n1Controller.text);
    double n2 = double.parse(n2Controller.text);

    double resultado = n1 + n2;

    infoResultado = 'Resultado: $resultado';
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Somador de Números"),
        centerTitle: true,
        backgroundColor: Colors.purpleAccent,
      ),
      backgroundColor: Colors.deepPurpleAccent,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Digite o 1º Número:",
                labelStyle: TextStyle(color: Colors.white),
                ),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white, 
                  fontSize:25.0,
                  ),
                  controller: n1Controller,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Digite o 2º Número:",
                labelStyle: TextStyle(color: Colors.white),
                ),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white, 
                  fontSize:25.0,
                  ),
                  controller: n2Controller,
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: Container(
                height: 50.0,
                child: RaisedButton(
                  onPressed: _calcular,
                    child: Text(
                      "Calcular",
                      style: TextStyle(color: Colors.blueAccent,fontSize: 20.0)                      
                    ),
                    color: Colors.white,
                ),
              ),
            ),
            Text(
              infoResultado,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.red[200], fontSize: 25.0),
            )
          ],
        ),
      ),
    );
  }
}