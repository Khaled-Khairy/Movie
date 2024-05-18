import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../colors.dart';

class MyImage extends StatelessWidget {
  const MyImage({
    super.key, required this.image, required this.widthCache, required this.heightCache,
  });

  final String image;
  final int widthCache;
  final int heightCache;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      key: ValueKey(image),
      maxWidthDiskCache: widthCache,
      maxHeightDiskCache: heightCache,
      placeholder: (context, url) =>  Center(
          child: CircularProgressIndicator(
            color: kTextColor,
          )),
      imageUrl: image,
      fit: BoxFit.cover,
      errorWidget: (context, url, error) =>
      const Icon(Icons.error),
      fadeOutDuration: const Duration(seconds: 0),
    );
  }
}
