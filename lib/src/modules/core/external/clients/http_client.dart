import 'package:dio/dio.dart';

import 'package:either_dart/either.dart';

import 'package:ohh_ferta/src/modules/core/external/options/http_options.dart';

typedef HttpType = Either<Map<String, dynamic>, Map<String, dynamic>>;

abstract interface class HttpClient {
  Future<HttpType> call({
    required String path,
    required HttpMethod method,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
  });
}

final class HttpClientImpl implements HttpClient {
  final Dio _http;

  HttpClientImpl({required Dio http}) : _http = http;

  @override
  Future<HttpType> call({
    required String path,
    required HttpMethod method,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _http.request(
        path,
        data: data,
        queryParameters: query,
        options: Options(
          headers: headers,
          method: method.value,
        ),
      );

      return Right(response.data);
    } on DioException catch (failure) {
      return Left({'message': failure.message});
    } catch (_) {
      return const Left({'message': 'Opss, um erro aconteceu.'});
    }
  }
}
