import 'package:cached_network_image/cached_network_image.dart';
import 'package:fastvai/api_services/storeapiservice.dart';
import 'package:fastvai/appcolor.dart';
import 'package:fastvai/reusable_widget/storewidgets/carosoulitem.dart';
import 'package:fastvai/reusable_widget/storewidgets/tabbar.dart';
import 'package:fastvai/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class StoreHome extends StatelessWidget {
  const StoreHome({
    Key? key,
    required this.storecontroller,
    required this.tabController,
  }) : super(key: key);

  final Storecontroller storecontroller;
  final TabController? tabController;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: (storecontroller.isloading == true)
              ? const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.secondary,
                  ),
                )
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 1.0.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 0.2.h, horizontal: 1.2.h),
                        child: Center(
                          child: slider(storecontroller: storecontroller),
                        ),
                      ),
                      SizedBox(
                        height: 1.2.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 0.2.h, horizontal: 2.h),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Get Everything Here',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1.2,
                                fontFamily: 'heading',
                                fontSize: 14.sp),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 1.2.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 0.2.h, horizontal: 1.2.h),
                        child: TabBar(
                            controller: tabController,
                            // labelColor: AppColors.secondary,
                            unselectedLabelColor: AppColors.black,
                            indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: AppColors.primary),
                            isScrollable: true,
                            tabs: tabbaritem),
                      ),
                      SizedBox(
                        height: 1.2.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 0.2.h, horizontal: 2.h),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Popular Shops',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1.2,
                                fontFamily: 'heading',
                                fontSize: 14.sp),
                          ),
                        ),
                      ),
                      StorelistWidget(storecontroller: storecontroller)
                    ],
                  ),
                ),
        ));
  }
}

class StorelistWidget extends StatelessWidget {
  const StorelistWidget({
    Key? key,
    required this.storecontroller,
  }) : super(key: key);

  final Storecontroller storecontroller;

  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView.builder(
        shrinkWrap: true,
        itemCount: storecontroller.storelist.length,
        itemBuilder: (context, index) {
          var status = storecontroller.storelist[index].status.contains('open')
              ? true
              : false;
          return GestureDetector(
            onTap: () {
              Get.to(Home());
            },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 1.5.h),
              child: Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(children: [
                        CachedNetworkImage(
                          imageUrl: storecontroller.storelist[index].dokanPic,
                          height: 22.0.h,
                          width: double.maxFinite,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => SizedBox(
                            height: 22.0.h,
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
                        ),
                        Positioned(
                          right: 2.w,
                          top: 1.h,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 1.0.h, vertical: 0.7.h),
                              child: Row(
                                children: [
                                  status
                                      ? const Icon(
                                          Icons.lock_open,
                                          color: Colors.black,
                                          size: 15,
                                        )
                                      : const Icon(
                                          Icons.lock,
                                          color: Colors.black,
                                          size: 15,
                                        ),
                                  status
                                      ? const Text(
                                          'Open',
                                          style: TextStyle(color: Colors.black),
                                        )
                                      : const Text(
                                          'Close',
                                          style: TextStyle(color: Colors.black),
                                        )
                                ],
                              ),
                            ),
                          ),
                        )
                      ]),
                      //  SizedBox(height: 1.h),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 1.5.h, horizontal: 1.5.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(storecontroller.storelist[index].dokanName,
                                    style: TextStyle(
                                        fontFamily: 'heading',
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600)),
                                SizedBox(
                                  height: 0.3.h,
                                ),
                                Text(
                                  storecontroller.storelist[index].dokanAddress,
                                  style: GoogleFonts.lato(
                                      color: Colors.black45,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10.sp),
                                ),
                                SizedBox(
                                  height: 0.3.h,
                                ),
                              ],
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.redAccent,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 1.0.h, vertical: 0.7.h),
                                child: Row(
                                  children: const [
                                    Text(
                                      '0.0',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                      size: 15,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )),
            ),
          );
        }));
  }
}
