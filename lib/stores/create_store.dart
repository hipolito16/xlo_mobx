import 'dart:io';

import 'package:xlo_mobx/models/category.dart';
import 'package:mobx/mobx.dart';
import 'package:xlo_mobx/repositories/category_repository.dart';

part 'create_store.g.dart';

class CreateStore = _CreateStore with _$CreateStore;

abstract class _CreateStore with Store {
  _CreateStore() {
    init();
  }

  @observable
  List<Category>? categories;

  ObservableList<File> images = ObservableList<File>();

  @observable
  Category? category;

  @action
  void setCategory(Category value) => category = value;

  Future<void> init() async {
    categories = await CategoryRepository().getList();
  }
}
