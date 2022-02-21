import 'package:flutter/material.dart';

import 'package:introduction_screen/introduction_screen.dart';
import 'package:fastvai/screens/home.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import 'package:fastvai/screens/set_delivery.dart';
import 'package:sizer/sizer.dart';

class Onboard extends StatefulWidget {
  const Onboard({Key? key}) : super(key: key);

  @override
  _OnboardState createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0),
      child: IntroductionScreen(
        showNextButton: true,
        next: Text(
          'Next',
          style: GoogleFonts.lato(color: Colors.black, fontSize: 13.sp),
        ),
        done: Text('Done',
            style: GoogleFonts.lato(color: Colors.black, fontSize: 13.sp)),
        dotsDecorator: const DotsDecorator(activeColor: Colors.redAccent),
        globalBackgroundColor: Colors.white,
        showSkipButton: true,
        skip: Text('Skip',
            style: GoogleFonts.lato(color: Colors.black, fontSize: 13.sp)),
        onSkip: () {
          Get.offAll(const SetLocation(), transition: Transition.topLevel);
        },
        onDone: () {
          Get.offAll(const SetLocation(), transition: Transition.topLevel);
        },
        pages: [
          PageViewModel(
              title: 'Select Store',
              body:
                  'Select your location to see nearest stores. Then select trustable store that was nearest to you to get fast delivery',
              image: Lottie.asset('assets/67312-store-location.json'),
              decoration: PageDecoration(
                  titleTextStyle: GoogleFonts.notoSans(
                      fontSize: 12.sp, fontWeight: FontWeight.w800),
                  bodyTextStyle: GoogleFonts.ptSans(
                      fontSize: 10.sp, color: Colors.black54),
                  imagePadding: const EdgeInsets.only(top: 50))),
          PageViewModel(
              title: 'Add to Cart',
              body:
                  'add to cart products that you want to buy from your trustable store',
              image: Lottie.asset('assets/61212-add-to-watchlistcart.json'),
              decoration: PageDecoration(
                  titleTextStyle: GoogleFonts.notoSans(
                      fontSize: 12.sp, fontWeight: FontWeight.w800),
                  bodyTextStyle: GoogleFonts.ptSans(
                      fontSize: 10.sp, color: Colors.black54),
                  imagePadding: const EdgeInsets.only(top: 50))),
          PageViewModel(
              title: 'Instant cash On Delivery',
              body:
                  'Place your order and get delivery instant. We provide cash on delivery all over the country.So only pay when you get',
              image: Lottie.asset('assets/56575-delivery-boy.json'),
              decoration: PageDecoration(
                  titleTextStyle: GoogleFonts.notoSans(
                      fontSize: 12.sp, fontWeight: FontWeight.w800),
                  bodyTextStyle: GoogleFonts.ptSans(
                      fontSize: 10.sp, color: Colors.black54),
                  imagePadding: const EdgeInsets.only(top: 50))),
          PageViewModel(
              title: 'Allow location permission',
              body:
                  'By allowing location access, you can search for restaurants and shop near you & receive more accuracy delivery',
              image: Lottie.asset('assets/10572-location-permissions(1).json'),
              decoration: PageDecoration(
                  titleTextStyle: GoogleFonts.notoSans(
                      fontSize: 12.sp, fontWeight: FontWeight.w800),
                  bodyTextStyle: GoogleFonts.ptSans(
                      fontSize: 10.sp, color: Colors.black54),
                  imagePadding: const EdgeInsets.only(top: 50)))
        ],
      ),
    );
  }
}
