import 'package:flutter/material.dart';

class StoresScreen extends StatelessWidget {
  const StoresScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lojas'),
      ),
      body: const SafeArea(
        child: Center(
          child: Text('Stores'),
        ),
      ),
    );
  }
}
