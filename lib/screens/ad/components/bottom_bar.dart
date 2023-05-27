import 'package:url_launcher/url_launcher.dart';
import 'package:xlo_mobx/models/ad.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  const BottomBar(this.ad, {Key? key}) : super(key: key);

  final Ad ad;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 26),
            height: 38,
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(19),
            ),
            child: Row(
              children: [
                if (!ad.hidePhone!)
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      final phone = Uri(scheme: 'tel', path: ad.user!.phone!.replaceAll(RegExp('[^0-9]'), ''));
                      canLaunchUrl(phone);
                    },
                    child: Container(
                      height: 25,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        border: Border(
                          right: BorderSide(color: Colors.black45),
                        ),
                      ),
                      child: const Text('Ligar', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
                    ),
                  )),
                Expanded(
                    child: GestureDetector(
                  child: Container(
                    height: 25,
                    alignment: Alignment.center,
                    child: const Text('Chat', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
                  ),
                )),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Container(
              decoration: BoxDecoration(
                color: const Color.fromRGBO(249, 249, 249, 1),
                border: Border(top: BorderSide(color: Colors.grey[400]!)),
              ),
              height: 38,
              alignment: Alignment.center,
              child: Text(
                '${ad.user!.name!} (anunciante)',
                style: const TextStyle(
                  fontWeight: FontWeight.w300,
                ),
              ))
        ],
      ),
    );
  }
}
