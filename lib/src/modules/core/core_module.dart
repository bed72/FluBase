import 'package:dio/dio.dart';

import 'package:flutter_modular/flutter_modular.dart';

import 'package:ohh_ferta/src/modules/core/external/clients/http_client.dart';
import 'package:ohh_ferta/src/modules/core/external/options/http_options.dart';

import 'package:ohh_ferta/src/modules/core/data/models/failure_model.dart';
import 'package:ohh_ferta/src/modules/core/data/models/success_model.dart';

import 'package:ohh_ferta/src/modules/core/data/mappers/mapper.dart';
import 'package:ohh_ferta/src/modules/core/data/mappers/failure_mapper.dart';
import 'package:ohh_ferta/src/modules/core/data/mappers/success_mapper.dart';

import 'package:ohh_ferta/src/modules/core/data/repositories/http_repository.dart';

class CoreModule extends Module {
  @override
  void binds(Injector i) {
    i.addInstance(Dio(options));
    i.add<HttpClient>(HttpClientImpl.new);
    i.add<JsonMapper<FailureModel>>(FailureMapper.new);
    i.add<JsonMapper<SuccessModel>>(SuccessMapper.new);
  }

  @override
  void exportedBinds(Injector i) {
    i.addSingleton<HttpRepository>(HttpRepositoryImpl.new);
  }
}
