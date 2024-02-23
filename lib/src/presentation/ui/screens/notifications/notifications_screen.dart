import 'package:flutter/material.dart';

import 'package:ohh_ferta/src/presentation/extensions/context_extension.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notificações',
          style: context.fonts.headlineSmall!
              .copyWith(fontWeight: FontWeight.w500),
        ),
      ),
      body: const Center(
        child: Text('Notification'),
      ),
    );
  }
}
