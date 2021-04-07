import 'package:flutter/material.dart';
import 'package:primeiro_projeto/telas/modelos/smartphones.dart';
import 'dart:convert';
import '../modelos/smartphones.dart';
import '../detalhes/detalhes.dart';


class Home extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return new HomeState(); //Retornar uma instância dessa classe
  }

}

class HomeState extends State<Home>{


  @override //Colocar isso logo apos o extends StatelessWidget
  Widget build(BuildContext context) { //Responsavel pela pagina home (Widget)
    return _construirHome(); // ( _ ) significa que o metodo é privado
  }

  Widget _construirHome(){// Esse metodo ira coordenar a home
    return Scaffold(
      body: _construirListaCard(),
      appBar: _construirAppBar(),
    );
  }

  Widget _construirListaCard(){
    return FutureBuilder(
      future: DefaultAssetBundle
          .of(context)
          .loadString('assets/smartphones.json'),
      builder: (context, snapshot) {
        List<dynamic> smartphones = json.decode(snapshot.data.toString());

        return ListView.builder(
            itemBuilder: (BuildContext context,int index){
              Smartphone smartphone  = Smartphone.fromJson(smartphones[index]);

              return _construirCard(smartphone);

            },
          itemCount: smartphones == null ? 0: smartphones.length,
        );
      }
    );
  }

  Widget _construirCard(smartphone){
    return GestureDetector( //Faz uma ação
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => Detalhes(smartphone: smartphone)
        ));
      }, //Executar a funcao
      child: SizedBox(
          height: 300,
          child: Card( //Card
              margin: EdgeInsets.all(16),
              child: Column( //Colocar mais de um elemento em um mesmo card
                children: <Widget>[ //Aceita mais de um filho
                  Stack(
                    children: <Widget>[
                      _construirImagemCard(smartphone.foto),
                      _construirGradienteCard(),
                      _construirTextoCard(smartphone.titulo)



                    ],
                  )
                ],
              )
          )
      ),
    );


  }

  Widget _construirGradienteCard(){
    return Container(
      height: 268,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset.topCenter,
          end: FractionalOffset.bottomCenter,
          colors: [
            Colors.transparent,
            Colors.blue.withOpacity(0.7)
          ]
        )
      ),
    );
  }

  Widget _construirTextoCard(titulo){
    return Positioned(
        bottom: 10,
        left: 10,
        child: Text(titulo, style: TextStyle(
            fontSize: 20,
          color: Colors.white
        ))
    );
  }

  Widget _construirImagemCard(foto){
    return Image.asset(foto, fit: BoxFit.fill, height: 268); //Imagens pegada da internet
  }

  Widget _construirAppBar(){
    return AppBar(title: Text('LOJA TECNOLOGIA')); //Titulo
  }

}