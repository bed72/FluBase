import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:ohh_ferta/src/presentation/themes/themes.dart';
import 'package:ohh_ferta/src/presentation/ui/routes/routes.dart';

class ApplicationScreen extends StatelessWidget {
  const ApplicationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(Themes.systemWidgets);

    return MaterialApp(
      theme: Themes.light,
      initialRoute: Routes.root,
      themeMode: ThemeMode.light,
      onGenerateRoute: onGenerateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
