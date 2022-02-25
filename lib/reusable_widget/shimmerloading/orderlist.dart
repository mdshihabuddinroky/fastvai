import 'package:fastvai/appcolor.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class Ordershimmer extends StatelessWidget {
  const Ordershimmer({Key? key, this.height, this.width}) : super(key: key);
  final height;
  final width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Shimmer.fromColors(
        baseColor: const Color.fromARGB(255, 209, 209, 245),
        highlightColor: AppColors.lighterGray,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(255, 209, 209, 245)),
        ),
      ),
    );
  }
}
