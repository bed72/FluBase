import 'package:ohh_ferta/src/modules/core/domain/entities/failure_entity.dart';

class FailureModel {
  final int code;
  final String message;
  final Map<String, dynamic> data;

  FailureModel({
    required this.code,
    required this.message,
    required this.data,
  });

  FailureEntity toEntity() => FailureEntity(
        code: code,
        message: message,
        data: data,
      );
}
