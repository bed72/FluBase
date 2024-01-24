import 'package:get_it/get_it.dart';

import 'package:ohh_ferta/src/data/mappers/pager/pager_mapper.dart';
import 'package:ohh_ferta/src/data/mappers/offers/offer_mapper.dart';
import 'package:ohh_ferta/src/data/repositories/get_repository.dart';

import 'package:ohh_ferta/src/external/clients/pocket_base_client.dart';
import 'package:ohh_ferta/src/external/datasources/pocketbase_data_source.dart';

import 'package:ohh_ferta/src/presentation/screens/home/offers/offers_state.dart';

import 'package:ohh_ferta/src/domain/usecases/offers/get_all_offers_use_case.dart';

class Resolvers {
  final GetIt _it;

  Resolvers({required GetIt it}) : _it = it {
    _clients();
    _mappers();
    _dataSources();
    _repositories();
    _useCases();
    _states();
  }

  void _clients() {
    _it.registerSingleton<PocketBaseClient>(PocketBaseClientImpl());
  }

  void _mappers() {
    _it
      ..registerFactory<OfferMapper>(() => OfferMapper())
      ..registerFactory<PagerMapper>(() => PocketBaseMapperImpl());
  }

  void _dataSources() {
    _it.registerFactory<PocketBaseDataSource>(
      () => PocketBaseDataSourceImpl(client: _it.get<PocketBaseClient>()),
    );
  }

  void _repositories() {
    _it.registerFactory<GetRepository>(
      () => PockeBaseRepositoryImpl(
        mapper: _it.get<PagerMapper>(),
        dataSource: _it.get<PocketBaseDataSource>(),
      ),
    );
  }

  void _useCases() {
    _it.registerFactory<GetAllOffersUseCase>(
      () => GetAllOffersUseCaseImpl(
        mapper: _it.get<OfferMapper>(),
        repository: _it.get<GetRepository>(),
      ),
    );
  }

  void _states() {
    _it.registerSingleton<OffersState>(
      OffersState(useCase: _it.get<GetAllOffersUseCase>()),
    );
  }
}
