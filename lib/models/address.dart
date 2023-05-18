import 'package:xlo_mobx/models/city.dart';
import 'package:xlo_mobx/models/uf.dart';

class Address {
  Address({this.uf, this.city, this.cep, this.district});

  UF? uf;
  City? city;
  String? cep;
  String? district;
}
