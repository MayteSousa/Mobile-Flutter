/*
O cálculo básico para se descobrir se o álcool é vantajoso ou não em relação à gasolina é simples. Basta dividir o preço do litro do etanol pelo da gasolina. Se o resultado for inferior ou igual a 0,7, o derivado da cana-de-açúcar é o melhor para abastecer. Se for maior que 0,7, então a gasolina é melhor.
 */

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //CAIXA DE TEXTO PARA RECEBER O PREÇO DO ALCOOL E GASOLINA ATUAL
  TextEditingController alcoolController = TextEditingController();
  TextEditingController gasolinaController = TextEditingController();

  String infoResultado = "Informe o Preço do Ácool e da Gasolina";

  @override
  Widget build(BuildContext context){
    return Scaffold(
    appBar: _titulo(),
      backgroundColor: Colors.white,      
      body: _body(),
    );
  }

  _titulo() {
    return AppBar(
      title: Text("Alcóol ou Gasolina???"),
      centerTitle: true,
      backgroundColor: Colors.green,
    );
  }

  _body() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),  
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget> [
          _foto(),
          _campo("Digite o preço do álcool:", alcoolController),
          _campo("Digite o preço da gasolina:", gasolinaController), 
          _botao(),
          _texto(infoResultado),
        ],
      ),
    );
  }

  _foto(){
    return Center(
      child: Image.network(
        'https://www.brasilpostos.com.br/wp-content/uploads/2013/11/gasolina-aditivada-comum-premium.png',
        height: 150,
        width: 150,
      ),
    );
  }

  _campo(labelTitulo, objController){
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: labelTitulo,
        labelStyle: TextStyle(color: Colors.green)),
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.green, fontSize: 25.0),
      controller: objController,
    );
  }
  
  _botao(){
    return Padding(
      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: Container(
        height: 50.0,
        child: RaisedButton(
          onPressed: _calcularPreco,
          child: Text("Calcular",
            style: TextStyle(color: Colors.white, fontSize: 25.0)),
          color: Colors.blue,
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

  _calcularPreco(){
    setState(() {
      double gasolina = double.parse(gasolinaController.text);
      double alcool = double.parse(alcoolController.text);

      if ( (alcool/gasolina) <= 0.7)
      {
        infoResultado = 'Alcool está mais vantajoso';
      }
      else{
        infoResultado = ( 'Gasolina está mais vantajoso');
      }
    });
  }
}