import 'package:flutter/material.dart';
import 'dart:math';


class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  String lblTitulo = "Jogo do Nº Aleatório";
  String lblSubTitulo = "Pense em 1 número de 0 à 10";
  String infoResultado = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _titulo(lblTitulo),
      backgroundColor: Colors.white,
      body: _corpo(),
    );
  }

  _titulo(texto){
    return AppBar(
      title: Text(texto),
      centerTitle: true,
      backgroundColor: Colors.red,
    );
  }
  

_corpo(){
  return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),  
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget> [
          _foto(),
          _titulo(lblSubTitulo),           
          _texto(infoResultado),
          _botao(),
        ],
      ),
    );
}

  _foto(){
    return Center(
      child: Image.network(
        'https://thumbs.dreamstime.com/b/homem-d-com-ponto-de-interroga%C3%A7%C3%A3o-vermelho-sobre-o-fundo-branco-37519707.jpg ',
        height: 150,
        width: 150,
      ),
    );
  }

  _botao(){
    return Padding(
      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: Container(
        height: 50.0,
        child: RaisedButton(
          onPressed: _calcularNumAleatorio,
          child: Text("Calcular",
            style: TextStyle(color: Colors.white, fontSize: 25.0)),
          color: Colors.red,
          ),
      ),
    );
  }

  _texto(textoParaExibir){
    return Text(
      textoParaExibir,
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.red, fontSize: 25.0)
    );
  }

  _calcularNumAleatorio(){
    setState(() {
      int numero = new Random().nextInt(10);
      
      infoResultado = '$numero';
      
    });
  }

}//PRINCIPAL