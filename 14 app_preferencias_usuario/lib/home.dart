import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({ Key key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
  
}

class _HomeState extends State<Home> {

  bool valorTema = false, valorFonte = false, varfonte=false, vartema = false;
  String frase = "Se você Cansar aprenda a descansar não a desistir."; 
  
  @override    
  Widget build(BuildContext context) {
    _recuperarFonte();_recuperarTema();
    return MaterialApp(      
      home: Scaffold(
        appBar: _titulo(),
       // backgroundColor: Colors.white,
        body: _corpo(),
        
      ),
      debugShowCheckedModeBanner: false,
      theme: valorTema == false ? _temaEscuro() : _temaClaro(),      
    );
  }

  _titulo() {
    return AppBar(
      title: Text("Frase do Dia"),
      centerTitle: true,
      //backgroundColor: Colors.green,
    );
  }
 
  _corpo() {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[ 
                valorFonte == false ? 
                  _fonteGrande("$frase") :
                  _fonteMedia("$frase"), 
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    _texto('Dia'), 
                   // _recuperarTema(),                   
                    _escolherTema(),
                   // _recuperarTema(),
                  ]),
                Row(
                  children: <Widget>[                    
                    _texto('Pequeno'),
                    //_recuperarFonte(),   
                    _aumentarFonte(),
                    //_recuperarFonte(),
                  ]
                ),
              ],
            ),
          ],
        ),
      ),
    );
  } 

  _fonteMedia(String valor) {
    return Text(
      valor,
      style: TextStyle(          
        fontSize: 15,          
        decorationStyle: TextDecorationStyle.wavy
      ),
    );
  }

  _fonteGrande(String valor) {
    return Text(
      valor,
      style: TextStyle(          
        fontSize: 45,          
        decorationStyle: TextDecorationStyle.wavy
      ),
    );
  }

  _temaClaro(){
    return ThemeData(
      primarySwatch: Colors.deepPurple,
      brightness: Brightness.light,
      accentColor: Colors.purple[200],
    );
  }

  _temaEscuro(){
    return ThemeData(
      primarySwatch: Colors.blueGrey,
      brightness: Brightness.dark,
      accentColor: Colors.purpleAccent[200],
    );
  }

  _texto(String valor) {
    return Text(
      valor,
      style: TextStyle(          
          fontSize: 15,          
          decorationStyle: TextDecorationStyle.wavy),
    );
  }
 
  _escolherTema() {
    return Switch(
      value: valorTema,
      onChanged: (value) {
        setState(() {
          valorTema = value;
        });
        _salvarTema();
      },     
    );
  }

  _salvarTema() async {
     
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("tema", valorTema);   
  }

  _recuperarTema() async {
    final prefs = await SharedPreferences.getInstance();
 
    setState(() {
      vartema = prefs.getBool('tema');
      valorTema = vartema;

      if ( valorTema == false ) {
        _temaEscuro();
      } else {
        _temaClaro();
      }              
    });
  }

  _aumentarFonte() {
    return Switch(
      value: valorFonte,
      onChanged: (value) {
        setState(() {
          valorFonte = value;
        });
        _salvarFonte(context);
      },     
    );
  } 

  _salvarFonte(context) async {
     
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("fonte", valorFonte);
  }

  _recuperarFonte() async {
    final prefs = await SharedPreferences.getInstance();
 
    setState(() {
      varfonte = prefs.getBool('fonte');
      valorFonte = varfonte;
       
      if ( valorFonte == false ) {
        _fonteGrande("$frase");
      } else {
        _fonteMedia("$frase");
      }      
    });  
  }

}