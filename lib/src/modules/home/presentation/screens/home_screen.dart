import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';

import 'package:ohh_ferta/src/common/extensions/context_extension.dart';

enum _Screens {
  offers(value: 0, path: '/home/offers/'),
  stores(value: 1, path: '/home/stores/'),
  explore(value: 2, path: '/home/explore/');

  final int value;
  final String path;

  const _Screens({required this.value, required this.path});
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int screens = 0;

  @override
  void initState() {
    super.initState();

    _onDestinationSelected(screens);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const RouterOutlet(),
      bottomNavigationBar: NavigationBar(
        elevation: 0,
        selectedIndex: screens,
        indicatorColor: context.colors.background,
        backgroundColor: context.colors.background,
        onDestinationSelected: _onDestinationSelected,
        destinations: const <Widget>[
          NavigationDestination(
            label: 'Ofertas',
            tooltip: 'Todas as ofertas',
            icon: Icon(Icons.campaign_outlined),
            selectedIcon: Icon(Icons.campaign_rounded),
          ),
          NavigationDestination(
            label: 'Lojas',
            tooltip: 'Todas as lojas',
            icon: Icon(Icons.shopping_basket_outlined),
            selectedIcon: Icon(Icons.shopping_basket_rounded),
          ),
          NavigationDestination(
            label: 'Explore',
            tooltip: 'Descubra novas lojas',
            icon: Icon(Icons.explore_outlined),
            selectedIcon: Icon(Icons.explore_rounded),
          ),
        ],
      ),
    );
  }

  void _onDestinationSelected(int index) {
    if (index == _Screens.offers.value) _navigateTo(_Screens.offers.path);
    if (index == _Screens.stores.value) _navigateTo(_Screens.stores.path);
    if (index == _Screens.explore.value) _navigateTo(_Screens.explore.path);

    setState(() => screens = index);
  }

  void _navigateTo(String path) => Modular.to.navigate(path);
}
