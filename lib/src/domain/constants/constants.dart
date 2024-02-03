const String baseUrl = 'http://10.0.2.2:8090';

String basePath(String path) => '/api/collections/$path/records';

enum Methods {
  get(value: 'GET'),
  put(value: 'PUT'),
  post(value: 'POST'),
  delete(value: 'DELETE');

  final String value;

  const Methods({required this.value});
}
