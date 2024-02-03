import 'package:flutter/material.dart';

import 'package:page_transition/page_transition.dart';

void navigateRightToLeft(
  BuildContext context, {
  required Widget child,
}) {
  Navigator.push(
    context,
    PageTransition(
      child: child,
      type: PageTransitionType.rightToLeft,
    ),
  );
}
