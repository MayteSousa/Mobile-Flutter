import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _titulo(),
      body: _corpo(),

    );
  }

  _titulo() {
    return AppBar(
      title: Text("Vagas de Emprego TI"),
      centerTitle: true,
      backgroundColor: Colors.deepPurple,
    );
  }

  _texto(String vtexto) {
    return Container(

      child: Text(
      vtexto,
      style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.normal,
          decorationStyle: TextDecorationStyle.wavy),
    ),);
  }

  _subtitulo(String vtexto) {
    return Text(
      vtexto,
      style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
          decorationColor: Colors.red,
          decorationStyle: TextDecorationStyle.wavy),
    );
  }


  _foto(String nomeFoto) {
    return Image.asset(
      "assets/images/$nomeFoto",
      height: 150,
      width: 150,
      fit: BoxFit.cover,
    );
  } //_foto

  _corpo() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            height: 250,
            color: Colors.blue [300],
            child: Center (
                child:
                _texto('Desenvolvedor Back-End\n Salário: R\$ 3,5 mil por mês\nDescrição: Habilidades\nJavaScript, Node.js, PostgreSQL, TypeScript\nContato: contato@tenteoutravez.com.br'),
            ),
          ),
          Container(
            height: 250,
            color: Colors.blue[300],
            child: Center (
              child: _texto('Engenheiro de Dados\nSalário: R\$10.000 por mês\nDescrição: Experiência em Extração, \nPadronização e Carga de dados (ETL).\nContato: contato@tenteoutravez.com.br'),
            ),
          ),
        ],
      ),
    );
  }

}