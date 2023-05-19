// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreateStore on _CreateStore, Store {
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
  List<Category>? get categories {
    _$categoriesAtom.reportRead();
    return super.categories;
  }

  @override
  set categories(List<Category>? value) {
    _$categoriesAtom.reportWrite(value, super.categories, () {
      super.categories = value;
    });
  }

  late final _$categoryAtom =
      Atom(name: '_CreateStore.category', context: context);

  @override
  Category? get category {
    _$categoryAtom.reportRead();
    return super.category;
  }

  @override
  set category(Category? value) {
    _$categoryAtom.reportWrite(value, super.category, () {
      super.category = value;
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

  late final _$_CreateStoreActionController =
      ActionController(name: '_CreateStore', context: context);

  @override
  void setCategory(Category value) {
    final _$actionInfo = _$_CreateStoreActionController.startAction(
        name: '_CreateStore.setCategory');
    try {
      return super.setCategory(value);
    } finally {
      _$_CreateStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cepStore: ${cepStore},
categories: ${categories},
category: ${category},
showErrors: ${showErrors},
address: ${address},
addressValid: ${addressValid},
addressError: ${addressError}
    ''';
  }
}
