import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget cachedImage({required String url, double? width, double? height, BoxFit? fit}) {
  return CachedNetworkImage(
    imageUrl: url,
    width: width,
    height: height,
    fit: fit,
    progressIndicatorBuilder: (context, url, downloadProgress) => CircleAvatar(
      backgroundColor: Colors.transparent,
      child: CircularProgressIndicator(value: downloadProgress.progress),
    ),
    errorWidget: (context, url, error) => const Image(image: AssetImage('assets/icons/alta_icon.png')),
  );
}