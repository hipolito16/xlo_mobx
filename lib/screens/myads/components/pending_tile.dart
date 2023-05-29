import 'package:cached_network_image/cached_network_image.dart';
import 'package:xlo_mobx/screens/ad/ad_screen.dart';
import 'package:xlo_mobx/stores/myads_store.dart';
import 'package:xlo_mobx/helpers/extensions.dart';
import 'package:xlo_mobx/models/ad.dart';
import 'package:flutter/material.dart';

class PendingTile extends StatelessWidget {
  const PendingTile(this.myAdsStore, this.ad, {Key? key}) : super(key: key);

  final MyAdsStore myAdsStore;
  final Ad ad;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => AdScreen(ad)));
      },
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 4,
        child: SizedBox(
          height: 80,
          child: Row(
            key: Key(ad.id!),
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Hero(
                  tag: ad.id!,
                  child: CachedNetworkImage(
                    imageUrl: ad.images!.isEmpty ? 'https://static.thenounproject.com/png/194055-200.png' : ad.images![0],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        ad.titulo!,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Text(
                        ad.preco!.formattedMoney(),
                        style: const TextStyle(fontWeight: FontWeight.w400),
                      ),
                      const Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Icon(Icons.access_time, color: Colors.orange, size: 15),
                          SizedBox(width: 4),
                          Text(
                            'AGUARDANDO PUBLICAÇÃO',
                            style: TextStyle(
                              color: Colors.orange,
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
