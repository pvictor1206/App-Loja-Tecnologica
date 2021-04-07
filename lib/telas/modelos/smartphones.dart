class Smartphone {
  String titulo;
  String foto;
  String preco;
  String status;

  Smartphone({this.titulo, this.foto, this.preco, this.status});

  Smartphone.fromJson(Map<String, dynamic> json) {
    titulo = json['titulo'];
    foto = json['foto'];
    preco = json['preco'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['titulo'] = this.titulo;
    data['foto'] = this.foto;
    data['preco'] = this.preco;
    data['status'] = this.status;
    return data;
  }
}