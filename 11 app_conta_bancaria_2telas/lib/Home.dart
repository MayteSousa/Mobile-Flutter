import 'package:flutter/material.dart';
import 'Conta.dart';
//import 'Dados.dart';

class Home extends StatelessWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
            debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: _titulo(),
        backgroundColor: Colors.white,
        body: _corpo(context),
      ),
    );
  }

  _titulo() {
    return AppBar(
      title: Text("Conta Bancária"),
      centerTitle: true,
      backgroundColor: Colors.green,
    );
  }

    _corpo(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _botao(context, 'Abrir Conta'),
            //_texto(),
          ],
        ),
      ),
    );
  }

    _botao(BuildContext context, String textoBotao) {
    return RaisedButton(
        color: Colors.green,
        child: Text(
          textoBotao,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        onPressed: () {
          _onClickOutraTela(context);
        });
  }

  _onClickOutraTela(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (BuildContext context) {
        return Conta();
      }),
    );
  }  

}