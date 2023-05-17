import 'package:xlo_mobx/stores/create_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';

class CategoryField extends StatelessWidget {
  const CategoryField(this.createStore, {Key? key}) : super(key: key);

  final CreateStore createStore;

  @override
  Widget build(BuildContext context) {
    return const Text('CategoryField');
  }
}
