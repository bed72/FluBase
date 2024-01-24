import 'package:get_it/get_it.dart';

import 'package:flutter/material.dart';

import 'package:ohh_ferta/src/application_widget.dart';

import 'package:ohh_ferta/src/common/routes/routes.dart';
import 'package:ohh_ferta/src/common/resolvers/resolvers.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Resolvers(it: GetIt.instance);

  runApp(
    ApplicationWidget(routerConfig: Routes.routerConfig),
  );
}
