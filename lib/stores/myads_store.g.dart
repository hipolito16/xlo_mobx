// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'myads_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MyAdsStore on _MyAdsStore, Store {
  Computed<List<Ad>>? _$activeAdsComputed;

  @override
  List<Ad> get activeAds =>
      (_$activeAdsComputed ??= Computed<List<Ad>>(() => super.activeAds,
              name: '_MyAdsStore.activeAds'))
          .value;
  Computed<List<Ad>>? _$pendingAdsComputed;

  @override
  List<Ad> get pendingAds =>
      (_$pendingAdsComputed ??= Computed<List<Ad>>(() => super.pendingAds,
              name: '_MyAdsStore.pendingAds'))
          .value;
  Computed<List<Ad>>? _$soldAdsComputed;

  @override
  List<Ad> get soldAds => (_$soldAdsComputed ??=
          Computed<List<Ad>>(() => super.soldAds, name: '_MyAdsStore.soldAds'))
      .value;

  late final _$myAdsAtom = Atom(name: '_MyAdsStore.myAds', context: context);

  @override
  List<Ad> get myAds {
    _$myAdsAtom.reportRead();
    return super.myAds;
  }

  @override
  set myAds(List<Ad> value) {
    _$myAdsAtom.reportWrite(value, super.myAds, () {
      super.myAds = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: '_MyAdsStore.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$errorAtom = Atom(name: '_MyAdsStore.error', context: context);

  @override
  String? get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String? value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$setSoldAsyncAction =
      AsyncAction('_MyAdsStore.setSold', context: context);

  @override
  Future<void> setSold(Ad ad) {
    return _$setSoldAsyncAction.run(() => super.setSold(ad));
  }

  late final _$_MyAdsStoreActionController =
      ActionController(name: '_MyAdsStore', context: context);

  @override
  void setMyAds(List<Ad> value) {
    final _$actionInfo =
        _$_MyAdsStoreActionController.startAction(name: '_MyAdsStore.setMyAds');
    try {
      return super.setMyAds(value);
    } finally {
      _$_MyAdsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$_MyAdsStoreActionController.startAction(
        name: '_MyAdsStore.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_MyAdsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setError(String? value) {
    final _$actionInfo =
        _$_MyAdsStoreActionController.startAction(name: '_MyAdsStore.setError');
    try {
      return super.setError(value);
    } finally {
      _$_MyAdsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
myAds: ${myAds},
loading: ${loading},
error: ${error},
activeAds: ${activeAds},
pendingAds: ${pendingAds},
soldAds: ${soldAds}
    ''';
  }
}
