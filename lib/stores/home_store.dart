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
        final newAds = await AdRepository().getHomeAdList(filter: cloneFilter, search: search, category: categoria, page: page);
        addNewAds(newAds);
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
  void setSearch(String value) {
    search = value;
    resetPage();
  }

  @observable
  Category? categoria;

  @action
  void setCategoria(Category? value) {
    categoria = value;
    resetPage();
  }

  @observable
  FilterStore filterStore = FilterStore();

  FilterStore get cloneFilter => filterStore.clone();

  @action
  void setFilter(FilterStore value) {
    filterStore = value;
    resetPage();
  }

  @observable
  String? error;

  @action
  void setError(String value) => error = value;

  @observable
  bool loading = false;

  @action
  void setLoading(bool value) => loading = value;

  @observable
  int page = 0;

  @observable
  bool lastPage = false;

  @action
  void loadNextPage() => page++;

  @action
  void addNewAds(List<Ad> newAds) {
    if (newAds.length < 10) lastPage = true;
    adList.addAll(newAds);
  }

  @computed
  int get itemCount => lastPage ? adList.length : adList.length + 1;

  void resetPage() {
    page = 0;
    adList.clear();
    lastPage = false;
  }

  @computed
  bool get showProgress => loading && adList.isEmpty;
}
