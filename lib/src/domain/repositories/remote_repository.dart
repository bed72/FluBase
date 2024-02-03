import 'package:either_dart/either.dart';

import 'package:ohh_ferta/src/domain/constants/constants.dart';

import 'package:ohh_ferta/src/domain/models/responses/failure_model.dart';
import 'package:ohh_ferta/src/domain/models/responses/success_model.dart';

typedef RemoteRepositoryType = Either<FailureModel, SuccessModel>;

abstract interface class RemoteRepository {
  Future<RemoteRepositoryType> call({
    required String path,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
    Methods method = Methods.get,
  });
}
