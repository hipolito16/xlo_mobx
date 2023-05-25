import 'package:xlo_mobx/models/ad.dart';
import 'package:flutter/material.dart';

class AdTile extends StatelessWidget {
  const AdTile(this.ad, {Key? key}) : super(key: key);

  final Ad ad;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 135,
        margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 1),
        child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 8,
            child: Row(
              children: [
                SizedBox(
                  height: 135,
                  width: 127,
                  child: Image.network(
                    ad.images!.first,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )));
  }
}
