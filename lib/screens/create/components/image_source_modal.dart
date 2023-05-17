import 'dart:io';

import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageSourceModal extends StatelessWidget {
  const ImageSourceModal(this.onImageSelected, {Key? key}) : super(key: key);

  final Function(File) onImageSelected;

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
              onPressed: getFromCamera,
              child: const Text('Câmera'),
            ),
            TextButton(
              onPressed: getFromGallery,
              child: const Text('Galeria'),
            ),
            TextButton(onPressed: Navigator.of(context).pop, child: const Text('Cancelar')),
          ],
        ),
      );
    } else {
      return CupertinoActionSheet(
        title: const Text('Selecionar foto para o anúncio'),
        message: const Text('Escolha a origem da foto'),
        cancelButton: CupertinoActionSheetAction(
          onPressed: Navigator.of(context).pop,
          child: const Text('Cancelar',
              style: TextStyle(
                color: Colors.red,
              )),
        ),
        actions: [
          CupertinoActionSheetAction(
            onPressed: getFromCamera,
            child: const Text('Câmera'),
          ),
          CupertinoActionSheetAction(
            onPressed: getFromGallery,
            child: const Text('Galeria'),
          ),
        ],
      );
    }
  }

  Future<void> getFromCamera() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile == null) return;
    imageSelected(File(pickedFile.path));
  }

  Future<void> getFromGallery() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile == null) return;
    imageSelected(File(pickedFile.path));
  }

  Future<void> imageSelected(File image) async {
    final croppedFile = await ImageCropper().cropImage(sourcePath: image.path, aspectRatio: const CropAspectRatio(ratioX: 1.0, ratioY: 1.0), uiSettings: [AndroidUiSettings(toolbarTitle: 'Editar Imagem', toolbarColor: Colors.purple, toolbarWidgetColor: Colors.white), IOSUiSettings(title: 'Editar Imagem', cancelButtonTitle: 'Cancelar', doneButtonTitle: 'Concluir')]);
    if (croppedFile == null) return;
    final file = File(croppedFile.path);
    onImageSelected(file);
  }
}
