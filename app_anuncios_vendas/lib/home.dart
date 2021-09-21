import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: _titulo(),                      
        ),
        
        body: _corpo(),
    );
  }

  _titulo(){
    return AppBar(
      title: Text("Anúncio de Vendas"),
      centerTitle: true,
      backgroundColor: Colors.deepPurple,
    );
  }

  _legenda(String vtexto) {
    return Text(
      vtexto,
      style: TextStyle(
          color: Colors.blue,
          fontSize: 12,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          decorationStyle: TextDecorationStyle.wavy),
    );
  }

  _texto(String vtexto) {
    return Text(
      vtexto,
      style: TextStyle(
          color: Colors.blue,
          fontSize: 14,
          fontWeight: FontWeight.normal,
          decorationStyle: TextDecorationStyle.wavy),
    );
  }

  _subtitulo(String vtexto){
    return Text(
      vtexto,
      style: TextStyle(
          color: Colors.blue,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          decorationColor: Colors.red,
          decorationStyle: TextDecorationStyle.wavy),
    );
  }

  _foto(String nomeFoto){
    return Image.asset(
      "assets/images/$nomeFoto",
      height: 150,
      width: 150,
      fit: BoxFit.cover,
    );
  }//_foto


//ESTÁ FUNCIONANDO POREM NAO CONSEGUI INCLUIR O PAGEVIEW


  _corpo(){
    return Center(
      child: Container(
        child: Column(
          children: <Widget>[
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _subtitulo("Frutas Exóticas"),
              ]
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(children: <Widget>[
                    _foto("fruta1.jpg"),
                    _legenda("Cherimoia (Annona cherimola Mill)"),
                    //_texto("É uma fruta rica em vitamina A, auxiliando na saúde da pele e dos olhos. Também possui vitamina C, sendo importante para o funcionamento do sistema imunológico, além de ter ação antioxidante e auxiliar na produção de colágeno."),
                  ],
                ),
                Column(children: <Widget>[
                  _foto('fruta2.jpg'),
                  _legenda('Granadilha \n(Passiflora ligularis)'),
                 // _texto("É uma fruta com baixo valor calórico, rica em fotoquímicos que auxiliam no controle do colesterol e em fibras solúveis, que auxiliam na prevenção da diabetes."),
                ],
                ),
                Column(children: <Widget>[
                  _foto('fruta3.jpg'),
                  _legenda('Lichia \n(Litchi chinensis Sonn)'),
                //  _texto("é rica em vitamina C, apresentando quantidades maiores do que a laranja e o limão. Também possui muitas fibras. Seus nutrientes auxiliam na saúde do coração e na regulação do sangue, além de possuir efeitos anti-inflamatórios."),
                ],
                ),
              ]
            ),
          ],
        ),
      ),
    );
  }

/*
  //VERIFICAR NÃO ESTÁ FUNCIONANDO COM O PAGEVIEW
  _corpoTeste(){
    return Center(
      child: Container(
        child: Column(
          children: <Widget>[
            Row(mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _subtitulo("Frutas Exóticas"),
                ]
            ),
            PageView(
                children: <Widget>[

                    _foto("fruta1.jpg"),
                    _legenda("Cherimoia (Annona cherimola Mill)"),
                    //_texto("É uma fruta rica em vitamina A, auxiliando na saúde da pele e dos olhos. Também possui vitamina C, sendo importante para o funcionamento do sistema imunológico, além de ter ação antioxidante e auxiliar na produção de colágeno."),


                    _foto('fruta2.jpg'),
                    _legenda('Granadilha \n(Passiflora ligularis)'),
                    // _texto("É uma fruta com baixo valor calórico, rica em fotoquímicos que auxiliam no controle do colesterol e em fibras solúveis, que auxiliam na prevenção da diabetes."),


                    _foto('fruta3.jpg'),
                    _legenda('Lichia \n(Litchi chinensis Sonn)'),
                    //  _texto("é rica em vitamina C, apresentando quantidades maiores do que a laranja e o limão. Também possui muitas fibras. Seus nutrientes auxiliam na saúde do coração e na regulação do sangue, além de possuir efeitos anti-inflamatórios."),

                ]
            ),
          ],
        ),
      ),
    );
  }
*/


}