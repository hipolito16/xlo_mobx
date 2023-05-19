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

  @observable
  List<Category>? categories;

  ObservableList<File> images = ObservableList<File>();

  @observable
  Category? category;

  @action
  void setCategory(Category value) => category = value;

  @observable
  bool showErrors = false;

  Future<void> init() async {
    categories = await CategoryRepository().getList();
  }
}
