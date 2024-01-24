import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';

extension GetItStatefulWidget on State<StatefulWidget> {
  T get<T extends Object>() => GetIt.instance.get<T>();
}
