import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:ohh_ferta/src/common/theme/fonts.dart';
import 'package:ohh_ferta/src/common/theme/colors.dart';

class Themes {
  static get systemWidgets => const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Color(0xFFFBFDF7),
        systemNavigationBarIconBrightness: Brightness.dark,
      );

  static get light => ThemeData(
        textTheme: fonts,
        colorScheme: colors,
        fontFamily: 'Poppins',
        brightness: Brightness.light,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      );
}
