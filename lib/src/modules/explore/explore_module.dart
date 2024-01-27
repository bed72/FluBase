import 'package:flutter_modular/flutter_modular.dart';

import 'package:ohh_ferta/src/common/modules/base_module.dart';

import 'package:ohh_ferta/src/modules/explore/presentation/screens/explore_screen.dart';

final class ExploreModule extends BaseModule {
  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => const ExploreScreen());
  }
}
