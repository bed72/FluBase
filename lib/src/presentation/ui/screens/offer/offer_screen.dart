import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ohh_ferta/src/presentation/ui/widgets/border/border_widget.dart';

import 'package:ohh_ferta/src/presentation/ui/widgets/image_widget.dart';
import 'package:ohh_ferta/src/presentation/extensions/context_extension.dart';

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
      body: Column(
        children: [
          Stack(
            children: [
              Hero(
                tag: widget.id,
                child: ImageWidget(
                  width: double.infinity,
                  height: context.dimensions.height / 2,
                  url:
                      'http://10.0.2.2:8090/api/files/offers/fy3a2jg7eczzh8y/limon_gjw12jHnsQ.jpg?thumb=100x300',
                ),
              ),
              Container(
                width: 48.0,
                height: 48.0,
                margin: const EdgeInsets.only(left: 16.0, top: 32.0),
                padding: const EdgeInsets.symmetric(
                  vertical: 2.0,
                  horizontal: 3.0,
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: context.colors.background.withOpacity(0.9),
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: context.colors.secondary,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
