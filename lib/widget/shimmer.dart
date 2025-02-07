import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Skelton extends StatelessWidget {
  const Skelton({
    Key? key,
    this.height,
    this.width,
  }) : super(key: key);
  final double? height, width;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade400,
      highlightColor: Colors.grey.shade300,
      child: Column(
        children: [
          Container(
            height: height,
            width: width,
            padding: const EdgeInsets.all(8.0),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(.6),
              borderRadius: BorderRadius.circular(16),
            ),
          )
        ],
      ),
    );
  }
}
