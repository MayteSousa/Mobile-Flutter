import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'sinopse.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<dynamic> infofilmes = List.empty();

  _recuperarFilmes() async{
    String url = 'https://sujeitoprogramador.com/r-api/?api=filmes';

   // print(url);

    http.Response response = await http.get(Uri.parse(url));
    List<dynamic> retorno = json.decode(response.body);

    /*Map<String, dynamic> retorno = json.decode(response.body);
    nome = retorno["nome"];
    sinopse = retorno["sinopse"];
    foto = retorno["foto"];*/

    setState((){
      infofilmes = retorno;      
    });
  }
  
  @override
  void initState() {
    _recuperarFilmes();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _titulo(),                        
      body: _corpo(context),           
    );    
  }

    _titulo() {
    return AppBar(
      title: Text("App de Filmes"),
      centerTitle: true,
      backgroundColor: Colors.green,
    );
  }
 
  _corpo(BuildContext context){
    return Container(
      padding: EdgeInsets.all(20),
      child: ListView(
        children: [
          _exibirFilme(0),
          _exibirFilme(1),
          _exibirFilme(2),
          _exibirFilme(3),
          _exibirFilme(4),
          _exibirFilme(5),
          _exibirFilme(6),
        ],
      ),  
    );
  }
 
  _exibirFilme(id){
    return Column(
      children: <Widget>[    
        Center( child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _texto('Filme: ${infofilmes[id]['nome']}'),
            _botao(context, id),
          ],
        ),),
        Center( child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _foto('${infofilmes[id]['foto']}'),  
            //_texto('$info_filme'),
          ],
        ),),
      ],
    );     
  }

  _foto(String caminho) {
    return Center(
      child: Image.network(caminho,
        height: 150,
        width: 150,
      ),
    );
  }

  _texto(String valor){
    return Text(
      valor,
      style: TextStyle(
          color: Colors.green,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          decorationStyle: TextDecorationStyle.wavy),
    );
  }//

  _leiaMais(BuildContext context, id){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context){
          return Sinopse(valueNome: '${infofilmes[id]['nome']}', valueDescricao: '${infofilmes[id]['sinopse']}');
        }
      ),
    );
  }
  
  _botao(BuildContext context, id) {
    return RaisedButton(
      onPressed: (){
        _leiaMais(context,id);
      },
      color: Colors.white,
      child:  _texto('Leia mais'),        
    );
  }
}