import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({this.altura, this.cor, Key? key}) : super(key: key);

  final double? altura;
  final Color? cor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: altura,
      color: cor,
    );
  }
}
