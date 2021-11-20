import 'package:flutter/material.dart';

class ContadorPessoas extends StatefulWidget {
  const ContadorPessoas({ Key? key }) : super(key: key);

  @override
  _ContadorPessoasState createState() => _ContadorPessoasState();
}

class _ContadorPessoasState extends State<ContadorPessoas> {

String infoResultado = "";

int entrou = 0, saiu = 0, total = 0;

void _calcularEntrou(){
  setState(() {
    if (total >= 0 && total <= 99 ){
      total++; 
      infoResultado = '$total';
    }
    else{
      if (total > 10 ){
        print("Limite Máximo atingido ");
      }
    }               
    
  });
}

void _calcularSaiu(){
  setState(() {
    if (total > 0){
      total--;
      infoResultado = '$total';
    }
  });
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
    title: Text("Contador de Pessoas"),
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
            //_campo01(),
            _foto(),
            _resultado(),
            _botao("Entrou"),        
            _botao2("Saiu"),                    

           // Text("Total Pessoas entraram: $entrou \n"),
           // Text("Total Pessoas sairam: $saiu \n"),
       
          ],
        ),
  );
}

_foto(){
  return Center(
    child:Image.network('https://3.bp.blogspot.com/_wKm3Bek7FNQ/SUK4JKMGY8I/AAAAAAAAA4A/7zEIFXtNVoY/s320/Tarsila+do+Amaral+-+Oper%C3%A1rios+(1933).jpg',
    height: 150,
    width: 150,
    ),
  );
}

_botao(String situacao){
  return Padding(
              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: Container(
                height: 50.0,
                child: RaisedButton(
                  onPressed: _calcularEntrou,
                    child: Text(
                      situacao,
                      style: TextStyle(color: Colors.blueAccent,fontSize: 20.0)                      
                    ),
                    color: Colors.white,
                ),
              ),
            );
}

_botao2(String situacao){
  return Padding(
              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: Container(
                height: 50.0,
                child: RaisedButton(
                  onPressed: _calcularSaiu,
                    child: Text(
                      situacao,
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

_resultado2(){
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