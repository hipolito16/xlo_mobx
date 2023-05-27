import 'package:xlo_mobx/screens/filter/components/vendor_type_field.dart';
import 'package:xlo_mobx/screens/filter/components/price_range_field.dart';
import 'package:xlo_mobx/screens/filter/components/orderby_field.dart';
import 'package:xlo_mobx/stores/filter_store.dart';
import 'package:xlo_mobx/stores/home_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class FilterScreen extends StatelessWidget {
  FilterScreen({Key? key}) : super(key: key);

  final FilterStore filterStore = GetIt.I<HomeStore>().cloneFilter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filtrar Busca'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Card(
              margin: const EdgeInsets.symmetric(horizontal: 32),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 8,
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      OrderByField(filterStore),
                      PriceRangeField(filterStore),
                      VendorTypeField(filterStore),
                      Observer(builder: (_) {
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 16),
                          height: 50,
                          child: ElevatedButton(
                            onPressed: filterStore.isFormValid
                                ? () {
                                    filterStore.save();
                                    Navigator.of(context).pop();
                                  }
                                : null,
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.orange,
                              disabledBackgroundColor: Colors.orange.withAlpha(120),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            child: const Text(
                              'FILTRAR',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        );
                      }),
                    ],
                  ))),
        ),
      ),
    );
  }
}
