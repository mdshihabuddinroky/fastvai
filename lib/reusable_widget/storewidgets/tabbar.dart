import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:fastvai/appcolor.dart';

var tabbaritem = [
  Tab(
      child: Row(
    children: [
      Padding(
        padding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 0.5.h),
        child: CircleAvatar(
          backgroundColor: AppColors.white,
          child: Image.asset('assets/all.png'),
        ),
      ),
      Text(
        'All',
        style: TextStyle(
            fontFamily: 'subheading',
            fontWeight: FontWeight.w300,
            fontSize: 12.sp),
      ),
    ],
  )),
  Tab(
      child: Row(
    children: [
      Padding(
        padding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 0.5.h),
        child: CircleAvatar(
          backgroundColor: AppColors.white,
          child: Image.asset('assets/resturent.png'),
        ),
      ),
      Text(
        'Resturent',
        style: TextStyle(
            fontFamily: 'subheading',
            fontWeight: FontWeight.w300,
            fontSize: 12.sp),
      ),
    ],
  )),
  Tab(
      child: Row(
    children: [
      Padding(
        padding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 0.5.h),
        child: CircleAvatar(
          backgroundColor: AppColors.white,
          child: Image.asset('assets/groc.png'),
        ),
      ),
      Text(
        'Grocery',
        style: TextStyle(
            fontFamily: 'subheading',
            fontWeight: FontWeight.w300,
            fontSize: 12.sp),
      ),
    ],
  )),
  Tab(
      child: Row(
    children: [
      Padding(
        padding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 0.5.h),
        child: CircleAvatar(
          backgroundColor: AppColors.white,
          child: Image.asset('assets/pharmacy (1).png'),
        ),
      ),
      Text(
        'Pharmacy',
        style: TextStyle(
            fontFamily: 'subheading',
            fontWeight: FontWeight.w300,
            fontSize: 12.sp),
      ),
    ],
  )),
];
