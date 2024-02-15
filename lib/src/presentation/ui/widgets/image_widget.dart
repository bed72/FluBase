import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

class ImageWidget extends StatelessWidget {
  final String url;
  final double? width;
  final double? height;

  const ImageWidget({
    super.key,
    this.width,
    this.height,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      width: width,
      height: height,
      fit: BoxFit.cover,
      errorWidget: (context, url, error) => const SizedBox.shrink(),
    );
  }
}
