import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController nomeController = TextEditingController();
  TextEditingController idadeController = TextEditingController();
  String dropdownSexo = 'Sexo';
  String dropdownEscolaridade = 'Escolaridade';
  double valorLimite = 0;
  bool valorNacionalidade = true;
  String dados = '';

  void _exibirDados(){
    setState((){

      String nome = nomeController.text;
      String idade = idadeController.text;
      String sexo = dropdownSexo;
      String escolaridade = dropdownEscolaridade;
      double limite = valorLimite;
      bool nacionalidade = valorNacionalidade;

      dados = "Dados Informados\n\n  Nome: $nome\n  Idade: $idade\n  Sexo: $sexo\n  Escolaridade: $escolaridade\n  Limite: $limite\n  Brasileiro: $nacionalidade";      
    });    
  }//_exibirDados

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _titulo(),
        backgroundColor: Colors.white,
        body: _corpo(),      
    );
  }

  _corpo(){
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget> [
          _campo("Nome:", nomeController),
          _campo("Idade:", idadeController),
          _dropdownsexo(),
          _dropdownescolaridade(),
          _limite(),
          _texto(valorLimite),
          _nacionalidade(),
          _texto2(valorNacionalidade.toString()),          
          _botao(),
          _texto2(dados), 
        ],
      ),
    );
  }

  _titulo(){
    return AppBar(
      title: Text("Abertura de Conta"),       
      centerTitle: true,
      backgroundColor: Colors.green,
    );
  }

  _campo(labelTitulo, objController) {
    return TextField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: labelTitulo,
        labelStyle: TextStyle(color: Colors.green)
        ),
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.green, fontSize: 25.0),
        controller: objController,
      );
  }

  _dropdownsexo() {
    return DropdownButton<String>(
      value: dropdownSexo,
      style: const TextStyle(color: Colors.green, fontSize: 25.0),
      items: <String>['Sexo', 'Masculino', 'Feminino', 'Plural']
          .map((String valueSexo) {
        return DropdownMenuItem<String>(
          value: valueSexo,
          child: Text(valueSexo),
        );
      }).toList(),
      onChanged: (String? valorSelecionadoSexo) {
        setState(() {
          dropdownSexo = valorSelecionadoSexo!;
        });
      },
    );
  }

  _dropdownescolaridade() {
    return DropdownButton<String>(
      value: dropdownEscolaridade,
      style: const TextStyle(color: Colors.green, fontSize: 25.0),
      items: <String>['Escolaridade', 'Analfabeto', 'Ensino Fundamental', 'Ensino Médio', 'Graduação', 'Mestrado', 'Doutorado']
          .map((String valueEscolaridade) {
        return DropdownMenuItem<String>(
          value: valueEscolaridade,
          child: Text(valueEscolaridade),
        );
      }).toList(),
      onChanged: (String? valorSelecionadoEscolaridade) {
        setState(() {
          dropdownEscolaridade = valorSelecionadoEscolaridade!;
        });
      },
    );
  }//Dropdownescolaridade  
   
  _limite() {
    return Slider(
      value: valorLimite,
      min: 0,
      max: 1000,
      divisions: 1000,
      label: valorLimite.round().toString(),
      onChanged: (double valueLimite) {
        setState(() {
          valorLimite = valueLimite;
        });
      },
    );
  }//limite

  _texto(double valor){
    return Text(
      valor.toStringAsPrecision(3),
      style: TextStyle(
          color: Colors.green,
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
          decorationStyle: TextDecorationStyle.wavy),
    );
  }//texto

  _nacionalidade() {
    return Switch(
      value: valorNacionalidade,
      onChanged: (value) {
        setState(() {
          valorNacionalidade = value;
        });
      },
      activeTrackColor: Colors.lightGreenAccent,
      activeColor: Colors.blue,
    );
  }

  _texto2(String valor){
    return Text(
      valor,
      style: TextStyle(
          color: Colors.green,
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
          decorationStyle: TextDecorationStyle.wavy),
    );
  }//texto

  _botao(){
    return Padding(
      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: Container(
        height: 50.0,
        child: RaisedButton(
          onPressed: _exibirDados,
          child: Text("Confirmar",
            style: TextStyle(color: Colors.white, fontSize: 25.0)),
          color: Colors.blue,
          ),
      ),
    );
  }//botao


} //CLASS