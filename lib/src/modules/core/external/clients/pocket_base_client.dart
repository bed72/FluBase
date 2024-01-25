import 'package:pocketbase/pocketbase.dart';

import 'package:ohh_ferta/src/common/constants/constants.dart';

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
