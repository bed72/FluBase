import 'package:flutter_modular/flutter_modular.dart';

import 'package:ohh_ferta/src/common/modules/base_module.dart';

import 'package:ohh_ferta/src/modules/offers/data/mappers/offer_mapper.dart';

import 'package:ohh_ferta/src/modules/offers/presentation/offers/offers_state.dart';
import 'package:ohh_ferta/src/modules/offers/presentation/offers/offers_screen.dart';

import 'package:ohh_ferta/src/modules/offers/domain/usecases/get_all_offers_use_case.dart';

final class OffersModule extends BaseModule {
  @override
  void binds(Injector i) {
    i.add<OfferMapper>(OfferMapper.new);
    i.add<GetAllOffersUseCase>(GetAllOffersUseCaseImpl.new);
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
