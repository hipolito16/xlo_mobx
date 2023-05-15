import 'package:xlo_mobx/screens/login/login_screen.dart';
import 'package:xlo_mobx/stores/user_manager_store.dart';
import 'package:xlo_mobx/stores/page_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class CustomDrawerHeader extends StatelessWidget {
  CustomDrawerHeader({super.key});

  final UserManagerStore userManagerStore = GetIt.I<UserManagerStore>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
        if (userManagerStore.isLoggedIn) {
          GetIt.I<PageStore>().setPage(4);
        } else {
          Navigator.of(context).push(MaterialPageRoute(builder: (_) => LoginScreen()));
        }
      },
      child: Container(
        color: Colors.purple,
        height: 95,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            const Icon(Icons.person, color: Colors.white, size: 50),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Observer(builder: (_) {
                    return Text(
                      userManagerStore.isLoggedIn ? userManagerStore.user!.name! : 'Acesse sua conta agora!',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    );
                  }),
                  const SizedBox(height: 5),
                  Observer(builder: (_) {
                    return Text(
                      userManagerStore.isLoggedIn ? userManagerStore.user!.email! : 'Clique aqui',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
