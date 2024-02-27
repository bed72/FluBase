import 'package:flutter/material.dart';

import 'package:ohh_ferta/src/presentation/extensions/context_extension.dart';

import 'package:ohh_ferta/src/presentation/ui/routes/routes.dart';
import 'package:ohh_ferta/src/presentation/ui/screens/stores/stores_screen.dart';
import 'package:ohh_ferta/src/presentation/ui/screens/explore/explore_screen.dart';

import 'package:ohh_ferta/src/presentation/ui/screens/offers/offers_screen.dart';
import 'package:ohh_ferta/src/presentation/ui/screens/offers/states/offers_state.dart';

import 'package:ohh_ferta/src/presentation/ui/screens/home/widgets/header_widget.dart';

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
  bool hasAppBar = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _handlerHeaderWidget(),
      body: <Widget>[
        OffersScreen(state: widget.offersState),
        StoresScreen(),
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

  PreferredSize? _handlerHeaderWidget() {
    final widget = switch (screens) {
      0 => _headerOffersWidget(),
      1 => _headerStoresWidget(),
      _ => null,
    };

    setState(() => widget);

    return widget;
  }

  PreferredSize _headerStoresWidget() => const PreferredSize(
        preferredSize: Size(double.infinity, 56),
        child: HeaderWidget(title: 'Lojas'),
      );

  PreferredSize _headerOffersWidget() => PreferredSize(
        preferredSize: const Size(double.infinity, 56),
        child: HeaderWidget(
          hasActions: true,
          title: 'Bem vindo!',
          hasNotification: true,
          navigateToCreateStore: () {},
          navigateToNotifications: () =>
              Navigator.pushNamed(context, Routes.notifications),
        ),
      );
}
