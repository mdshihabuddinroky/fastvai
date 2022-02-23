import 'package:fastvai/appcolor.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Empty extends StatelessWidget {
  const Empty({Key? key, this.icon, this.title, this.subtitle})
      : super(key: key);
  final icon;
  final title;
  final subtitle;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 2.h),
        child: Column(
          children: [
            Icon(
              icon,
              size: 40,
              color: AppColors.lightGray,
            ),
            SizedBox(
              height: 1.5.h,
            ),
            Text(
              title,
              style: TextStyle(
                  fontFamily: 'heading',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 1.0.h,
            ),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'subheading',
                  fontSize: 10.sp,
                  color: AppColors.darkGrey,
                  fontWeight: FontWeight.w100),
            )
          ],
        ),
      ),
    );
  }
}
