import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:ohh_ferta/src/common/themes/fonts.dart';
import 'package:ohh_ferta/src/common/themes/colors.dart';

class Themes {
  static get systemWidgets => const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Color(0xFFFBFDF7), //Color(0x19006D39),
        systemNavigationBarIconBrightness: Brightness.dark,
      );

  static get light => ThemeData(
        textTheme: fonts,
        colorScheme: colors,
        fontFamily: 'Poppins',
        brightness: Brightness.light,
        highlightColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      );
}
