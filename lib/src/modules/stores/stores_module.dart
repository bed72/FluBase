import 'package:flutter_modular/flutter_modular.dart';

import 'package:ohh_ferta/src/common/modules/base_module.dart';

import 'package:ohh_ferta/src/modules/stores/presentation/screens/stores_screen.dart';

final class StoresModule extends BaseModule {
  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => const StoresScreen());
  }
}
