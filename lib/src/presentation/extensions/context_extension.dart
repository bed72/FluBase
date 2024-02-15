import 'package:flutter/material.dart';

extension ThemeContext on BuildContext {
  Size get dimensions => MediaQuery.of(this).size;

  TextTheme get fonts => Theme.of(this).textTheme;
  ColorScheme get colors => Theme.of(this).colorScheme;
}
