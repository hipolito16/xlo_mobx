import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'package:xlo_mobx/repositories/table_keys.dart';
import 'package:xlo_mobx/models/category.dart';
import 'package:xlo_mobx/models/address.dart';
import 'package:xlo_mobx/models/city.dart';
import 'package:xlo_mobx/models/user.dart';
import 'package:xlo_mobx/models/uf.dart';

enum AdStatus { PENDING, ACTIVE, SOLD, DELETED }

class Ad {
  Ad({
    this.id,
    this.images,
    this.titulo,
    this.descricao,
    this.categoria,
    this.address,
    this.preco,
    this.hidePhone,
    this.status = AdStatus.ACTIVE,
    this.createdAt,
    this.user,
    this.views = 0,
  });

  String? id;
  List? images;
  String? titulo;
  String? descricao;
  Category? categoria;
  Address? address;
  num? preco;
  bool? hidePhone;
  AdStatus? status;
  DateTime? createdAt;
  User? user;
  int? views;

  Ad.fromParse(ParseObject object) {
    id = object.objectId;
    titulo = object.get<String>(keyAdTitulo);
    descricao = object.get<String>(keyAdDescricao);
    images = object.get<List>(keyAdImages)!.map((e) => e.url).toList();
    hidePhone = object.get<bool>(keyAdHidePhone);
    preco = object.get<num>(keyAdPreco);
    createdAt = object.createdAt;
    address = Address(
      cep: object.get<String>(keyAdCEP),
      bairro: object.get<String>(keyAdBairro),
      cidade: City(nome: object.get<String>(keyAdCidade)),
      uf: UF(sigla: object.get<String>(keyAdUF)),
    );
    views = object.get<int>(keyAdViews, defaultValue: 0);
    user = User.fromParse(object.get<ParseUser>(keyAdOwner)!);
    categoria = Category.fromParse(object.get<ParseObject>(keyAdCategoria)!);
    status = AdStatus.values[object.get<int>(keyAdStatus)!];
  }
}
