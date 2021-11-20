import 'package:flutter/material.dart';
import 'pessoal.dart';
import 'formacao.dart';
import 'experiencia.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
 
  @override
  _HomeState createState() => _HomeState();
}
 
class _HomeState extends State<Home> {
  int _currentPage = 0;
 
  final telas = [
    Center(
      child: Text('Bem Vindo ao Meu Perfil')),
        Pessoal(),
        Formacao(),
        Experiencia(),
  ];
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: _titulo(),
        backgroundColor: Colors.white,
        body: telas[_currentPage],
        drawer: Drawer(
            child: ListView(
              children: [
                FlutterLogo(size: 50),
                  ListTile(
                    //leading: Icon(Icons.star),
                    title: Text('Meu Perfil'),
                    subtitle: Text('Outubro 2021'),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: () {
                      setState(() {
                        _currentPage = 0;
                      });
                    },
                  ),


            UserAccountsDrawerHeader(
              accountName: Text('Maytê Araújo'),
              accountEmail: Text('maypg@bol.com.br'),
              currentAccountPicture: CircleAvatar(
                //backgroundImage: AssetImage('assets/images/rock2.jpg'),
                backgroundImage: NetworkImage(
                    'https://st.depositphotos.com/1454655/1931/v/600/depositphotos_19312231-stock-illustration-afro-hair-hippie-woman-pop.jpg'),
              ),
            ),



            ListTile(
              //leading: Icon(Icons.star),
              title: Text('Pessoal'),
              subtitle: Text('Dados Pessoais'),
              trailing: Icon(Icons.person),
              onTap: () {
                setState(() {
                  _currentPage = 1;
                });
              },
            ),
            ListTile(
              //leading: Icon(Icons.star),
              title: Text('Formação'),
              subtitle: Text('Escolaridade'),
              trailing: Icon(Icons.book),
              onTap: () {
                setState(() {
                  _currentPage = 2;
                });
              },
            ),
            ListTile(
              //leading: Icon(Icons.star),
              title: Text('Experiência'),
              subtitle: Text('Profissional'),
              trailing: Icon(Icons.computer),
              onTap: () {
                setState(() {
                  _currentPage = 3;
                });
              },
            ),
          ],
        )),
      ),
    );
  }
 
  _titulo() {
    return AppBar(
      title: Text("App Perfil"),
      centerTitle: true,
      backgroundColor: Colors.green,
    );
  }
  

}
