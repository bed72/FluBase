import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:ohh_ferta/src/modules/home/home_module.dart';

import 'package:ohh_ferta/src/common/modules/base_module.dart';

import 'package:ohh_ferta/src/screens.dart';

final class ApplicationModule extends BaseModule {
  @override
  void routes(r) {
    r.module('/home/', module: HomeModule());
    r.match(
      '/home/:n1/:n2?with=milk/',
      pattern: r'\/home\/[^\/]+\/[^\/]+\?with=milk',
      defaultScreen: OneScreen(uri: Modular.args.uri.toString()),
      fallbackScreen: NotFoundScreen(uri: Modular.args.uri.toString()),
    );
  }
}

extension RouterMatch on RouteManager {
  bool _execute(String pattern) =>
      RegExp(pattern).hasMatch(args.uri.toString());

  void match(
    String name, {
    required String pattern,
    required Widget defaultScreen,
    required Widget fallbackScreen,
  }) {
    add(
      ChildRoute(
        name,
        child: (_) => _execute(pattern) ? defaultScreen : fallbackScreen,
      ),
    );
  }
}
