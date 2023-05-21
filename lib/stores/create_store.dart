import 'dart:io';

import 'package:xlo_mobx/repositories/category_repository.dart';
import 'package:xlo_mobx/stores/cep_store.dart';
import 'package:xlo_mobx/models/category.dart';
import 'package:xlo_mobx/models/address.dart';
import 'package:mobx/mobx.dart';

part 'create_store.g.dart';

class CreateStore = _CreateStore with _$CreateStore;

abstract class _CreateStore with Store {
  _CreateStore() {
    init();
  }

  ObservableList<File> images = ObservableList<File>();

  @computed
  bool get imagesValid => images.isNotEmpty;

  @computed
  String? get imagesError {
    if (!showErrors || imagesValid) {
      return null;
    } else {
      return 'Insira imagens';
    }
  }

  @observable
  String? titulo;

  @action
  void setTitulo(String value) => titulo = value;

  @computed
  bool get tituloValid => titulo != null && titulo!.length >= 6;

  @computed
  String? get tituloError {
    if (!showErrors || tituloValid) {
      return null;
    } else if (titulo!.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'Título muito curto';
    }
  }

  @observable
  String? descricao;

  @action
  void setDescricao(String value) => descricao = value;

  @computed
  bool get descricaoValid => descricao != null && descricao!.length >= 10;

  @computed
  String? get descricaoError {
    if (!showErrors || descricaoValid) {
      return null;
    } else if (descricao!.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'Descrição muito curta';
    }
  }

  @observable
  CepStore cepStore = CepStore('');

  @computed
  Address? get address => cepStore.address;

  @computed
  bool get addressValid => address != null;

  @computed
  String? get addressError {
    if (!showErrors || addressValid) {
      return null;
    } else {
      return 'Campo obrigatório';
    }
  }

  Future<void> init() async {
    categories = await CategoryRepository().getList();
  }

  @observable
  List<Category>? categories;

  @observable
  Category? categoria;

  @action
  void setCategoria(Category value) => categoria = value;

  @computed
  bool get categoriaValid => categoria != null;

  @computed
  String? get categoriaError {
    if (!showErrors || categoriaValid) {
      return null;
    } else {
      return 'Campo obrigatório';
    }
  }

  @observable
  String? preco;

  @action
  void setPreco(String value) => preco = value;

  @computed
  bool get precoValid => preco != null && num.tryParse(preco!) != null;

  @computed
  String? get precoError {
    if (!showErrors || precoValid) {
      return null;
    } else if (preco!.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'Preço inválido';
    }
  }

  @observable
  bool hidePhone = false;

  @action
  void setHidePhone(bool? value) => hidePhone = value ?? false;

  @observable
  bool showErrors = false;
}
