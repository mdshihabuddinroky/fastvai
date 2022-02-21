import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fastvai/api_services/storeapiservice.dart';
import 'package:fastvai/appcolor.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class slider extends StatelessWidget {
  const slider({
    Key? key,
    required this.storecontroller,
  }) : super(key: key);

  final Storecontroller storecontroller;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: [
          ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: CachedNetworkImage(
                imageUrl: storecontroller.bannerlist[0].banner1,
                width: 98.w,
                fit: BoxFit.fitWidth,
                placeholder: (context, url) => SizedBox(
                  width: double.maxFinite,
                  child: Shimmer.fromColors(
                    baseColor: Colors.red,
                    highlightColor: Colors.yellow,
                    child: const SizedBox(
                      height: double.maxFinite,
                      width: double.maxFinite,
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(
                  Icons.error,
                  color: AppColors.primary,
                ),
              )),
          ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: CachedNetworkImage(
                imageUrl: storecontroller.bannerlist[0].banner2,
                width: 98.w,
                fit: BoxFit.fitWidth,
                placeholder: (context, url) => SizedBox(
                  width: double.maxFinite,
                  child: Shimmer.fromColors(
                    baseColor: Colors.red,
                    highlightColor: Colors.yellow,
                    child: const SizedBox(
                      height: double.maxFinite,
                      width: double.maxFinite,
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(
                  Icons.error,
                  color: AppColors.primary,
                ),
              )),
          ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: CachedNetworkImage(
                imageUrl: storecontroller.bannerlist[0].banner3,
                width: 98.w,
                fit: BoxFit.fitWidth,
                placeholder: (context, url) => SizedBox(
                  width: double.maxFinite,
                  child: Shimmer.fromColors(
                    baseColor: Colors.red,
                    highlightColor: Colors.yellow,
                    child: const SizedBox(
                      height: double.maxFinite,
                      width: double.maxFinite,
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(
                  Icons.error,
                  color: AppColors.primary,
                ),
              ))
        ],
        options: CarouselOptions(
          height: 23.h,
          aspectRatio: 16 / 9,
          viewportFraction: 0.8,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          //onPageChanged: callbackFunction,
          scrollDirection: Axis.horizontal,
        ));
  }
}
