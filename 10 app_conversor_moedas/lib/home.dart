import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController valorController = TextEditingController();
  String dropdownDe = 'De';
  String dropdownPara = 'Para';
  String resultado = '';

  void _exibirDados(){
    setState((){

      var valor = double.parse(valorController.text);
     // String de = dropdownDe;
     // String para = dropdownPara;
      double dolar = 0, real = 0, euro = 0;


      //DOLAR: dolar = 1;       euro = 0.85;    real = 5.32;
      //EURO:  dolar = 1.17;    euro = 1;       real = 6.24;
      //REAL:  dolar = 0.19;    euro = 0.16;    real = 1;

      if ((dropdownDe == 'Dólar' ) && (dropdownPara == 'Euro')){
        //CONVERSAO DE DOLAR PARA EURO
        euro = 0.85;
        valor = valor * euro;
      }
      else{
        if ((dropdownDe == 'Dólar' ) && (dropdownPara == 'Real')){
          //CONVERSAO DE DOLAR PARA REAL
          real = 5.32;
          valor = valor * real;
      }
        else{
          if ((dropdownDe == 'Euro' ) && (dropdownPara == 'Dólar')){
            //CONVERSAO DE EURO PARA DOLAR
            dolar = 1.17;
            valor = valor * dolar;
          }
          else{
            if ((dropdownDe == 'Euro' ) && (dropdownPara == 'Real')){
              //CONVERSAO DE EURO PARA REAL
              real = 6.24;
              valor = valor * real;
            }
            else{
              if ((dropdownDe == 'Real' ) && (dropdownPara == 'Dólar')){
                //CONVERSAO DE REAL PARA DOLAR
                dolar = 0.19;
                valor = valor * dolar;

              }
              else{
                if ((dropdownDe == 'Real' ) && (dropdownPara == 'Euro')){
                  //CONVERSAO DE REAL PARA EURO
                  euro = 0.16;
                  valor = valor * euro;
                }
                else{
                  //erro de conversao
                  resultado = "Escolha as moedas para conversão";
                }
              }
            }
          }
        }
      }
      resultado = "Resultado: \n$valor";
    });
  }//_exibirDados

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _titulo(),
      backgroundColor: Colors.white,
      body: _corpo(),
    );
  }

  _corpo(){
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget> [
          _campo("Valor:", valorController),
          _dropdownDe(),
          _dropdowndPara(),
          _botao(),
          _texto2(resultado),
        ],
      ),
    );
  }

  _titulo(){
    return AppBar(
      title: Text("Conversor de Moedas:\nDólar, Real e Euro"),
      centerTitle: true,
      backgroundColor: Colors.green,
    );
  }

  _campo(labelTitulo, objController) {
    return TextField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          labelText: labelTitulo,
          labelStyle: TextStyle(color: Colors.green)
      ),
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.green, fontSize: 25.0),
      controller: objController,
    );
  }

  _dropdownDe() {
    return DropdownButton<String>(
      value: dropdownDe,
      style: const TextStyle(color: Colors.green, fontSize: 25.0),
      items: <String>['De', 'Dólar', 'Euro', 'Real']
          .map((String valueDe) {
        return DropdownMenuItem<String>(
          value: valueDe,
          child: Text(valueDe),
        );
      }).toList(),
      onChanged: (String? valorSelecionadoDe) {
        setState(() {
          dropdownDe = valorSelecionadoDe!;
        });
      },
    );
  }

  _dropdowndPara() {
    return DropdownButton<String>(
      value: dropdownPara,
      style: const TextStyle(color: Colors.green, fontSize: 25.0),
      items: <String>['Para', 'Dólar', 'Euro', 'Real']
          .map((String valuePara) {
        return DropdownMenuItem<String>(
          value: valuePara,
          child: Text(valuePara),
        );
      }).toList(),
      onChanged: (String? valorSelecionadoPara) {
        setState(() {
          dropdownPara = valorSelecionadoPara!;
        });
      },
    );
  }//Dropdownpara

  _texto(double valor){
    return Text(
      valor.toStringAsPrecision(3),
      style: TextStyle(
          color: Colors.green,
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
          decorationStyle: TextDecorationStyle.wavy),
    );
  }//texto

  _texto2(String valor){
    return Text(
      valor,
      style: TextStyle(
          color: Colors.green,
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
          decorationStyle: TextDecorationStyle.wavy),
    );
  }//texto

  _botao(){
    return Padding(
      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: Container(
        height: 50.0,
        child: RaisedButton(
          onPressed: _exibirDados,
          child: Text("Converter",
              style: TextStyle(color: Colors.white, fontSize: 25.0)),
          color: Colors.blue,
        ),
      ),
    );
  }//botao


} //CLASS