import 'package:xlo_mobx/helpers/extensions.dart';
import 'package:xlo_mobx/models/ad.dart';
import 'package:flutter/material.dart';

class UserPanel extends StatelessWidget {
  const UserPanel(this.ad, {Key? key}) : super(key: key);

  final Ad ad;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(top: 18, bottom: 18),
          child: Text(
            'Anunciante',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(16),
          color: Colors.grey[200],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                ad.user!.name!,
                style: const TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10),
              Text(
                'Na XLO desde ${ad.user!.createdAt!.formattedDate()}',
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
