import 'package:xlo_mobx/repositories/ad_repository.dart';
import 'package:xlo_mobx/models/ad.dart';
import 'package:mobx/mobx.dart';

part 'myads_store.g.dart';

class MyAdsStore = _MyAdsStore with _$MyAdsStore;

abstract class _MyAdsStore with Store {
  _MyAdsStore() {
    _getMyAds();
  }

  Future<void> _getMyAds() async {
    try {
      setLoading(true);
      final ads = await AdRepository().getMyAds();
      setMyAds(ads);
      setLoading(false);
    } catch (e) {
      setLoading(false);
      setError(e.toString());
    }
  }

  @observable
  List<Ad> myAds = [];

  @observable
  bool loading = false;

  @observable
  String? error;

  @action
  void setMyAds(List<Ad> value) => myAds = value;

  @action
  void setLoading(bool value) => loading = value;

  @action
  void setError(String? value) => error = value;

  @action
  Future<void> setSold(Ad ad) async {
    await AdRepository().setAdSold(ad);
    _getMyAds();
  }

  @computed
  List<Ad> get activeAds => myAds.where((ad) => ad.status == AdStatus.ACTIVE).toList();

  @computed
  List<Ad> get pendingAds => myAds.where((ad) => ad.status == AdStatus.PENDING).toList();

  @computed
  List<Ad> get soldAds => myAds.where((ad) => ad.status == AdStatus.SOLD).toList();
}
