import 'package:flutter_modular/flutter_modular.dart';

import 'package:ohh_ferta/src/modules/core/core_module.dart';

abstract base class BaseModule extends Module {
  @override
  List<Module> get imports => [CoreModule()];
}
