import 'package:cached_network_image/cached_network_image.dart';
import 'package:xlo_mobx/stores/myads_store.dart';
import 'package:xlo_mobx/helpers/extensions.dart';
import 'package:xlo_mobx/models/ad.dart';
import 'package:flutter/material.dart';

class SoldTile extends StatelessWidget {
  const SoldTile(this.myAdsStore, this.ad, {Key? key}) : super(key: key);

  final MyAdsStore myAdsStore;
  final Ad ad;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 4,
      child: SizedBox(
        height: 80,
        child: Row(
          key: Key(ad.id!),
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: CachedNetworkImage(
                imageUrl: ad.images!.isEmpty ? 'https://static.thenounproject.com/png/194055-200.png' : ad.images![0],
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
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
                  ],
                ),
              ),
            ),
            Column(
              children: [IconButton(onPressed: () {}, icon: const Icon(Icons.delete, size: 20, color: Colors.purple))],
            )
          ],
        ),
      ),
    );
  }
}
