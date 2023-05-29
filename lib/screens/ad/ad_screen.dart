import 'package:xlo_mobx/screens/ad/components/description_panel.dart';
import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';
import 'package:xlo_mobx/screens/ad/components/location_panel.dart';
import 'package:xlo_mobx/screens/ad/components/bottom_bar.dart';
import 'package:xlo_mobx/screens/ad/components/main_panel.dart';
import 'package:xlo_mobx/screens/ad/components/user_panel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:xlo_mobx/components/custom_divider.dart';
import 'package:xlo_mobx/models/ad.dart';
import 'package:flutter/material.dart';

class AdScreen extends StatelessWidget {
  const AdScreen(this.ad, {Key? key}) : super(key: key);

  final Ad ad;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          key: PageStorageKey(ad.id),
          slivers: [
            SliverAppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.of(context).pop(),
              ),
              expandedHeight: 300,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    const ColoredBox(color: Colors.purple),
                    Hero(
                      tag: ad.id!,
                      child: Carousel(
                        images: ad.images!.map((url) {
                          return Image(width: double.infinity, image: CachedNetworkImageProvider(url));
                        }).toList(),
                        dotSize: 4,
                        dotBgColor: Colors.transparent,
                        dotColor: Colors.orange,
                        autoplay: false,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Container(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            MainPanel(ad),
                            const CustomDivider(altura: 0.6, cor: Colors.grey),
                            DescriptionPanel(ad),
                            const CustomDivider(altura: 0.6, cor: Colors.grey),
                            LocationPanel(ad),
                            const CustomDivider(altura: 0.6, cor: Colors.grey),
                            UserPanel(ad),
                            const SizedBox(height: 16),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                BottomBar(ad),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
