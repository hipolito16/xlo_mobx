import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  SectionTitle({this.title, Key? key}) : super(key: key);

  String? title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Text(
        title!,
        style: const TextStyle(
          color: Colors.purple,
          fontSize: 13,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
