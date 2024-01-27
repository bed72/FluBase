import 'package:flutter/material.dart';

import 'package:ohh_ferta/src/common/extensions/context_extension.dart';

class OffersHeaderWidget extends StatelessWidget {
  final String title;
  final bool hasNotification;

  const OffersHeaderWidget({
    super.key,
    required this.title,
    required this.hasNotification,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style:
            context.fonts.headlineSmall!.copyWith(fontWeight: FontWeight.w600),
      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.storefront_outlined),
          onPressed: () => Navigator.pushNamed(context, '/home/offers'),
        ),
        IconButton(
          onPressed: () => Navigator.pushNamed(context, '/home/offers'),
          icon: hasNotification
              ? const Badge(
                  child: Icon(Icons.notifications_none_outlined),
                )
              : const Icon(Icons.notifications),
        ),
      ],
    );
  }
}
