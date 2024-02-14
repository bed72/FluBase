import 'package:ohh_ferta/src/data/mappers/mapper.dart';
import 'package:ohh_ferta/src/data/clients/http_client.dart';

import 'package:ohh_ferta/src/domain/constants/constants.dart';
import 'package:ohh_ferta/src/domain/models/responses/failure_model.dart';
import 'package:ohh_ferta/src/domain/models/responses/success_model.dart';
import 'package:ohh_ferta/src/domain/repositories/remote_repository.dart';

final class RemoteRepositoryImpl implements RemoteRepository {
  final HttpClient _client;
  final JsonMapper<FailureModel> _failure;
  final JsonMapper<SuccessModel> _success;

  RemoteRepositoryImpl({
    required HttpClient client,
    required JsonMapper<FailureModel> failure,
    required JsonMapper<SuccessModel> success,
  })  : _client = client,
        _failure = failure,
        _success = success;

  @override
  Future<RemoteRepositoryType> call({
    required String path,
    Map<String, dynamic>? body,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
    Methods method = Methods.get,
  }) async {
    final response = await _client(
      path: path,
      body: body,
      query: query,
      method: method,
      headers: headers,
    );

    return response
        .map((success) => _success(success))
        .mapLeft((failure) => _failure(failure));
  }
}
