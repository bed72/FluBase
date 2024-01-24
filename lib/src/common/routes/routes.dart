import 'package:go_router/go_router.dart';

import 'package:ohh_ferta/src/presentation/screens/home/offers/offers_screen.dart';

class Routes {
  static GoRouter get routerConfig => GoRouter(
        initialLocation: '/offers',
        routes: <RouteBase>[
          GoRoute(
            name: 'offers',
            path: '/offers',
            builder: (context, state) => const OffersScreen(),
          ),
        ],
      );
}
