// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class NetworkImageCard extends StatelessWidget {
  final double width;
  final double height;
  final String? imageUrl;
  final BoxFit? fit;
  final double borderRadius;
  final VoidCallback? onTap;

  const NetworkImageCard({
    Key? key,
    this.width = 150,
    this.height = 228,
    this.imageUrl,
    this.fit,
    this.borderRadius = 10,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: Colors.black54,
        ),
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(borderRadius)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius),
            child: FadeInImage(
              placeholder: const AssetImage('assets/movie.png'),
              image: NetworkImage(imageUrl!),
              placeholderFit: BoxFit.scaleDown,
              fit: fit,
            ),
          ),
        ),
      ),
    );
  }
}
