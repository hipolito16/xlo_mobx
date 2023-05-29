import 'package:xlo_mobx/components/custom_drawer/custom_drawer.dart';
import 'package:xlo_mobx/screens/myads/myads_screen.dart';
import 'package:xlo_mobx/components/custom_divider.dart';
import 'package:xlo_mobx/stores/user_manager_store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Minha conta'), centerTitle: true),
      drawer: const CustomDrawer(),
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 32),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 8,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 140,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(GetIt.I<UserManagerStore>().user!.name!, style: const TextStyle(fontSize: 20, color: Colors.purple, fontWeight: FontWeight.w900)),
                          Text(GetIt.I<UserManagerStore>().user!.email!, style: TextStyle(fontSize: 16, color: Colors.grey[700])),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text('EDITAR', style: TextStyle(color: Colors.purple)),
                      ),
                    ),
                  ],
                ),
              ),
              const CustomDivider(altura: 0.1, cor: Colors.grey),
              ListTile(
                title: const Text('Meus anúncios', style: TextStyle(color: Colors.purple, fontWeight: FontWeight.w600)),
                trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.purple),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => const MyAdsScreen()));
                },
              ),
              const CustomDivider(altura: 0.1, cor: Colors.grey),
              ListTile(
                title: const Text('Favoritos', style: TextStyle(color: Colors.purple, fontWeight: FontWeight.w600)),
                trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.purple),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
