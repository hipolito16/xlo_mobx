import 'package:flutter/material.dart';

class ImageDialog extends StatelessWidget {
  const ImageDialog({required this.image, required this.onDelete, Key? key}) : super(key: key);

  final dynamic image;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Image.file(image),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              onDelete();
            },
            child: const Text('Excluir', style: TextStyle(color: Colors.red)),
          ),
          TextButton(onPressed: Navigator.of(context).pop, child: const Text('Cancelar')),
        ],
      ),
    );
  }
}
