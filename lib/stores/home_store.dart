import 'package:xlo_mobx/models/category.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  @observable
  String search = '';

  @action
  void setSearch(String value) => search = value;

  @observable
  Category? categoria;

  @action
  void setCategoria(Category? value) => categoria = value;
}