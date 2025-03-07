import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ListviewItem extends StatelessWidget {
  const ListviewItem({super.key, this.widthRatio, required this.imageUrl});

  final String imageUrl;
  final num? widthRatio;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * (widthRatio ?? 0.35),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: AspectRatio(
          aspectRatio: 0.6,
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.fitHeight,
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}
