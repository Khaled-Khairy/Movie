import 'package:flutter/material.dart';
import 'package:movie3/core/functions/extension.dart';

class Skelton extends StatelessWidget {
  final double width;
  final double height;
  final double bRadius;
  final Color baseColor;

  const Skelton(
      {super.key,
      required this.width,
      required this.height,
      required this.bRadius,
      required this.baseColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w(context),
      height: height.h(context),
      child: Container(
        width: width.w(context),
        height: height.h(context),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(bRadius), color: baseColor),
      ),
    );
  }
}
