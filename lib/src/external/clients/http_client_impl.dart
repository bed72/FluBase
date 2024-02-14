import 'package:dio/dio.dart';

import 'package:either_dart/either.dart';

import 'package:ohh_ferta/src/data/clients/http_client.dart';

import 'package:ohh_ferta/src/domain/constants/constants.dart';

BaseOptions get options => BaseOptions(
      baseUrl: baseUrl,
      headers: {
        'Content-Type': 'application/json',
      },
    );

final class HttpClientImpl implements HttpClient {
  final Dio _http;

  HttpClientImpl({required Dio http}) : _http = http;

  @override
  Future<HttpType> call({
    required String path,
    required Methods method,
    Map<String, dynamic>? body,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final Response(:data) = await _http.request(
        path,
        data: body,
        queryParameters: query,
        options: Options(
          headers: headers,
          method: method.value,
        ),
      );

      return Right(data);
    } on DioException catch (failure) {
      return Left({'message': failure.message});
    } catch (_) {
      return const Left({'message': 'Opss, um erro aconteceu.'});
    }
  }
}
