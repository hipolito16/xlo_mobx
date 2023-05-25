import 'package:xlo_mobx/repositories/ad_repository.dart';
import 'package:xlo_mobx/stores/filter_store.dart';
import 'package:xlo_mobx/models/category.dart';
import 'package:xlo_mobx/models/ad.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  _HomeStore() {
    autorun((_) async {
      try {
        setLoading(true);
        final newAds = await AdRepository().getHomeAdList(filter: cloneFilter, search: search, category: categoria);
        adList.clear();
        adList.addAll(newAds);
        setError('');
        setLoading(false);
        setLoading(false);
      } catch (e) {
        setError(e.toString());
      }
    });
  }

  ObservableList<Ad> adList = ObservableList<Ad>();

  @observable
  String search = '';

  @action
  void setSearch(String value) => search = value;

  @observable
  Category? categoria;

  @action
  void setCategoria(Category? value) => categoria = value;

  @observable
  FilterStore filterStore = FilterStore();

  FilterStore get cloneFilter => filterStore.clone();

  @action
  void setFilter(FilterStore value) => filterStore = value;

  @observable
  String? error;

  @action
  void setError(String value) => error = value;

  @observable
  bool loading = false;

  @action
  void setLoading(bool value) => loading = value;
}
