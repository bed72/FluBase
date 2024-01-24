import 'package:ohh_ferta/src/data/models/pager/pager_model.dart';

abstract interface class PagerMapper {
  PagerModel call(Map<String, dynamic> json);
}

final class PocketBaseMapperImpl implements PagerMapper {
  @override
  PagerModel call(Map<String, dynamic> json) => PagerModel(
        page: json['page'],
        perPage: json['perPage'],
        totalItems: json['totalItems'],
        totalPages: json['totalPages'],
        items: List<dynamic>.from(json['items']),
      );
}
