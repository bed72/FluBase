import 'package:flutter/material.dart';

import 'package:ohh_ferta/src/presentation/extensions/context_extension.dart';

class HeaderWidget extends StatelessWidget {
  final String title;
  final bool hasActions;
  final bool hasNotification;

  final void Function()? navigateToCreateStore;
  final void Function()? navigateToNotifications;

  const HeaderWidget({
    super.key,
    required this.title,
    this.hasActions = false,
    this.hasNotification = false,
    this.navigateToCreateStore,
    this.navigateToNotifications,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style:
            context.fonts.headlineSmall!.copyWith(fontWeight: FontWeight.w500),
      ),
      actions: !hasActions
          ? null
          : <Widget>[
              IconButton(
                icon: const Icon(Icons.storefront_outlined),
                onPressed: navigateToCreateStore,
              ),
              IconButton(
                onPressed: navigateToNotifications,
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
