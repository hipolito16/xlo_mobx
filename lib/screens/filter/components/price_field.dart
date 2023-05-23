import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PriceField extends StatelessWidget {
  const PriceField({this.label, this.onChanged, this.initialValue, Key? key}) : super(key: key);

  final String? label;
  final Function(int)? onChanged;
  final int? initialValue;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        decoration: InputDecoration(
          prefixText: 'R\$ ',
          border: const OutlineInputBorder(),
          isDense: true,
          labelText: label,
        ),
        initialValue: initialValue?.toString(),
        onChanged: (value) {
          onChanged!(int.tryParse(value.replaceAll('.', ''))!);
        },
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly, RealInputFormatter(moeda: false)],
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
