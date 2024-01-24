import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:go_router/go_router.dart';

import 'package:ohh_ferta/src/common/theme/themes.dart';

class ApplicationWidget extends StatelessWidget {
  final GoRouter _routerConfig;

  const ApplicationWidget({
    super.key,
    required GoRouter routerConfig,
  }) : _routerConfig = routerConfig;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(Themes.systemWidgets);

    return MaterialApp.router(
      theme: Themes.light,
      themeMode: ThemeMode.light,
      routerConfig: _routerConfig,
      debugShowCheckedModeBanner: false,
    );
  }
}
