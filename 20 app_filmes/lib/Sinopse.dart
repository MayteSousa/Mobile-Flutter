import 'package:flutter/material.dart';

 
class Sinopse extends StatelessWidget {
  final String valueNome, valueDescricao;

  const Sinopse({required this.valueNome, required this.valueDescricao});


  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _titulo(),
      body: _corpo(context),
    );
  }

  _corpo(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _texto2('$valueDescricao'),
          RaisedButton(
            child: Text('Voltar'),
            onPressed: () => _onClickVoltar(context),
          ),
        ] 
      )
    );
  }
 
  _onClickVoltar(BuildContext context) {
    Navigator.pop(context);
  }

    _titulo() {
    return AppBar(
      title: Text('App de Filmes - Sinopse, $valueNome'),
      centerTitle: true,
      backgroundColor: Colors.green,
    );
  }
 
 _texto2(String valor){
    return Text(
      valor,
      style: TextStyle(
          color: Colors.green,
          fontSize: 20.0,
         // fontWeight: FontWeight.bold,
          decorationStyle: TextDecorationStyle.wavy),
    );
  }//

}