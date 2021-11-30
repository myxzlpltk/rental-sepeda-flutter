import 'package:flutter/material.dart';
import 'package:rental_sepeda_flutter/commons/constants.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerBox extends StatelessWidget {
  final double? width;
  final double? height;
  final Widget? child;

  const ShimmerBox({
    Key? key,
    this.width,
    this.height,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      child: child ??
          Container(
            width: width,
            height: height,
            color: Colors.black,
          ),
      baseColor: shimmerBaseColor,
      highlightColor: shimmerHighlightColor,
    );
  }
}
