import 'package:xlo_mobx/screens/create/components/category_field.dart';
import 'package:xlo_mobx/screens/create/components/images_field.dart';
import 'package:xlo_mobx/components/custom_drawer/custom_drawer.dart';
import 'package:xlo_mobx/stores/create_store.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class CreateScreen extends StatelessWidget {
  CreateScreen({Key? key}) : super(key: key);

  final CreateStore createStore = CreateStore();

  @override
  Widget build(BuildContext context) {
    const labelStyle = TextStyle(
      fontWeight: FontWeight.w800,
      color: Colors.grey,
      fontSize: 18,
    );

    const contentPadding = EdgeInsets.fromLTRB(16, 10, 12, 10);

    return Scaffold(
        drawer: const CustomDrawer(),
        appBar: AppBar(
          title: const Text('Criar Anúncio'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Card(
            clipBehavior: Clip.antiAlias,
            elevation: 8,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ImagesField(createStore),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Título *',
                    labelStyle: labelStyle,
                    contentPadding: contentPadding,
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Descrição *',
                    labelStyle: labelStyle,
                    contentPadding: contentPadding,
                  ),
                  maxLines: null,
                ),
                CategoryField(createStore),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Preço *',
                    labelStyle: labelStyle,
                    contentPadding: contentPadding,
                    prefixText: 'R\$ ',
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly, CentavosInputFormatter()],
                ),
              ],
            ),
          ),
        ));
  }
}
