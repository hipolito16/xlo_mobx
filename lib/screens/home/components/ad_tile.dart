import 'package:cached_network_image/cached_network_image.dart';
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
                  child: CachedNetworkImage(
                    imageUrl: ad.images!.isEmpty ? 'https://static.thenounproject.com/png/194055-200.png' : ad.images!.first,
                    fit: BoxFit.cover,
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
                      Text('R\$ ${ad.preco}', style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w700, color: Colors.purple)),
                      Text('${ad.createdAt} - ${ad.address!.cidade!.nome} - ${ad.address!.uf!.sigla}', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w300)),
                    ],
                  ),
                ))
              ],
            )));
  }
}
