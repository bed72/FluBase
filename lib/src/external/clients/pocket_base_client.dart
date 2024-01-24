import 'package:pocketbase/pocketbase.dart';

import 'package:ohh_ferta/src/domain/constants/constants.dart';

abstract interface class PocketBaseClient {
  PocketBase call();
}

final class PocketBaseClientImpl implements PocketBaseClient {
  @override
  PocketBase call() => PocketBase(
        baseURL,
        lang: 'pt-BR',
      );
}
