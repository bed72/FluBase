import 'package:flutter/material.dart';

class OneScreen extends StatelessWidget {
  final String uri;

  const OneScreen({super.key, required this.uri});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('One -> $uri'),
      ),
    );
  }
}

class TwoScreen extends StatelessWidget {
  final String uri;

  const TwoScreen({super.key, required this.uri});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Two -> $uri'),
      ),
    );
  }
}

class NotFoundScreen extends StatelessWidget {
  final String uri;

  const NotFoundScreen({super.key, required this.uri});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Ops -> $uri'),
      ),
    );
  }
}
