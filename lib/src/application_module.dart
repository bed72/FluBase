import 'package:flutter_modular/flutter_modular.dart';

import 'package:ohh_ferta/src/modules/offers/offers_module.dart';
import 'package:ohh_ferta/src/modules/stores/stores_module.dart';
import 'package:ohh_ferta/src/modules/explore/explore_module.dart';

import 'package:ohh_ferta/src/common/modules/base_module.dart';

import 'package:ohh_ferta/src/common/screens/screens.dart';
import 'package:ohh_ferta/src/common/screens/navigation_bar_screen.dart';

final class ApplicationModule extends BaseModule {
  @override
  void routes(r) {
    r.child(
      Screens.root.path,
      child: (_) => const NavigationBarScreen(),
      children: [
        ModuleRoute(
          Screens.offers.path,
          module: OffersModule(),
          transition: TransitionType.fadeIn,
        ),
        ModuleRoute(
          Screens.stores.path,
          module: StoresModule(),
          transition: TransitionType.fadeIn,
        ),
        ModuleRoute(
          Screens.explore.path,
          module: ExploreModule(),
          transition: TransitionType.fadeIn,
        ),
      ],
    );
    /*r.match(
      '/home/:n1/:n2?with=milk/',
      pattern: r'\/home\/[^\/]+\/[^\/]+\?with=milk',
      defaultScreen: OneScreen(uri: Modular.args.uri.toString()),
      fallbackScreen: NotFoundScreen(uri: Modular.args.uri.toString()),
    );*/
  }
}
