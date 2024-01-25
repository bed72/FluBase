import 'package:signals/signals_flutter.dart';

import 'package:ohh_ferta/src/modules/offers/domain/entities/offers_entity.dart';

import 'package:ohh_ferta/src/modules/offers/domain/usecases/get_all_offers_use_case.dart';

class OffersState {
  final GetAllOffersUseCase _useCase;
  final offers = asyncSignal<List<OfferEntity>>(AsyncLoading());

  OffersState({required GetAllOffersUseCase useCase}) : _useCase = useCase;

  Future<void> call() async {
    final response = await _useCase(collection: 'offers', null);

    response.fold(
      (failure) => offers.set(AsyncError(failure, null)),
      (success) => offers.set(AsyncData(success)),
    );
  }
}
