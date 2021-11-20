import 'package:flutter/material.dart';
import 'Home.dart';

class Pessoal extends StatelessWidget {
  const Pessoal({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pessoal'),
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
              _subtitulo('Maytê Araujo'),
              _texto('\n Nacionalidade: Brasileira\n Naturalidade: Mineira \n Residente: Praia Grande/SP\n Passatempos: leitura, música, caminhada\n Livro: A Menina que Roubava Livros \n Atividade Física: Pilates \n Quer aprender: Dancar e Nadar\n Desejo: Conhecero o Brasil\n Aperfeiçoar: Pilates e Meditação\n'),
             /* RaisedButton(
                child: Text('Voltar'),
                onPressed: () => _onClickVoltar(context),
              ),*/
            ],
      ),
    );
  }
 
  _onClickVoltar(BuildContext context) {
    Navigator.pop(context, Home());
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

  _foto(){
  return Center(
    child: Image.network('https://blogpilates.com.br/wp-content/uploads/2016/10/dia-das-crian%C3%A7as-capa.jpg',
    height: 150,
    width: 150,
    ),
  );
  }

}