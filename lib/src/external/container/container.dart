import 'dart:developer';

import 'package:dio/dio.dart';

import 'package:ioc_container/ioc_container.dart';
import 'package:ohh_ferta/src/data/mappers/offers/offers_mapper.dart';

import 'package:ohh_ferta/src/external/clients/http_client_impl.dart';

import 'package:ohh_ferta/src/domain/models/responses/failure_model.dart';
import 'package:ohh_ferta/src/domain/models/responses/success_model.dart';

import 'package:ohh_ferta/src/domain/repositories/remote_repository.dart';

import 'package:ohh_ferta/src/data/clients/http_client.dart';

import 'package:ohh_ferta/src/data/mappers/mapper.dart';
import 'package:ohh_ferta/src/data/mappers/responses/failure_mapper.dart';
import 'package:ohh_ferta/src/data/mappers/responses/success_mapper.dart';

import 'package:ohh_ferta/src/data/repositories/remote_repository_impl.dart';
import 'package:ohh_ferta/src/presentation/ui/screens/offers/states/offers_state.dart';

IocContainer get container {
  log('BUILD');

  final builder = IocContainerBuilder()
    ..add((_) => Dio(options))
    ..add<OffersMapper>((_) => OffersMapper())
    ..add<JsonMapper<FailureModel>>((_) => FailureMapper())
    ..add<JsonMapper<SuccessModel>>((_) => SuccessMapper())
    ..add<HttpClient>(
      (container) => HttpClientImpl(http: container.get<Dio>()),
    )
    ..add<RemoteRepository>(
      (container) => RemoteRepositoryImpl(
        client: container.get<HttpClient>(),
        failure: container.get<JsonMapper<FailureModel>>(),
        success: container.get<JsonMapper<SuccessModel>>(),
      ),
    )
    ..addSingleton<OffersState>(
      (container) => OffersState(
        mapper: container.get<OffersMapper>(),
        repository: container.get<RemoteRepository>(),
      ),
    );

  return builder.toContainer();
}
