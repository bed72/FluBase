import 'package:either_dart/either.dart';

import 'package:pocketbase/pocketbase.dart';

import 'package:ohh_ferta/src/domain/parameters/base_parameter.dart';

import 'package:ohh_ferta/src/external/clients/pocket_base_client.dart';

typedef PocketBaseDataSourceType = Either<String, ResultList<RecordModel>>;

abstract interface class PocketBaseDataSource {
  Future<PocketBaseDataSourceType> getList({
    required String collection,
    BaseParameter? parameter,
  });
}

final class PocketBaseDataSourceImpl implements PocketBaseDataSource {
  final PocketBaseClient _client;

  PocketBaseDataSourceImpl({
    required PocketBaseClient client,
  }) : _client = client;

  @override
  Future<PocketBaseDataSourceType> getList({
    required String collection,
    BaseParameter? parameter,
  }) async {
    try {
      return Right(await _client().collection(collection).getList());
    } on ClientException catch (exception) {
      return Left(exception.response.toString());
    } catch (_) {
      return const Left(
        "Ops! Algo deu errado. Parece que encontramos um probleminha. Por favor, tente novamente mais tarde",
      );
    }
  }
}
