import 'package:xlo_mobx/stores/create_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';

class HidePhoneField extends StatelessWidget {
  const HidePhoneField(this.createStore, {Key? key}) : super(key: key);

  final CreateStore createStore;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Observer(builder: (_) {
        return CheckboxListTile(
          contentPadding: EdgeInsets.zero,
          title: const Expanded(child: Text('Ocultar o meu telefone neste anúncio')),
          value: createStore.hidePhone,
          onChanged: createStore.setHidePhone,
          activeColor: Colors.purple,
          controlAffinity: ListTileControlAffinity.leading,
        );
      }),
    );
  }
}
