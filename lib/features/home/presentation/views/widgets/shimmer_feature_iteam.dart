import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerFeatureItem extends StatelessWidget {
  const ShimmerFeatureItem(
      {super.key, this.widthRatio, this.heightRatio, this.aspectRatio});
  final num? widthRatio;
  final num? heightRatio;
  final double? aspectRatio;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * (heightRatio ?? 0.25),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * (widthRatio ?? 0.35),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: AspectRatio(
                aspectRatio: aspectRatio ?? 0.6,
                child: Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
