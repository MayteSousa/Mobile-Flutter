import 'package:flutter/material.dart';

class Experiencia extends StatelessWidget {
  const Experiencia({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Experiência Profissional'),
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
          _texto('Empresa: Prefeitura Municipal de Praia Grande\n Função: Agente Administrativo\n Período: 03/2013 \n'),
          _texto('Empresa: Tivit\n Função: Teleatentedente\n Período: 01/2012 à 06/2012\n'),
          _texto('Empresa: Prefeitura Municipal de Praia Grande\n Função: Recepcionista\n Período: 05/2008 à 05/2010\n'),
          _texto('Empresa: Associação Cubatense de Defesa dos Direitos das Pessoas Deficientes\n Função: Monitora e Instrutora de Informática\n Período: 08/2003 à 05/2008\n'),

         /* RaisedButton(
            child: Text('Voltar'),
            onPressed: () => _onClickVoltar(context),
          ),    */      
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