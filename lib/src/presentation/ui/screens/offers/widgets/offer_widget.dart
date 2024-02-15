import 'package:flutter/material.dart';

import 'package:ohh_ferta/src/domain/models/offers/offers_model.dart';

import 'package:ohh_ferta/src/presentation/ui/widgets/image_widget.dart';
import 'package:ohh_ferta/src/presentation/extensions/context_extension.dart';

class OfferWidget extends StatefulWidget {
  final bool isPair;
  final OfferModel offer;

  const OfferWidget({
    super.key,
    required this.offer,
    required this.isPair,
  });

  @override
  State<OfferWidget> createState() => _OfferWidgetState();
}

class _OfferWidgetState extends State<OfferWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4.0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                child: ImageWidget(
                  url: widget.offer.formatImage,
                  width: (context.dimensions.width - 48) / 2,
                  height: (context.dimensions.width - 48) / 2,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                padding: const EdgeInsets.symmetric(
                  vertical: 2.0,
                  horizontal: 3.0,
                ),
                decoration: BoxDecoration(
                  color: context.colors.background,
                  borderRadius: const BorderRadius.all(Radius.circular(4)),
                ),
                child: Text(
                  'R\$ ${widget.offer.price}',
                  maxLines: 2,
                  style: context.fonts.titleSmall?.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4.0),
          Text(
            widget.offer.formatData,
            style: context.fonts.labelSmall?.copyWith(
              fontSize: 10,
              fontWeight: FontWeight.w200,
              color: context.colors.onBackground.withOpacity(0.6),
            ),
          ),
          const SizedBox(height: 4.0),
          Text(
            widget.offer.name,
            maxLines: 2,
            style: context.fonts.titleSmall?.copyWith(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 4.0),
          Wrap(
            spacing: 2.0,
            runSpacing: 2.0,
            children: _chipWidgets(),
          ),
        ],
      ),
    );
  }

  List<Container> _chipWidgets() => widget.offer.categories
      .map(
        (category) => Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            border: Border.all(
              color: context.colors.onBackground.withOpacity(0.4),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 1.0,
              horizontal: 2.0,
            ),
            child: Text(
              category,
              style: context.fonts.labelSmall?.copyWith(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: context.colors.onBackground.withOpacity(0.6),
              ),
            ),
          ),
        ),
      )
      .toList();
}
