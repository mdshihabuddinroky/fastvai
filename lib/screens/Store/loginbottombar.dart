import 'package:fastvai/appcolor.dart';

import 'package:fastvai/controller/logincontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

LoginBottom() {
  final Logincontroller logincontroller = Get.put(Logincontroller());

  Get.bottomSheet(
      Container(
        //color: Colors.white,
        height: 30.h,
        width: 100.w,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 1.2.h, vertical: 1.5.h),
          child: Column(
            children: [
              Text('Sign Up Now',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17.sp,
                      fontFamily: 'Heading',
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: 1.5.h,
              ),
              GestureDetector(
                onTap: () {
                  logincontroller.facebooklogin();
                },
                child: const SocialButton(
                  isgoogle: false,
                ),
              ),
              SizedBox(
                height: 1.2.h,
              ),
              GestureDetector(
                onTap: () {
                  logincontroller.googlelogin();
                },
                child: const SocialButton(
                  isgoogle: true,
                ),
              )
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))));
}

class Loginwidget extends StatelessWidget {
  const Loginwidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: () {}, child: Text('data'));
  }
}

class SocialButton extends StatelessWidget {
  const SocialButton({
    Key? key,
    this.isgoogle,
  }) : super(key: key);
  final isgoogle;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 2.2.h, horizontal: 4.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.facebook_rounded,
              color: isgoogle ? Colors.white : Colors.black,
              size: 25.sp,
            ),
            SizedBox(
              width: 1.h,
            ),
            Text(
              isgoogle ? 'Sign up with Google' : 'Sign up with Facebook',
              style: TextStyle(
                  color: isgoogle ? Colors.white : Colors.black,
                  fontSize: 14.sp,
                  fontFamily: 'subheading'),
            ),
          ],
        ),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isgoogle ? AppColors.primary : AppColors.white,
          border: Border.all(
              width: 1,
              color: isgoogle ? Colors.transparent : AppColors.black)),
    );
  }
}
