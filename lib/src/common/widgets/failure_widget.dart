import 'package:flutter/material.dart';

class FailureWidget extends StatelessWidget {
  final Object error;

  const FailureWidget({
    super.key,
    required this.error,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Text('Ahhhh, não!!!'),
          Text(error.toString()),
        ],
      ),
    );
  }
}
