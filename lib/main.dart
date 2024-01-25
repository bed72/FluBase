import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';

import 'package:ohh_ferta/src/application_module.dart';
import 'package:ohh_ferta/src/application_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Modular.setInitialRoute('/offers/');

  runApp(
    ModularApp(
      debugMode: true,
      module: ApplicationModule(),
      child: const ApplicationWidget(),
    ),
  );
}
