import 'package:either_dart/either.dart';

import 'package:ohh_ferta/src/modules/core/data/mappers/pager/pager_mapper.dart';

import 'package:ohh_ferta/src/modules/core/domain/parameters/base_parameter.dart';
import 'package:ohh_ferta/src/modules/core/domain/entities/pager/pager_entity.dart';

import 'package:ohh_ferta/src/modules/core/external/datasources/pocketbase_data_source.dart';

typedef PocketBaseRepositoryType = Either<String, PagerEntity>;

abstract interface class PockeBaseRepository {
  Future<PocketBaseRepositoryType> getAll(
    BaseParameter? parameter, {
    required String collection,
  });
}

final class PockeBaseRepositoryImpl implements PockeBaseRepository {
  final PockeBaseMapper _mapper;
  final PocketBaseDataSource _dataSource;

  PockeBaseRepositoryImpl({
    required PockeBaseMapper mapper,
    required PocketBaseDataSource dataSource,
  })  : _mapper = mapper,
        _dataSource = dataSource;

  @override
  Future<PocketBaseRepositoryType> getAll(
    BaseParameter? parameter, {
    required String collection,
  }) async {
    final response =
        await _dataSource.getList(collection: collection, parameter: parameter);

    return response.either(
      (failure) => failure,
      (success) => _mapper(success.toJson()).toEntity(),
    );
  }
}
