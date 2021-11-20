import 'package:flutter/material.dart';
 
class Dados extends StatelessWidget {
  
    String valueNome, valueIdade, valueSexo, valueEscolaridade, valueLimite, valueNacionalidade;

    Dados({
      required this.valueNome, 
      required this.valueIdade, 
      required this.valueSexo, 
      required this.valueEscolaridade, 
      required this.valueLimite,
      required this.valueNacionalidade
      });
              
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dados Cadastrados'),
      ),
      body: _body(context),
    );
  }
 
 _body(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          _foto(),
            Text(valueNome,                
                style: TextStyle(
                  fontSize: 25,
                 color: Colors.green,
                ),),
            Text(valueIdade.toString(),                
                style: TextStyle(
                  fontSize: 25,
                 color: Colors.green,
                ),),
            Text(valueSexo,                
                style: TextStyle(
                  fontSize: 25,
                 color: Colors.green,
                ),),
            Text(valueEscolaridade,                
                style: TextStyle(
                  fontSize: 25,
                 color: Colors.green,
                ),),
            Text(valueLimite,                
                style: TextStyle(
                  fontSize: 25,
                 color: Colors.green,
                ),),
            Text(valueNacionalidade,                
                style: TextStyle(
                  fontSize: 25,
                 color: Colors.green,
                ),),
            RaisedButton(
              child: Text('Voltar'),
              onPressed: () => _onClickVoltar(context),
            ),            
        ],
      ),
    );
  }
 
  _onClickVoltar(BuildContext context) {
    Navigator.pop(context, "Voltar");
  }

  
_foto(){
  return Center(
    child: Image.network('https://st.depositphotos.com/1454655/1931/v/600/depositphotos_19312231-stock-illustration-afro-hair-hippie-woman-pop.jpg',
    height: 150,
    width: 150,
    ),
  );
}

}
