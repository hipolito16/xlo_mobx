import 'dart:io';

import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageSourceModal extends StatelessWidget {
  const ImageSourceModal(this.onImageSelected, {Key? key}) : super(key: key);

  final Function(File) onImageSelected;

  @override
  Widget build(BuildContext context) {
    if (Platform.isWindows) {
      return FutureBuilder<dynamic>(builder: (context, snapshot) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.15,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: TextButton(
                  onPressed: getFromGallery,
                  child: const Text('Galeria'),
                ),
              ),
              Expanded(
                  child: TextButton(
                      onPressed: Navigator.of(context).pop,
                      child: const Text('Cancelar',
                          style: TextStyle(
                            color: Colors.red,
                          )))),
            ],
          ),
        );
      });
    } else if (Platform.isAndroid) {
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
    if (Platform.isWindows) {
      String? path;
      final FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image);
      path = result?.files.single.path;
      if (path == null) return;
      PickedFile pickedFile = PickedFile(path);
      onImageSelected(File(pickedFile.path));
    } else {
      final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedFile == null) return;
      imageSelected(File(pickedFile.path));
    }
  }

  Future<void> imageSelected(File image) async {
    final croppedFile = await ImageCropper().cropImage(sourcePath: image.path, aspectRatio: const CropAspectRatio(ratioX: 1.0, ratioY: 1.0), uiSettings: [AndroidUiSettings(toolbarTitle: 'Editar Imagem', toolbarColor: Colors.purple, toolbarWidgetColor: Colors.white), IOSUiSettings(title: 'Editar Imagem', cancelButtonTitle: 'Cancelar', doneButtonTitle: 'Concluir')]);
    if (croppedFile == null) return;
    final file = File(croppedFile.path);
    onImageSelected(file);
  }
}
