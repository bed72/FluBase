import 'package:flutter/material.dart';

class OfferScreen extends StatefulWidget {
  final String id;

  const OfferScreen({
    super.key,
    required this.id,
  });

  @override
  State<OfferScreen> createState() => _OfferScreenState();
}

class _OfferScreenState extends State<OfferScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(widget.id),
      ),
    );
  }
}
