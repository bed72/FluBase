import 'package:regex_router/regex_router.dart';

import 'package:ohh_ferta/src/external/container/container.dart';

import 'package:ohh_ferta/src/presentation/ui/screens/home/home_screen.dart';
import 'package:ohh_ferta/src/presentation/ui/screens/offers/states/offers_state.dart';

enum Routes {
  root(path: '/'),
  offers(path: '/offers/'),
  stores(path: '/stores/'),
  explore(path: '/explore/');

  final String path;

  const Routes({required this.path});
}

final routes = RegexRouter.create({
  Routes.root.path: (_, __) => HomeScreen(
        offersState: container.get<OffersState>(),
      ),
});
