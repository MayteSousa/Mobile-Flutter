import 'package:flutter/material.dart';

class Multiplicador extends StatefulWidget {
  const Multiplicador({ Key? key }) : super(key: key);

  @override
  _MultiplicadorState createState() => _MultiplicadorState();
}

class _MultiplicadorState extends State<Multiplicador> {
  TextEditingController n1Controller = TextEditingController();
  TextEditingController n2Controller = TextEditingController();
String infoResultado = "";

void _calcular(){
  setState(() {
    double n1 = double.parse(n1Controller.text);
    double n2 = double.parse(n2Controller.text);

    double resultado = n1 * n2;

    infoResultado = 'Resultado: $resultado';
  },
  );
}

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _barra_titulo(),
      body: _tela_app(),
      backgroundColor: Colors.deepPurpleAccent,    
    );
}

_barra_titulo(){
  return AppBar(
    title: Text("Multiplicador de Números"),
    centerTitle: true,
    backgroundColor: Colors.purpleAccent,
  );
}

_tela_app(){
  return SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _foto(),
            _campo01(),
            _campo02(),
            _botao(),
            _resultado(),
          ],
        ),
  );
}


_foto(){
  return Center(
    child: Image.network('https://thumbs.dreamstime.com/z/mande-uma-ideia-multiplicar-o-%C3%ADcone-do-sinal-isolado-na-mascote-129605632.jpg',
    height: 150,
    width: 150,
    ),
  );
}

/*
_foto() {
    return Center(
      child: Image.network(
        'https://s2.glbimg.com/fLLjtcmosminFpbQVwWjJ6qEdNU=/512x320/smart/e.glbimg.com/og/ed/f/original/2015/09/10/ads_macgyver1.jpg',
        height: 150,
        width: 150,
      ),
    );
  }

 */

_campo01(){
   return TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Digite o 1º Número:",
                labelStyle: TextStyle(
                  color: Colors.white
                  ),
                ),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white, 
                  fontSize:25.0,
                  ),
                  controller: n1Controller,
            );
 }
_campo02(){
  return TextField(
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
            );
}
_botao(){
  return Padding(
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
            );
}
_resultado(){
  return Text(
    infoResultado,
    textAlign: TextAlign.center,
    style: TextStyle(
      color: Colors.red[200], 
      fontSize: 25.0
    ),
  );
}
}