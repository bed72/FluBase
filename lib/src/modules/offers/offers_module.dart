import 'package:flutter_modular/flutter_modular.dart';

import 'package:ohh_ferta/src/common/modules/base_module.dart';

import 'package:ohh_ferta/src/modules/offers/data/mappers/offers_mapper.dart';

import 'package:ohh_ferta/src/modules/offers/presentation/offers/offers_state.dart';
import 'package:ohh_ferta/src/modules/offers/presentation/offers/offers_screen.dart';

final class OffersModule extends BaseModule {
  @override
  void binds(Injector i) {
    i.add<OffersMapper>(OffersMapper.new);
    i.addSingleton<OffersState>(OffersState.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (_) => OffersScreen(state: Modular.get<OffersState>()),
    );
  }
}
