import 'package:either_dart/either.dart';

import 'package:ohh_ferta/src/modules/core/data/mappers/mapper.dart';
import 'package:ohh_ferta/src/modules/core/data/models/failure_model.dart';
import 'package:ohh_ferta/src/modules/core/data/models/success_model.dart';

import 'package:ohh_ferta/src/modules/core/external/options/http_options.dart';
import 'package:ohh_ferta/src/modules/core/external/clients/http_client.dart';

import 'package:ohh_ferta/src/modules/core/domain/entities/failure_entity.dart';
import 'package:ohh_ferta/src/modules/core/domain/entities/success_entity.dart';

typedef RepositoryType = Either<FailureEntity, SuccessEntity>;

abstract interface class HttpRepository {
  Future<RepositoryType> call({
    required String path,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
    HttpMethod method = HttpMethod.get,
  });
}

final class HttpRepositoryImpl implements HttpRepository {
  final HttpClient _client;
  final JsonMapper<FailureModel> _failure;
  final JsonMapper<SuccessModel> _success;

  HttpRepositoryImpl({
    required HttpClient client,
    required JsonMapper<FailureModel> failure,
    required JsonMapper<SuccessModel> success,
  })  : _client = client,
        _failure = failure,
        _success = success;

  @override
  Future<RepositoryType> call({
    required String path,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
    HttpMethod method = HttpMethod.get,
  }) async {
    final response = await _client(
      path: path,
      data: data,
      query: query,
      method: method,
      headers: headers,
    );

    return response
        .map((success) => _success(success).toEntity())
        .mapLeft((failure) => _failure(failure).toEntity());
  }
}
