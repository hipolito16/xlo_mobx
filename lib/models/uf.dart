class UF {
  UF({this.id, this.sigla, this.nome});

  int? id;
  String? sigla;
  String? nome;

  UF.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sigla = json['sigla'];
    nome = json['nome'];
  }
}
