import 'package:ohh_ferta/src/modules/core/data/mappers/mapper.dart';

import 'package:ohh_ferta/src/modules/core/data/models/success_model.dart';

final class SuccessMapper implements JsonMapper<SuccessModel> {
  @override
  SuccessModel call(Map<String, dynamic> json) => SuccessModel(
        page: json['page'],
        perPage: json['perPage'],
        totalItems: json['totalItems'],
        totalPages: json['totalPages'],
        items: List<dynamic>.from(json['items']),
      );
}
