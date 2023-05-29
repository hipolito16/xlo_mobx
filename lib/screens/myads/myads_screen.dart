import 'package:xlo_mobx/screens/myads/components/pending_tile.dart';
import 'package:xlo_mobx/screens/myads/components/active_tile.dart';
import 'package:xlo_mobx/screens/myads/components/sold_tile.dart';
import 'package:xlo_mobx/stores/myads_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';

class MyAdsScreen extends StatefulWidget {
  const MyAdsScreen({Key? key}) : super(key: key);

  @override
  State<MyAdsScreen> createState() => _MyAdsScreenState();
}

class _MyAdsScreenState extends State<MyAdsScreen> with SingleTickerProviderStateMixin {
  final MyAdsStore myAdsStore = MyAdsStore();
  TabController? tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Meus anúncios'),
          centerTitle: true,
          bottom: TabBar(controller: tabController, indicatorColor: Colors.orange, tabs: const [
            Tab(child: Text('ATIVOS', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600))),
            Tab(child: Text('PENDENTES', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600))),
            Tab(child: Text('VENDIDOS', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600))),
          ])),
      body: TabBarView(controller: tabController, children: [
        Observer(builder: (_) {
          if (myAdsStore.activeAds.isEmpty) {
            return const Center(child: Text('Você não possui nenhum anúncio ativo!'));
          } else {
            return ListView.builder(
                itemCount: myAdsStore.activeAds.length,
                itemBuilder: (_, index) {
                  return ActiveTile(myAdsStore, myAdsStore.activeAds[index]);
                });
          }
        }),
        Observer(builder: (_) {
          if (myAdsStore.pendingAds.isEmpty) {
            return const Center(child: Text('Você não possui nenhum anúncio ativo!'));
          } else {
            return ListView.builder(
                itemCount: myAdsStore.pendingAds.length,
                itemBuilder: (_, index) {
                  return PendingTile(myAdsStore, myAdsStore.pendingAds[index]);
                });
          }
        }),
        Observer(builder: (_) {
          if (myAdsStore.soldAds.isEmpty) {
            return const Center(child: Text('Você não possui nenhum anúncio ativo!'));
          } else {
            return ListView.builder(
                itemCount: myAdsStore.soldAds.length,
                itemBuilder: (_, index) {
                  return SoldTile(myAdsStore, myAdsStore.soldAds[index]);
                });
          }
        }),
      ]),
    );
  }
}
