import 'package:regex_router/regex_router.dart';

import 'package:ohh_ferta/src/presentation/ui/screens/home/routes/offer_routes.dart';

enum Routes {
  root(path: '/'),
  notifications(path: '/notifications');

  final String path;

  const Routes({required this.path});
}

final routes = RegexRouter.create({
  ...offersRoutes(),
});
