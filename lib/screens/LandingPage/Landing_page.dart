import 'package:fastvai/appcolor.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    //  double h = size.height;
    // double w = size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: SizerUtil.deviceType != DeviceType.mobile
              ? EdgeInsets.only(top: 2.h, left: 4.w, right: 4.w)
              : EdgeInsets.symmetric(horizontal: 0.h, vertical: 0.h),
          child: Column(
            children: [
              SizerUtil.deviceType != DeviceType.mobile
                  ? Row(
                      children: [
                        Image.asset('Assets/appicon.png',
                            height: 10.h, width: 6.w),
                        SizedBox(
                          width: 1.w,
                        ),
                        Text('Home',
                            style: GoogleFonts.roboto(fontSize: 2.5.sp)),
                        SizedBox(
                          width: 2.w,
                        ),
                        Text('Store',
                            style: GoogleFonts.roboto(fontSize: 2.5.sp)),
                        SizedBox(
                          width: 2.w,
                        ),
                        Text('Contact Us',
                            style: GoogleFonts.roboto(fontSize: 2.5.sp)),
                        SizedBox(
                          width: 2.w,
                        ),
                        Text('Privacy Policy',
                            style: GoogleFonts.roboto(fontSize: 2.5.sp)),
                        SizedBox(
                          width: 2.w,
                        ),
                        Spacer(),
                        CircleAvatar(
                          backgroundColor: Color(0xffC4C4C4),
                          child: Center(
                              child: Text(
                            'fi fi-rr-shopping-cart',
                            // ignore: prefer_const_constructors
                            style: TextStyle(
                                fontFamily: 'uicons',
                                color: Colors.black,
                                fontSize: 3.sp),
                          )),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(10.0),
                              color: AppColors.primary),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 1.h, horizontal: 1.h),
                            child: Text('Login Now',
                                style: GoogleFonts.roboto(
                                    fontSize: 2.sp, color: Colors.white)),
                          ),
                        )
                      ],
                    )
                  : Row(
                      children: [
                        Image.asset('assets/appicon.png',
                            height: 20.h, width: 20.w),
                        SizedBox(
                          width: 1.w,
                        ),
                        Text('Home',
                            style: GoogleFonts.poppins(fontSize: 10.sp)),
                        SizedBox(
                          width: 2.w,
                        ),
                        Text('Home',
                            style: GoogleFonts.poppins(fontSize: 10.sp)),
                        SizedBox(
                          width: 2.w,
                        ),
                        Text('Home',
                            style: GoogleFonts.poppins(fontSize: 10.sp)),
                        SizedBox(
                          width: 2.w,
                        ),
                        Text('Home',
                            style: GoogleFonts.poppins(fontSize: 10.sp)),
                        SizedBox(
                          width: 2.w,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 2.0.h, vertical: 2.0.h),
                          child: Center(
                              child: Text(
                            'fi fi-rr-shopping-cart',
                            // ignore: prefer_const_constructors
                            style: TextStyle(
                                fontFamily: 'uicons',
                                color: Colors.black87,
                                fontSize: 17.sp),
                          )),
                        ),
                      ],
                    )
            ],
          ),
        ),
      ),
    );
  }
}
