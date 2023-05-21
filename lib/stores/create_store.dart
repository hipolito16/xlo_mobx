import 'dart:io';

import 'package:xlo_mobx/repositories/ad_repository.dart';
import 'package:xlo_mobx/stores/user_manager_store.dart';
import 'package:xlo_mobx/stores/category_store.dart';
import 'package:xlo_mobx/stores/cep_store.dart';
import 'package:xlo_mobx/models/category.dart';
import 'package:xlo_mobx/models/address.dart';
import 'package:xlo_mobx/models/ad.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'create_store.g.dart';

class CreateStore = _CreateStore with _$CreateStore;

abstract class _CreateStore with Store {
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
    } else if (titulo == null) {
      return 'Campo título obrigatório';
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
    } else if (descricao == null) {
      return 'Campo descrição obrigatório';
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
      return 'Campo CEP obrigatório';
    }
  }

  @observable
  List<Category> categories = GetIt.I<CategoryStore>().categoryList;

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
      return 'Campo categoria obrigatório';
    }
  }

  @observable
  String? precoText;

  @action
  void setPreco(String value) => precoText = value;

  @computed
  num? get preco {
    if (precoText == null) {
      return null;
    } else if (precoText!.contains(',')) {
      return num.tryParse(precoText!.replaceAll(RegExp('[^0-9]'), ''))! / 100;
    } else {
      return num.tryParse(precoText!);
    }
  }

  @computed
  bool get precoValid => preco != null && preco! <= 9999999;

  @computed
  String? get precoError {
    if (!showErrors || precoValid) {
      return null;
    } else if (preco == null) {
      return 'Campo preço obrigatório';
    } else {
      return 'Preço inválido';
    }
  }

  @observable
  bool hidePhone = false;

  @action
  void setHidePhone(bool? value) => hidePhone = value ?? false;

  @computed
  bool get isFormValid => imagesValid && tituloValid && descricaoValid && addressValid && categoriaValid && precoValid;

  @observable
  bool loading = false;

  @observable
  String? error;

  @action
  Future<void> submit() async {
    final ad = Ad(
      images: images,
      titulo: titulo,
      descricao: descricao,
      address: address,
      categoria: categoria,
      preco: preco,
      hidePhone: hidePhone,
      user: GetIt.I<UserManagerStore>().user,
    );

    loading = true;
    try {
      await AdRepository().save(ad);
      savedAd = true;
    } catch (e) {
      error = e as String;
    }
    loading = false;
  }

  @observable
  bool savedAd = false;

  @observable
  bool showErrors = false;

  @action
  void invalidSubmit() => showErrors = true;
}
