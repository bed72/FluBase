import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_modular/flutter_modular.dart';

import 'package:ohh_ferta/src/common/themes/themes.dart';

class ApplicationWidget extends StatelessWidget {
  const ApplicationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(Themes.systemWidgets);

    return MaterialApp.router(
      theme: Themes.light,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      routerConfig: Modular.routerConfig,
    );
  }
}
