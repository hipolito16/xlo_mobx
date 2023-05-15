import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageSourceModal extends StatelessWidget {
  const ImageSourceModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return BottomSheet(
        onClosing: () {},
        builder: (_) => Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextButton(
              onPressed: () {
                getFromCamera();
              },
              child: const Text('Câmera'),
            ),
            TextButton(
              onPressed: () {
                getFromGallery();
              },
              child: const Text('Galeria'),
            ),
          ],
        ),
      );
    } else {
      return CupertinoActionSheet(
        title: const Text('Selecionar foto para o anúncio'),
        message: const Text('Escolha a origem da foto'),
        cancelButton: CupertinoActionSheetAction(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancelar',
              style: TextStyle(
                color: Colors.red,
              )),
        ),
        actions: [
          CupertinoActionSheetAction(
            onPressed: () {
              getFromCamera();
            },
            child: const Text('Câmera'),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              getFromGallery();
            },
            child: const Text('Galeria'),
          ),
        ],
      );
    }
  }

  void getFromCamera() {}

  void getFromGallery() {}
}
