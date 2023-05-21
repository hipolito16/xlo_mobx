import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_mobx/screens/create/components/hide_phone_field.dart';
import 'package:xlo_mobx/screens/create/components/category_field.dart';
import 'package:xlo_mobx/screens/create/components/images_field.dart';
import 'package:xlo_mobx/components/custom_drawer/custom_drawer.dart';
import 'package:xlo_mobx/screens/create/components/cep_field.dart';
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
        body: Container(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Card(
              clipBehavior: Clip.antiAlias,
              elevation: 8,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ImagesField(createStore),
                  Observer(builder: (_) {
                    return TextFormField(
                      onChanged: createStore.setTitulo,
                      decoration: InputDecoration(
                        labelText: 'Título *',
                        labelStyle: labelStyle,
                        contentPadding: contentPadding,
                        errorText: createStore.tituloError,
                      ),
                    );
                  }),
                  Observer(builder: (_) {
                    return TextFormField(
                      onChanged: createStore.setDescricao,
                      decoration: InputDecoration(
                        labelText: 'Descrição *',
                        labelStyle: labelStyle,
                        contentPadding: contentPadding,
                        errorText: createStore.descricaoError,
                      ),
                      maxLines: null,
                    );
                  }),
                  CepField(createStore),
                  CategoryField(createStore),
                  Observer(builder: (_) {
                    return TextFormField(
                      onChanged: createStore.setPreco,
                      decoration: InputDecoration(
                        labelText: 'Preço *',
                        labelStyle: labelStyle,
                        contentPadding: contentPadding,
                        prefixText: 'R\$ ',
                        errorText: createStore.precoError,
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly, CentavosInputFormatter()],
                    );
                  }),
                  HidePhoneField(createStore),
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.orange,
                        disabledBackgroundColor: Colors.orange.withAlpha(120),
                      ),
                      child: const Text('Enviar', style: TextStyle(fontSize: 18)),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
