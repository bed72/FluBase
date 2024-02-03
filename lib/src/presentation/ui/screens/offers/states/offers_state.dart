import 'package:signals/signals_flutter.dart';

import 'package:ohh_ferta/src/domain/constants/constants.dart';

import 'package:ohh_ferta/src/domain/models/offers/offers_model.dart';
import 'package:ohh_ferta/src/data/mappers/offers/offers_mapper.dart';

import 'package:ohh_ferta/src/domain/repositories/remote_repository.dart';

class OffersState {
  final OffersMapper _mapper;
  final RemoteRepository _repository;

  final _offers = asyncSignal<List<OfferModel>>(AsyncLoading());
  AsyncSignal<List<OfferModel>> get offers => _offers;

  OffersState({
    required OffersMapper mapper,
    required RemoteRepository repository,
  })  : _mapper = mapper,
        _repository = repository;

  Future<void> call() async {
    final response = await _repository(path: basePath('/offers'));

    response.fold(
      (failure) => _offers.set(AsyncError(failure, null)),
      (success) => _offers.set(AsyncData(_mapper(success.items))),
    );
  }
}
