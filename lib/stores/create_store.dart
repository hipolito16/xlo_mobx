import 'dart:io';

import 'package:xlo_mobx/models/category.dart';
import 'package:mobx/mobx.dart';

part 'create_store.g.dart';

class CreateStore = _CreateStore with _$CreateStore;

abstract class _CreateStore with Store {
  ObservableList<File> images = ObservableList<File>();

  @observable
  Category? category;

  @action
  void setCategory(Category value) => category = value;
}
