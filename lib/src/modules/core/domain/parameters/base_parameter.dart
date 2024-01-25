class BaseParameter {
  final int page;
  final int perPage;
  final bool skipTotal;
  final String? expand;
  final String? filter;
  final String? sort;
  final String? fields;
  final Map<String, dynamic> query;
  final Map<String, String> headers;

  BaseParameter({
    this.page = 1,
    this.perPage = 30,
    this.skipTotal = false,
    this.expand,
    this.filter,
    this.sort,
    this.fields,
    this.query = const {},
    this.headers = const {},
  });
}
