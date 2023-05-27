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
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Anúncio'),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            ListView(
              children: [
                SizedBox(
                  height: 280,
                  child: Carousel(
                    images: ad.images!.map((url) {
                      return Image(image: CachedNetworkImageProvider(url));
                    }).toList(),
                    dotSize: 4,
                    dotBgColor: Colors.transparent,
                    dotColor: Colors.orange,
                    autoplay: false,
                  ),
                ),
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
                      const SizedBox(height: 120),
                    ],
                  ),
                )
              ],
            ),
            BottomBar(ad),
          ],
        ));
  }
}
