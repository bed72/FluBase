import 'package:flutter_modular/flutter_modular.dart';

import 'package:ohh_ferta/src/modules/core/data/mappers/pager/pager_mapper.dart';
import 'package:ohh_ferta/src/modules/core/data/repositories/pocket_base_repository.dart';

import 'package:ohh_ferta/src/modules/core/external/clients/pocket_base_client.dart';
import 'package:ohh_ferta/src/modules/core/external/datasources/pocketbase_data_source.dart';

class CoreModule extends Module {
  @override
  void binds(Injector i) {
    i.add<PockeBaseMapper>(PocketBaseMapperImpl.new);
    i.add<PocketBaseClient>(PocketBaseClientImpl.new);
    i.add<PocketBaseDataSource>(PocketBaseDataSourceImpl.new);
  }

  @override
  void exportedBinds(Injector i) {
    i.addLazySingleton<PockeBaseRepository>(PockeBaseRepositoryImpl.new);
  }
}
