import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

var bottomitem = <BottomNavigationBarItem>[
  BottomNavigationBarItem(
    icon: Text(
      'fi fi-rr-home',
      style: TextStyle(fontFamily: "uicons", fontSize: 13.sp),
    ),
    label: "Home",
  ),
  BottomNavigationBarItem(
    icon: Text(
      'fi fi-rr-list',
      style: TextStyle(fontFamily: "uicons", fontSize: 13.sp),
    ),
    label: "My Order",
  ),
  BottomNavigationBarItem(
    icon: Text(
      'fi fi-rr-portrait',
      style: TextStyle(fontFamily: "uicons", fontSize: 13.sp),
    ),
    label: "My Account",
  ),
];
