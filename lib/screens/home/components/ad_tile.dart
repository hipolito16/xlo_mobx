import 'package:cached_network_image/cached_network_image.dart';
import 'package:xlo_mobx/screens/ad/ad_screen.dart';
import 'package:xlo_mobx/helpers/extensions.dart';
import 'package:xlo_mobx/models/ad.dart';
import 'package:flutter/material.dart';

class AdTile extends StatelessWidget {
  const AdTile(this.ad, {Key? key}) : super(key: key);

  final Ad ad;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => AdScreen(ad)));
      },
      child: Container(
          height: 135,
          margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 1),
          child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 8,
              child: Row(
                key: Key(ad.id!),
                children: [
                  SizedBox(
                    height: 135,
                    width: 127,
                    child: Hero(
                      tag: ad.id!,
                      child: CachedNetworkImage(
                        imageUrl: ad.images!.isEmpty ? 'https://static.thenounproject.com/png/194055-200.png' : ad.images!.first,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(ad.titulo!, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                        Text(ad.preco!.formattedMoney(), style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w700)),
                        Text('${ad.createdAt!.formattedDate()} - ${ad.address!.cidade!.nome} - ${ad.address!.uf!.sigla}', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w300)),
                      ],
                    ),
                  ))
                ],
              ))),
    );
  }
}
