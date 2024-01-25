import 'package:flutter/material.dart';

class ScaffoldStateWidget extends StatelessWidget {
  final Widget child;
  const ScaffoldStateWidget({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: child,
      ),
    );
  }
}
