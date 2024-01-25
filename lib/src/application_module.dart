import 'package:flutter_modular/flutter_modular.dart';

import 'package:ohh_ferta/src/common/modules/base_module.dart';

import 'package:ohh_ferta/src/modules/offers/offers_module.dart';

final class ApplicationModule extends BaseModule {
  @override
  void routes(r) {
    r.module('/offers/', module: OffersModule());
  }
}
