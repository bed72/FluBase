import 'package:ohh_ferta/src/modules/core/data/mappers/mapper.dart';

import 'package:ohh_ferta/src/modules/core/data/models/failure_model.dart';

final class FailureMapper implements JsonMapper<FailureModel> {
  @override
  FailureModel call(Map<String, dynamic> json) => FailureModel(
        code: json['code'],
        data: json['data'],
        message: json['message'],
      );
}
