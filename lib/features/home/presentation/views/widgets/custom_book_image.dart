import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key, required this.imagePath});
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.6 / 4,
      child: Image.asset(imagePath),
      // CachedNetworkImage(
      //   imageUrl: imagePath,
      //   errorWidget: (context, url, error) =>
      //       Icon(Icons.error, color: Colors.red),
      // ),
    );
  }
}
