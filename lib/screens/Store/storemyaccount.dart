// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:fastvai/appcolor.dart';
import 'package:fastvai/controller/facebook_login_controller.dart';
import 'package:fastvai/controller/google_login_controller.dart';
import 'package:fastvai/controller/logincontroller.dart';
import 'package:fastvai/screens/set_delivery.dart';
import 'package:fastvai/screens/webview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class MyAccount extends StatelessWidget {
  MyAccount({Key? key}) : super(key: key);
  final Logincontroller logincontroller = Get.put(Logincontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFCFCFC),
      body: Obx(() => SingleChildScrollView(
            child: Align(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 4.h,
                  ),
                  (logincontroller.islogin.value)
                      ? CircleAvatar(
                          backgroundColor: AppColors.secondary,
                          radius: 40,
                          backgroundImage: NetworkImage(
                              logincontroller.userdata[1].toString()),
                        )
                      : SizedBox(),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    (!logincontroller.islogin.value)
                        ? 'Sign Up Now'
                        : logincontroller.userdata[3].toString(),
                    style: TextStyle(fontFamily: 'subheading', fontSize: 17.sp),
                  ),
                  SizedBox(
                    height: 0.5.h,
                  ),
                  Text(
                    (!logincontroller.islogin.value)
                        ? ''
                        : logincontroller.userdata[2].toString(),
                    style: TextStyle(
                        fontFamily: 'subheading',
                        fontSize: 8.sp,
                        color: AppColors.darkGrey),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.offAll(SetLocation());
                    },
                    child: const AccountoptionCard(
                      iconname: 'fi fi-rr-marker',
                      optionname: 'Change Location',
                      iconbackgroundclor: Color(0xff2780E6),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(const Webview(
                        title: 'Chat with Us',
                        link:
                            'https://tawk.to/chat/6113d51fd6e7610a49afb5cc/1fcqnh1pt',
                      ));
                    },
                    child: const AccountoptionCard(
                      iconname: 'fi fi-rr-comments',
                      optionname: 'Chat with Us',
                      iconbackgroundclor: Color(0xff009999),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(const Webview(
                        title: 'Privacy Policy',
                        link: 'https://fastvai.com/landingpage/ptc/',
                      ));
                    },
                    child: const AccountoptionCard(
                      iconname: 'fi fi-rr-undo',
                      optionname: 'Return Policy',
                      iconbackgroundclor: Color(0xff417C45),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(const Webview(
                        title: 'Privacy Policy',
                        link: 'https://fastvai.com/landingpage/ptc/',
                      ));
                    },
                    child: const AccountoptionCard(
                      iconname: 'fi fi-rr-document',
                      optionname: 'Privacy Policy',
                      iconbackgroundclor: Color(0xffF7D149),
                    ),
                  ),
                  SizedBox(
                    height: 0.3.h,
                  ),
                  Visibility(
                    visible: logincontroller.islogin.value,
                    child: ActionChip(
                        label: Text('Sign Out'),
                        avatar: Icon(Icons.logout),
                        onPressed: () {
                          logincontroller.logout();
                        }),
                  ),
                  SizedBox(
                    height: 1.0.h,
                  )
                ],
              ),
            ),
          )),
    );
  }
}

class AccountoptionCard extends StatelessWidget {
  const AccountoptionCard({
    Key? key,
    required this.iconname,
    required this.optionname,
    required this.iconbackgroundclor,
  }) : super(key: key);
  final iconname;
  final optionname;
  final iconbackgroundclor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.white,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.6.h, vertical: 0.8.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 0.8.h, vertical: 0.7.h),
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: iconbackgroundclor,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 0.4.h, vertical: 1.2.h),
                    child: Text(
                      iconname,
                      // ignore: prefer_const_constructors
                      style: TextStyle(
                          fontFamily: 'uicons',
                          color: Colors.white,
                          fontSize: 15.sp),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 3.w,
              ),
              Text(
                optionname,
                style: TextStyle(
                    fontFamily: 'heading',
                    letterSpacing: 1.1,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w700),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(top: 2.h),
                child: Text(
                  'fi fi-rr-arrow-small-right',
                  // ignore: prefer_const_constructors
                  style: TextStyle(
                      fontFamily: 'uicons',
                      color: Colors.black87,
                      fontSize: 19.sp),
                ),
              ),
              SizedBox(
                width: 1.w,
              )
            ],
          ),
        ),
      ),
    );
  }
}
