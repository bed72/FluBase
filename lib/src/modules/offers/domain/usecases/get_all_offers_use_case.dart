import 'package:either_dart/either.dart';

import 'package:ohh_ferta/src/modules/offers/data/mappers/offers_mapper.dart';
import 'package:ohh_ferta/src/modules/offers/domain/entities/offers_entity.dart';

import 'package:ohh_ferta/src/modules/core/data/repositories/http_repository.dart';

typedef GetAllOffersUseCaseType = Either<String, List<OfferEntity>>;

abstract interface class GetAllOffersUseCase {
  Future<GetAllOffersUseCaseType> call({
    required String path,
    Map<String, dynamic>? query,
  });
}

final class GetAllOffersUseCaseImpl implements GetAllOffersUseCase {
  final OffersMapper _mapper;
  final HttpRepository _repository;

  GetAllOffersUseCaseImpl({
    required OffersMapper mapper,
    required HttpRepository repository,
  })  : _mapper = mapper,
        _repository = repository;

  @override
  Future<GetAllOffersUseCaseType> call({
    required String path,
    Map<String, dynamic>? query,
  }) async {
    final response = await _repository(
      path: path,
      query: query,
    );

    return response.either(
      (failure) => failure.message,
      (success) =>
          _mapper(success.items).map((offer) => offer.toEntity()).toList(),
    );
  }
}
