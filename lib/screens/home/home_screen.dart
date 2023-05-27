import 'package:xlo_mobx/screens/home/components/create_ad_button.dart';
import 'package:xlo_mobx/components/custom_drawer/custom_drawer.dart';
import 'package:xlo_mobx/screens/home/components/search_dialog.dart';
import 'package:xlo_mobx/screens/home/components/ad_tile.dart';
import 'package:xlo_mobx/screens/home/components/top_bar.dart';
import 'package:xlo_mobx/stores/home_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeStore homeStore = GetIt.I<HomeStore>();

  final ScrollController scrollController = ScrollController();

  openSearch(BuildContext context) async {
    final search = await showDialog(context: context, builder: (_) => SearchDialog(currentSearch: homeStore.search));
    if (search != null) homeStore.setSearch(search);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const CustomDrawer(),
        appBar: AppBar(
          title: Observer(builder: (_) {
            if (homeStore.search.isEmpty) {
              return Container();
            } else {
              return GestureDetector(
                onTap: () => openSearch(context),
                child: LayoutBuilder(builder: (_, constraints) {
                  return SizedBox(
                    width: constraints.biggest.width,
                    child: Text(
                      homeStore.search,
                    ),
                  );
                }),
              );
            }
          }),
          actions: [
            Observer(builder: (_) {
              if (homeStore.search.isEmpty) {
                return IconButton(
                  onPressed: () {
                    openSearch(context);
                  },
                  icon: const Icon(Icons.search),
                );
              }
              return IconButton(
                onPressed: () {
                  homeStore.setSearch('');
                },
                icon: const Icon(Icons.close),
              );
            }),
          ],
        ),
        body: Column(
          children: [
            TopBar(),
            Expanded(
              child: Stack(
                children: [
                  Observer(builder: (_) {
                    if (homeStore.showProgress) {
                      return const Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(Colors.white),
                        ),
                      );
                    } else if (homeStore.adList.isEmpty) {
                      return const Padding(
                          padding: EdgeInsets.all(8),
                          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                            Icon(Icons.border_clear, size: 100, color: Colors.white),
                            SizedBox(height: 8),
                            Text('Nenhum anúncio encontrado!', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white)),
                          ]));
                    } else {
                      return ListView.builder(
                        controller: scrollController,
                        itemCount: homeStore.itemCount,
                        itemBuilder: (_, index) {
                          if (index < homeStore.adList.length) return AdTile(homeStore.adList[index]);
                          homeStore.loadNextPage();
                          return const SizedBox(
                              height: 10,
                              child: LinearProgressIndicator(
                                valueColor: AlwaysStoppedAnimation(Colors.purple),
                              ));
                        },
                      );
                    }
                  }),
                  Positioned(
                    bottom: -50,
                    left: 0,
                    right: 0,
                    child: CreateAdButton(scrollController),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
