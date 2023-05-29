import 'package:cached_network_image/cached_network_image.dart';
import 'package:xlo_mobx/screens/ad/ad_screen.dart';
import 'package:xlo_mobx/helpers/extensions.dart';
import 'package:xlo_mobx/stores/myads_store.dart';
import 'package:xlo_mobx/models/ad.dart';
import 'package:flutter/material.dart';

class ActiveTile extends StatelessWidget {
  ActiveTile(this.myAdsStore, this.ad, {Key? key}) : super(key: key);

  final MyAdsStore myAdsStore;
  final Ad ad;

  final List<MenuChoice> choices = [
    MenuChoice(index: 0, titulo: 'Editar', iconData: Icons.edit),
    MenuChoice(index: 1, titulo: 'Já vendi', iconData: Icons.thumb_up),
    MenuChoice(index: 2, titulo: 'Excluir', iconData: Icons.delete),
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => AdScreen(ad)));
      },
      child: Card(
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
                      Text(
                        '${ad.views} visitas',
                        style: TextStyle(fontSize: 12, color: Colors.grey[800]),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  PopupMenuButton<MenuChoice>(
                    icon: const Icon(Icons.more_vert, size: 20, color: Colors.purple),
                    onSelected: (choice) {
                      switch (choice.index) {
                        case 0:
                          break;
                        case 1:
                          myAdsStore.setSold(ad);
                          break;
                        case 2:
                          break;
                      }
                    },
                    itemBuilder: (_) {
                      return choices
                          .map((choice) => PopupMenuItem<MenuChoice>(
                                value: choice,
                                child: Row(
                                  children: [
                                    Icon(choice.iconData, size: 20, color: Colors.purple),
                                    const SizedBox(width: 8),
                                    Text(choice.titulo!, style: const TextStyle(fontWeight: FontWeight.w400, color: Colors.purple)),
                                  ],
                                ),
                              ))
                          .toList();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MenuChoice {
  MenuChoice({this.index, this.titulo, this.iconData});

  int? index;
  String? titulo;
  IconData? iconData;
}
