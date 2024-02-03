import 'package:either_dart/either.dart';

import 'package:ohh_ferta/src/domain/constants/constants.dart';

typedef HttpType = Either<Map<String, dynamic>, Map<String, dynamic>>;

abstract interface class HttpClient {
  Future<HttpType> call({
    required String path,
    required Methods method,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
  });
}
