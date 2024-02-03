import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';

import 'package:ohh_ferta/src/common/screens/screens.dart';
import 'package:ohh_ferta/src/common/extensions/context_extension.dart';

class NavigationBarScreen extends StatefulWidget {
  const NavigationBarScreen({super.key});

  @override
  State<NavigationBarScreen> createState() => _NavigationBarScreenState();
}

class _NavigationBarScreenState extends State<NavigationBarScreen> {
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
    if (index == 0) _navigateTo(Screens.offers.path);
    if (index == 1) _navigateTo(Screens.stores.path);
    if (index == 2) _navigateTo(Screens.explore.path);

    setState(() => screens = index);
  }

  void _navigateTo(String path) => Modular.to.navigate(path);
}
