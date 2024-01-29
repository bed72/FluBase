import 'package:signals/signals_flutter.dart';

import 'package:ohh_ferta/src/common/constants/constants.dart';

import 'package:ohh_ferta/src/modules/offers/data/mappers/offers_mapper.dart';
import 'package:ohh_ferta/src/modules/offers/data/models/offers_model.dart';

import 'package:ohh_ferta/src/modules/core/data/repositories/http_repository.dart';

class OffersState {
  final OffersMapper _mapper;
  final HttpRepository _repository;

  final offers = asyncSignal<List<OfferModel>>(AsyncLoading());

  OffersState({
    required OffersMapper mapper,
    required HttpRepository repository,
  })  : _mapper = mapper,
        _repository = repository;

  Future<void> call() async {
    final response = await _repository(path: basePath('/offers'));

    response.fold(
      (failure) => offers.set(AsyncError(failure, null)),
      (success) => offers.set(AsyncData(_mapper(success.items))),
    );
  }
}
