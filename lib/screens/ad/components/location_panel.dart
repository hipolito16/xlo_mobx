import 'package:xlo_mobx/models/ad.dart';
import 'package:flutter/material.dart';

class LocationPanel extends StatelessWidget {
  const LocationPanel(this.ad, {Key? key}) : super(key: key);

  final Ad ad;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(top: 18, bottom: 12),
          child: Text(
            'Localização',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Row(
          children: <Widget>[
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('CEP'),
                  SizedBox(height: 12),
                  Text('Município'),
                  SizedBox(height: 12),
                  Text('Bairro'),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('${ad.address?.cep}'),
                    const SizedBox(height: 12),
                    Text('${ad.address?.cidade?.nome}'),
                    const SizedBox(height: 12),
                    Text('${ad.address?.bairro}'),
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
