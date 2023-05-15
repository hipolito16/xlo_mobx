import 'package:xlo_mobx/components/custom_drawer/custom_drawer.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class CreateScreen extends StatelessWidget {
  const CreateScreen({Key? key}) : super(key: key);

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
        body: Card(
          elevation: 8,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
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
        ));
  }
}
