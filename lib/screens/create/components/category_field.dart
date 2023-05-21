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
      return Column(
        children: [
          DropdownButtonFormField(
            items: createStore.categories.map((value) {
              return DropdownMenuItem(
                value: value,
                child: Text(value.description!),
              );
            }).toList(),
            onChanged: (Category? value) {
              createStore.setCategoria(value!);
            },
            value: createStore.categoria,
            decoration: const InputDecoration(
              labelText: 'Categoria *',
              labelStyle: TextStyle(
                fontWeight: FontWeight.w800,
                color: Colors.grey,
                fontSize: 18,
              ),
              contentPadding: EdgeInsets.fromLTRB(16, 10, 12, 10),
            ),
          ),
          if (createStore.categoriaError != null)
            Container(
              alignment: Alignment.centerLeft,
              decoration: const BoxDecoration(
                border: Border(top: BorderSide(color: Colors.red)),
              ),
              padding: const EdgeInsets.fromLTRB(16, 8, 0, 0),
              child: Text(
                createStore.categoriaError!,
                style: const TextStyle(color: Colors.red, fontSize: 12),
              ),
            )
          else
            Container(
              height: 1,
              color: Colors.grey[400],
            )
        ],
      );
    });
  }
}
