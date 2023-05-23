import 'package:xlo_mobx/screens/filter/components/section_title.dart';
import 'package:xlo_mobx/stores/filter_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';

class OrderByField extends StatelessWidget {
  const OrderByField(this.filterStore, {Key? key}) : super(key: key);

  final FilterStore? filterStore;

  @override
  Widget build(BuildContext context) {
    Widget buildOption(String title, OrderBy option) {
      return Observer(builder: (_) {
        return GestureDetector(
          onTap: () {
            filterStore!.setOrderBy(option);
          },
          child: Container(
            height: 50,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: filterStore!.orderBy == option ? Colors.purple : Colors.transparent,
              border: Border.all(color: filterStore!.orderBy == option ? Colors.purple : Colors.grey),
            ),
            child: Text(title, style: TextStyle(color: filterStore!.orderBy == option ? Colors.white : Colors.black)),
          ),
        );
      });
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(title: 'Ordenar por'),
        Row(
          children: [
            buildOption('Data', OrderBy.DATE),
            const SizedBox(width: 12),
            buildOption('Preço', OrderBy.PRICE),
          ],
        )
      ],
    );
  }
}
