import 'package:xlo_mobx/models/city.dart';
import 'package:xlo_mobx/models/uf.dart';

class Address {
  Address({this.uf, this.cidade, this.cep, this.bairro});

  UF? uf;
  City? cidade;
  String? cep;
  String? bairro;

  Address.fromJson(Map<String, dynamic> json) {
    uf = UF(id: json['uf']['id'], sigla: json['uf']['sigla'], nome: json['uf']['nome']);
    cidade = City(id: json['cidade']['id'], nome: json['cidade']['nome']);
    cep = json['cep'];
    bairro = json['bairro'];
  }
}
