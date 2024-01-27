import 'package:flutter_modular/flutter_modular.dart';

import 'package:ohh_ferta/src/modules/offers/offers_module.dart';
import 'package:ohh_ferta/src/modules/stores/stores_module.dart';
import 'package:ohh_ferta/src/modules/explore/explore_module.dart';
import 'package:ohh_ferta/src/modules/home/presentation/screens/home_screen.dart';

final class HomeModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (_) => const HomeScreen(),
      children: [
        ModuleRoute(
          '/offers/',
          module: OffersModule(),
          transition: TransitionType.fadeIn,
        ),
        ModuleRoute(
          '/stores/',
          module: StoresModule(),
          transition: TransitionType.fadeIn,
        ),
        ModuleRoute(
          '/explore/',
          module: ExploreModule(),
          transition: TransitionType.fadeIn,
        ),
      ],
    );
  }
}
