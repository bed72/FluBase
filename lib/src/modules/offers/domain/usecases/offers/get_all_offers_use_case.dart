import 'package:either_dart/either.dart';

import 'package:ohh_ferta/src/modules/core/domain/parameters/base_parameter.dart';

import 'package:ohh_ferta/src/modules/offers/data/mappers/offers/offer_mapper.dart';
import 'package:ohh_ferta/src/modules/core/data/repositories/pocket_base_repository.dart';

import 'package:ohh_ferta/src/modules/offers/domain/entities/offers/offers_entity.dart';

typedef GetAllOffersUseCaseType = Either<String, List<OfferEntity>>;

abstract interface class GetAllOffersUseCase {
  Future<GetAllOffersUseCaseType> call(
    BaseParameter? parameter, {
    required String collection,
  });
}

final class GetAllOffersUseCaseImpl implements GetAllOffersUseCase {
  final OfferMapper _mapper;
  final PockeBaseRepository _repository;

  GetAllOffersUseCaseImpl({
    required OfferMapper mapper,
    required PockeBaseRepository repository,
  })  : _mapper = mapper,
        _repository = repository;

  @override
  Future<GetAllOffersUseCaseType> call(
    BaseParameter? parameter, {
    required String collection,
  }) async {
    final response = await _repository.getAll(
      parameter,
      collection: collection,
    );

    return response.either(
      (failure) => failure,
      (success) =>
          _mapper(success.items).map((offer) => offer.toEntity()).toList(),
    );
  }
}
