import 'package:flutter/material.dart';
import 'package:regex_router/regex_router.dart';

import 'package:ohh_ferta/src/external/ioc/ioc.dart';

import 'package:ohh_ferta/src/presentation/ui/routes/routes.dart';
import 'package:ohh_ferta/src/presentation/ui/routes/navigator.dart';

import 'package:ohh_ferta/src/presentation/ui/screens/home/home_screen.dart';
import 'package:ohh_ferta/src/presentation/ui/screens/offers/states/offers_state.dart';
import 'package:ohh_ferta/src/presentation/ui/screens/notifications/notifications_screen.dart';

void _navigateToCreateStore(BuildContext context) {
  navigateRightToLeft(
    context,
    child: const NotificationsScreen(),
  );
}

void _navigateToNotifications(BuildContext context) {
  navigateRightToLeft(
    context,
    child: const NotificationsScreen(),
  );
}

Map<String, RouteBuilder> offersRoutes() => <String, RouteBuilder>{
      Routes.notifications.path: (_, __) => const NotificationsScreen(),
      Routes.root.path: (context, __) => HomeScreen(
            offersState: ioc.get<OffersState>(),
            navigateToCreateStore: () => _navigateToCreateStore(context),
            navigateToNotifications: () => _navigateToNotifications(context),
          ),
    };
