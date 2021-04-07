import 'package:flutter/material.dart';
import '../modelos/smartphones.dart';

class Detalhes extends StatelessWidget{

  final Smartphone smartphone;

  Detalhes({Key key, @required this.smartphone}): super(key: key);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _contruirDetalhes();
  }

  Widget _contruirDetalhes(){
    return Scaffold(
      body: ListView(
        children: <Widget>[
          _construirImagensDetalhes(smartphone.foto),
          _construirTituloDetalhes(smartphone.titulo),
          _construirLinhaInconesDetalhes(smartphone.preco,smartphone.status)
        ],
      ),
      appBar: _construirAppBar(),
    );
  }

  Widget _construirImagensDetalhes(imagem){
    return Image.asset(imagem);
  }

  Widget _construirTituloDetalhes(titulo){
    return Center(
      child: Text(titulo, style: TextStyle(
          color: Colors.blue, fontSize: 30
      ))
    );
  }

  Widget _construirLinhaInconesDetalhes(preco,situacao){
    return Row(
      children: <Widget>[
        _construirColunaInconeDetalhes(preco),
        _construirColunaInconeDetalhes(situacao)
      ],
    );
  }

  Widget _construirColunaInconeDetalhes(texto){
    return Expanded(child:Column(
      children: <Widget>[
        Text(texto, style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
      ],
    )
    );
  }

  Widget _construirAppBar(){
    return AppBar(title: Text('LOJA TECNOLOGIA')); //Titulo
  }
}