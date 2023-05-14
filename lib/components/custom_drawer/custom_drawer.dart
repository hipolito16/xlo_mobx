import 'package:xlo_mobx/components/custom_drawer/custom_drawer_header.dart';
import 'package:xlo_mobx/components/custom_drawer/page_section.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.horizontal(right: Radius.circular(50)),
      child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.65,
          child: Drawer(
              child: ListView(
            children: [
              const CustomDrawerHeader(),
              PageSection(),
            ],
          ))),
    );
  }
}
