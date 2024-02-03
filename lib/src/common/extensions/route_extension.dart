import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';

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
