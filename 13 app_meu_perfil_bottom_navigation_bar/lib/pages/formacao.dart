import 'package:flutter/material.dart';

class Formacao extends StatelessWidget {
  const Formacao({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: Text('Formação Escolar'),
      ),
      body: _body(context),
    );
  }
 
  _body(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[        
              _texto('Análise e Desenvolvimento de Sistemas \n Instituição: Fatec Praia Grande - Cursando 6º Ciclo - Período Noturno\n Ano de Conclusão: julho / 2022\n'),
              _texto('Tecnologia em Automação Industrial \n Instituição: Instituto Federal de São Paulo Campus Cubatão \n Ano de conclusão: 2011 \n'),
              _texto('Técnico em Informática com Ênfase em Desenvolvimento de Sistemas \n Comerciais e Banco de Dados \n Instituição: Instituto Federal de São Paulo Campus Cubatão \n Ano de conclusão: 2003\n'),
          /*RaisedButton(
            child: Text('Voltar'),
            onPressed: () => _onClickVoltar(context),
          ),*/          
        ],
      ),
    );
  }
 
  _onClickVoltar(BuildContext context) {
    Navigator.pop(context, "Voltar");
  }

  _texto(String vtexto) {
    return Container(
      child: Text(
      vtexto,
      style: TextStyle(
          color: Colors.green,
          fontSize: 20,
          fontWeight: FontWeight.normal,
          decorationStyle: TextDecorationStyle.wavy),
    ),);
  }

  _subtitulo(String vtexto) {
    return Text(
      vtexto,
      style: TextStyle(
          color: Colors.greenAccent,
          fontSize: 18,
          fontWeight: FontWeight.bold,
          decorationColor: Colors.red,
          decorationStyle: TextDecorationStyle.wavy),
    );
  }
  
}