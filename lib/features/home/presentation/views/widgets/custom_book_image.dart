import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key, required this.imagePath});
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.6 / 4,
      child: ClipRRect(
        borderRadius: BorderRadiusGeometry.circular(15),
        child: Skeleton.replace(
          child: CachedNetworkImage(
            imageUrl: imagePath,
            fit: BoxFit.fill,
            errorWidget: (context, url, error) =>
                Icon(Icons.error, color: Colors.red),
          ),
        ),
      ),
    );
  }
}
