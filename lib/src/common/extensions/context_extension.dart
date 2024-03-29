import 'package:flutter/material.dart';

extension ThemeContext on BuildContext {
  TextTheme get fonts => Theme.of(this).textTheme;
  ColorScheme get colors => Theme.of(this).colorScheme;
}
