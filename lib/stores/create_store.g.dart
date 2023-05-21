// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreateStore on _CreateStore, Store {
  Computed<bool>? _$imagesValidComputed;

  @override
  bool get imagesValid =>
      (_$imagesValidComputed ??= Computed<bool>(() => super.imagesValid,
              name: '_CreateStore.imagesValid'))
          .value;
  Computed<String?>? _$imagesErrorComputed;

  @override
  String? get imagesError =>
      (_$imagesErrorComputed ??= Computed<String?>(() => super.imagesError,
              name: '_CreateStore.imagesError'))
          .value;
  Computed<bool>? _$tituloValidComputed;

  @override
  bool get tituloValid =>
      (_$tituloValidComputed ??= Computed<bool>(() => super.tituloValid,
              name: '_CreateStore.tituloValid'))
          .value;
  Computed<String?>? _$tituloErrorComputed;

  @override
  String? get tituloError =>
      (_$tituloErrorComputed ??= Computed<String?>(() => super.tituloError,
              name: '_CreateStore.tituloError'))
          .value;
  Computed<bool>? _$descricaoValidComputed;

  @override
  bool get descricaoValid =>
      (_$descricaoValidComputed ??= Computed<bool>(() => super.descricaoValid,
              name: '_CreateStore.descricaoValid'))
          .value;
  Computed<String?>? _$descricaoErrorComputed;

  @override
  String? get descricaoError => (_$descricaoErrorComputed ??= Computed<String?>(
          () => super.descricaoError,
          name: '_CreateStore.descricaoError'))
      .value;
  Computed<Address?>? _$addressComputed;

  @override
  Address? get address => (_$addressComputed ??=
          Computed<Address?>(() => super.address, name: '_CreateStore.address'))
      .value;
  Computed<bool>? _$addressValidComputed;

  @override
  bool get addressValid =>
      (_$addressValidComputed ??= Computed<bool>(() => super.addressValid,
              name: '_CreateStore.addressValid'))
          .value;
  Computed<String?>? _$addressErrorComputed;

  @override
  String? get addressError =>
      (_$addressErrorComputed ??= Computed<String?>(() => super.addressError,
              name: '_CreateStore.addressError'))
          .value;
  Computed<bool>? _$categoriaValidComputed;

  @override
  bool get categoriaValid =>
      (_$categoriaValidComputed ??= Computed<bool>(() => super.categoriaValid,
              name: '_CreateStore.categoriaValid'))
          .value;
  Computed<String?>? _$categoriaErrorComputed;

  @override
  String? get categoriaError => (_$categoriaErrorComputed ??= Computed<String?>(
          () => super.categoriaError,
          name: '_CreateStore.categoriaError'))
      .value;
  Computed<num?>? _$precoComputed;

  @override
  num? get preco => (_$precoComputed ??=
          Computed<num?>(() => super.preco, name: '_CreateStore.preco'))
      .value;
  Computed<bool>? _$precoValidComputed;

  @override
  bool get precoValid =>
      (_$precoValidComputed ??= Computed<bool>(() => super.precoValid,
              name: '_CreateStore.precoValid'))
          .value;
  Computed<String?>? _$precoErrorComputed;

  @override
  String? get precoError =>
      (_$precoErrorComputed ??= Computed<String?>(() => super.precoError,
              name: '_CreateStore.precoError'))
          .value;
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_CreateStore.isFormValid'))
          .value;

  late final _$tituloAtom = Atom(name: '_CreateStore.titulo', context: context);

  @override
  String? get titulo {
    _$tituloAtom.reportRead();
    return super.titulo;
  }

  @override
  set titulo(String? value) {
    _$tituloAtom.reportWrite(value, super.titulo, () {
      super.titulo = value;
    });
  }

  late final _$descricaoAtom =
      Atom(name: '_CreateStore.descricao', context: context);

  @override
  String? get descricao {
    _$descricaoAtom.reportRead();
    return super.descricao;
  }

  @override
  set descricao(String? value) {
    _$descricaoAtom.reportWrite(value, super.descricao, () {
      super.descricao = value;
    });
  }

  late final _$cepStoreAtom =
      Atom(name: '_CreateStore.cepStore', context: context);

  @override
  CepStore get cepStore {
    _$cepStoreAtom.reportRead();
    return super.cepStore;
  }

  @override
  set cepStore(CepStore value) {
    _$cepStoreAtom.reportWrite(value, super.cepStore, () {
      super.cepStore = value;
    });
  }

  late final _$categoriesAtom =
      Atom(name: '_CreateStore.categories', context: context);

  @override
  List<Category> get categories {
    _$categoriesAtom.reportRead();
    return super.categories;
  }

  @override
  set categories(List<Category> value) {
    _$categoriesAtom.reportWrite(value, super.categories, () {
      super.categories = value;
    });
  }

  late final _$categoriaAtom =
      Atom(name: '_CreateStore.categoria', context: context);

  @override
  Category? get categoria {
    _$categoriaAtom.reportRead();
    return super.categoria;
  }

  @override
  set categoria(Category? value) {
    _$categoriaAtom.reportWrite(value, super.categoria, () {
      super.categoria = value;
    });
  }

  late final _$precoTextAtom =
      Atom(name: '_CreateStore.precoText', context: context);

  @override
  String? get precoText {
    _$precoTextAtom.reportRead();
    return super.precoText;
  }

  @override
  set precoText(String? value) {
    _$precoTextAtom.reportWrite(value, super.precoText, () {
      super.precoText = value;
    });
  }

  late final _$hidePhoneAtom =
      Atom(name: '_CreateStore.hidePhone', context: context);

  @override
  bool get hidePhone {
    _$hidePhoneAtom.reportRead();
    return super.hidePhone;
  }

  @override
  set hidePhone(bool value) {
    _$hidePhoneAtom.reportWrite(value, super.hidePhone, () {
      super.hidePhone = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: '_CreateStore.loading', context: context);

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

  late final _$errorAtom = Atom(name: '_CreateStore.error', context: context);

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

  late final _$savedAdAtom =
      Atom(name: '_CreateStore.savedAd', context: context);

  @override
  bool get savedAd {
    _$savedAdAtom.reportRead();
    return super.savedAd;
  }

  @override
  set savedAd(bool value) {
    _$savedAdAtom.reportWrite(value, super.savedAd, () {
      super.savedAd = value;
    });
  }

  late final _$showErrorsAtom =
      Atom(name: '_CreateStore.showErrors', context: context);

  @override
  bool get showErrors {
    _$showErrorsAtom.reportRead();
    return super.showErrors;
  }

  @override
  set showErrors(bool value) {
    _$showErrorsAtom.reportWrite(value, super.showErrors, () {
      super.showErrors = value;
    });
  }

  late final _$submitAsyncAction =
      AsyncAction('_CreateStore.submit', context: context);

  @override
  Future<void> submit() {
    return _$submitAsyncAction.run(() => super.submit());
  }

  late final _$_CreateStoreActionController =
      ActionController(name: '_CreateStore', context: context);

  @override
  void setTitulo(String value) {
    final _$actionInfo = _$_CreateStoreActionController.startAction(
        name: '_CreateStore.setTitulo');
    try {
      return super.setTitulo(value);
    } finally {
      _$_CreateStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDescricao(String value) {
    final _$actionInfo = _$_CreateStoreActionController.startAction(
        name: '_CreateStore.setDescricao');
    try {
      return super.setDescricao(value);
    } finally {
      _$_CreateStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCategoria(Category value) {
    final _$actionInfo = _$_CreateStoreActionController.startAction(
        name: '_CreateStore.setCategoria');
    try {
      return super.setCategoria(value);
    } finally {
      _$_CreateStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPreco(String value) {
    final _$actionInfo = _$_CreateStoreActionController.startAction(
        name: '_CreateStore.setPreco');
    try {
      return super.setPreco(value);
    } finally {
      _$_CreateStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHidePhone(bool? value) {
    final _$actionInfo = _$_CreateStoreActionController.startAction(
        name: '_CreateStore.setHidePhone');
    try {
      return super.setHidePhone(value);
    } finally {
      _$_CreateStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void invalidSubmit() {
    final _$actionInfo = _$_CreateStoreActionController.startAction(
        name: '_CreateStore.invalidSubmit');
    try {
      return super.invalidSubmit();
    } finally {
      _$_CreateStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
titulo: ${titulo},
descricao: ${descricao},
cepStore: ${cepStore},
categories: ${categories},
categoria: ${categoria},
precoText: ${precoText},
hidePhone: ${hidePhone},
loading: ${loading},
error: ${error},
savedAd: ${savedAd},
showErrors: ${showErrors},
imagesValid: ${imagesValid},
imagesError: ${imagesError},
tituloValid: ${tituloValid},
tituloError: ${tituloError},
descricaoValid: ${descricaoValid},
descricaoError: ${descricaoError},
address: ${address},
addressValid: ${addressValid},
addressError: ${addressError},
categoriaValid: ${categoriaValid},
categoriaError: ${categoriaError},
preco: ${preco},
precoValid: ${precoValid},
precoError: ${precoError},
isFormValid: ${isFormValid}
    ''';
  }
}
