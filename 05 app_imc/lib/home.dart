import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  //RECEBE PESO E ALTURA
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();

  String infoResultado = "Informe o Peso e Altura!";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _titulo(),
      backgroundColor: Colors.white,
      body: _corpo(),
    );
  }

  _titulo(){
    return AppBar(
      title: Text("Cálculo IMC"),
      centerTitle: true,
      backgroundColor: Colors.blue,
    );
  }

  _corpo(){
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget> [
          _foto(),
          _campo("Digite o Peso", pesoController),
          _campo("Digite a Altura", alturaController),
          _botao(),
          _texto(infoResultado),
        ],
      ),
    );
  }

  _foto(){
    return Center(
      child: Image.network(
        'https://images-na.ssl-images-amazon.com/images/I/51NhXAq6bsL.png',
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
        labelStyle: TextStyle(
          color: Colors.blue
        )
      ),
      textAlign: TextAlign.left,
      style: TextStyle(color: Colors.green, fontSize: 25.0),
      controller: objController,
    );
  }

  _botao(){
    return Padding(
      padding: EdgeInsets.only(top: 20.0, left:20.0),
      child: Container(
        height: 50.0,
        child: RaisedButton(
          onPressed: _calcularIMC,
          child: Text("Calcular",
            style: TextStyle(color: Colors.white, fontSize: 25.0)
          ),
          color: Colors.blue,
        ),
      ),
    );
  }

  _texto(textoParaExibir){
    return Text(
      textoParaExibir,
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.green, fontSize: 25.0)
    );
  }

  _calcularIMC(){
    setState(() {
      double peso = double.parse(pesoController.text);
      double altura = double.parse(alturaController.text);
      double IMC = 0;

      IMC = peso / (altura * altura);

      if ( IMC < 18.5 ){
        infoResultado = 'Abaixo do Peso!';
      }
      else{
        if( IMC >= 18.5 && IMC <= 24.9 ){
          infoResultado = 'Peso Normal!';
        }
        else{
          if( IMC >= 25 && IMC <= 29.9 ){
            infoResultado = 'Sobrepeso!';
          }
          else{
            if( IMC >= 30 && IMC <= 34.9 ){
              infoResultado = 'Obesidade Grau I!';
            }
            else{
              if( IMC >= 35 && IMC <= 39.9 ){
                infoResultado = 'Obesidade Grau II!';
              }
              else{
                if( IMC>40 ){
                  infoResultado = 'Obesidade Grau III \n ou \n Obesidade Morbida!';
                }
              }                
            }
          }
        }
      }

    });
  }

}//PRINCIPAL