import 'package:xlo_mobx/screens/filter/components/section_title.dart';
import 'package:xlo_mobx/screens/filter/components/price_field.dart';
import 'package:xlo_mobx/stores/filter_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';

class PriceRangeField extends StatelessWidget {
  const PriceRangeField(this.filterStore, {Key? key}) : super(key: key);

  final FilterStore? filterStore;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(title: 'Preço'),
        Row(children: [
          PriceField(label: 'Min', onChanged: filterStore!.setMinPrice, initialValue: filterStore?.minPrice),
          const SizedBox(width: 12),
          PriceField(label: 'Max', onChanged: filterStore!.setMaxPrice, initialValue: filterStore?.maxPrice),
        ]),
        Observer(builder: (_) {
          if (filterStore!.priceError != null) {
            return Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                filterStore!.priceError!,
                style: const TextStyle(color: Colors.red, fontSize: 12),
              ),
            );
          } else {
            return Container();
          }
        })
      ],
    );
  }
}
