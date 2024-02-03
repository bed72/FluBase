import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';

import 'package:ohh_ferta/src/application_module.dart';
import 'package:ohh_ferta/src/application_widget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    ModularApp(
      debugMode: true,
      module: ApplicationModule(),
      child: const ApplicationWidget(),
    ),
  );
}
