class City {
  City({this.id, this.nome});

  int? id;
  String? nome;

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
  }
}
