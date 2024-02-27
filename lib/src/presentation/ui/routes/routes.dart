import 'package:flutter/material.dart';

import 'package:page_transition/page_transition.dart';

import 'package:ohh_ferta/src/external/ioc/ioc.dart';
import 'package:ohh_ferta/src/presentation/ui/screens/offer/offer_screen.dart';

import 'package:ohh_ferta/src/presentation/ui/screens/home/home_screen.dart';
import 'package:ohh_ferta/src/presentation/ui/screens/offers/states/offers_state.dart';
import 'package:ohh_ferta/src/presentation/ui/screens/notifications/notifications_screen.dart';

abstract class Routes {
  static const root = '/';
  static const offer = '/offer';
  static const notifications = '/notifications';
}

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.root:
      return PageTransition(
        type: PageTransitionType.fade,
        child: HomeScreen(offersState: ioc.get<OffersState>()),
      );
    case Routes.offer:
      return PageTransition(
        type: PageTransitionType.fade,
        child: OfferScreen(id: settings.arguments as String),
      );
    case Routes.notifications:
      return PageTransition(
        child: const NotificationsScreen(),
        type: PageTransitionType.rightToLeft,
      );
    default:
      return PageTransition(
        type: PageTransitionType.fade,
        child: const Scaffold(
          body: Center(
            child: Text('Ops'),
          ),
        ),
      );
  }
}
