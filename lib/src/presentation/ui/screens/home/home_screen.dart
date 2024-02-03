import 'package:flutter/material.dart';

import 'package:ohh_ferta/src/presentation/extensions/context_extension.dart';

import 'package:ohh_ferta/src/presentation/ui/screens/stores/stores_screen.dart';
import 'package:ohh_ferta/src/presentation/ui/screens/explore/explore_screen.dart';

import 'package:ohh_ferta/src/presentation/ui/screens/offers/offers_screen.dart';
import 'package:ohh_ferta/src/presentation/ui/screens/offers/states/offers_state.dart';

class HomeScreen extends StatefulWidget {
  final OffersState offersState;

  const HomeScreen({
    super.key,
    required this.offersState,
  });

  @override
  State<HomeScreen> createState() => _NavigationBarScreenState();
}

class _NavigationBarScreenState extends State<HomeScreen> {
  int screens = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: <Widget>[
        OffersScreen(state: widget.offersState),
        const StoresScreen(),
        const ExploreScreen(),
      ][screens],
      bottomNavigationBar: NavigationBar(
        elevation: 0,
        selectedIndex: screens,
        indicatorColor: context.colors.background,
        backgroundColor: context.colors.background,
        onDestinationSelected: (index) => setState(() => screens = index),
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
}
