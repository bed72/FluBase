import 'package:dio/dio.dart';

import 'package:ohh_ferta/src/common/constants/constants.dart';

BaseOptions get options => BaseOptions(
      baseUrl: baseUrl,
      headers: {
        'Content-Type': 'application/json',
      },
    );

enum HttpMethod {
  get(value: 'GET'),
  put(value: 'PUT'),
  post(value: 'POST'),
  delete(value: 'DELETE');

  final String value;

  const HttpMethod({required this.value});
}
