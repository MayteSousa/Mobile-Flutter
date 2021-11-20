import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
 
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
 
class _HomeState extends State<Home> {
  TextEditingController loginController = TextEditingController();
  String info_git = '', varfoto= '';
 
  _recuperargit() async {
    String url = 'https://api.github.com/users/${loginController.text}';
 
    print(url);
 
    http.Response response = await http.get(Uri.parse(url));
    Map<String, dynamic> retorno = json.decode(response.body);
    String id = retorno["id"];
    String nome = retorno["name"];
    String repos = retorno["public_repos"];
    String criado = retorno["created_at"];
    String seguidores = retorno["followers"];
    String seguindo = retorno["following"];
    String avatar = retorno["avatar_url"];    
   
    setState(() {      
      info_git =
          'Id: $id \n Nome: $nome \n Repositórios: $repos \n Criado em: $criado \n Seguidores: $seguidores \n Seguindo: $seguindo';
      varfoto = avatar;

    });
  }
 
_foto() {
    return Center(
      child: Image.network('$varfoto',
        height: 150,
        width: 150,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Perfil dos Dev's"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[            
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Digite o Login GitHub",
                  labelStyle: TextStyle(color: Colors.green)),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.green, fontSize: 25.0),
              controller: loginController,
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: Container(
                height: 50.0,
                child: RaisedButton(
                  onPressed: _recuperargit,
                  child: Text("Obter GitHub",
                      style: TextStyle(color: Colors.white, fontSize: 20.0)),
                  color: Colors.blue,
                ),
              ),
            ),
            _foto(),
            Text(info_git),           
          ],
        ),
      ),
    );
  }
}
