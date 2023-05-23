import 'package:xlo_mobx/screens/home/components/bar_button.dart';
import 'package:xlo_mobx/screens/category/category_screen.dart';
import 'package:xlo_mobx/screens/filter/filter_screen.dart';
import 'package:xlo_mobx/stores/home_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class TopBar extends StatelessWidget {
  TopBar({super.key});

  final HomeStore homeStore = GetIt.I<HomeStore>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Observer(builder: (_) {
          return BarButton(
              label: homeStore.categoria?.description ?? 'Categorias',
              boxDecoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey[400]!))),
              onTap: () async {
                final categoria = await Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => CategoryScreen(
                          showAll: true,
                          selected: homeStore.categoria,
                        )));
                if (categoria != null) homeStore.setCategoria(categoria);
              });
        }),
        BarButton(
            label: 'Filtros',
            boxDecoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey[400]!), left: BorderSide(color: Colors.grey[400]!))),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) => FilterScreen()));
            }),
      ],
    );
  }
}
