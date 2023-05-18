import 'package:xlo_mobx/stores/create_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_mobx/models/category.dart';
import 'package:flutter/material.dart';

class CategoryField extends StatelessWidget {
  const CategoryField(this.createStore, {Key? key}) : super(key: key);

  final CreateStore createStore;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return DropdownButtonFormField(
        items: createStore.categories!.map((value) {
          return DropdownMenuItem(
            value: value,
            child: Text(value.description!),
          );
        }).toList(),
        onChanged: (Category? value) {
          createStore.setCategory(value!);
        },
        value: createStore.category,
        decoration: const InputDecoration(
          labelText: 'Categoria *',
          labelStyle: TextStyle(
            fontWeight: FontWeight.w800,
            color: Colors.grey,
            fontSize: 18,
          ),
          contentPadding: EdgeInsets.fromLTRB(16, 10, 12, 10),
        ),
      );
    });
  }
}
