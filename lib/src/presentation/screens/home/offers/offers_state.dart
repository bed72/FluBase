import 'package:signals/signals_flutter.dart';

import 'package:ohh_ferta/src/presentation/states/states.dart';

import 'package:ohh_ferta/src/domain/entities/offers/offers_entity.dart';
import 'package:ohh_ferta/src/domain/usecases/offers/get_all_offers_use_case.dart';

class OffersState implements States {
  final GetAllOffersUseCase _useCase;

  final state = asyncSignal<List<OfferEntity>>(AsyncLoading());

  OffersState({
    required GetAllOffersUseCase useCase,
  }) : _useCase = useCase;

  @override
  Future<void> execute() async {
    final response = await _useCase(collection: 'offers', null);

    response.fold(
      (failure) => state.set(AsyncError(failure, null)),
      (success) => state.set(AsyncData(success)),
    );
  }
}
