import 'package:fastvai/Models/storemodel.dart';
import 'package:fastvai/controller/onesignaluserid.dart';
import 'package:fastvai/screens/LandingPage/Landing_page.dart';
import 'package:fastvai/screens/debug.dart';
import 'package:fastvai/screens/home.dart';
import 'package:fastvai/screens/order_details.dart';
import 'package:fastvai/screens/search.dart';
import 'package:fastvai/screens/set_delivery.dart';
import 'package:fastvai/screens/introductionscreen.dart';
import 'package:fastvai/screens/Store/store.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.black, // navigation bar color
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark));

  runApp(const Splash());
}

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final Onesignalcontroller onesignalc = Get.put(Onesignalcontroller());
  @override
  void initState() {
    super.initState();
    onesignalc.onesignalinit();
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Fastvai',
          theme: ThemeData.light(),
          home: AnimatedSplashScreen(
              backgroundColor: Color.fromARGB(255, 18, 37, 71),
              splash: 'assets/appicon.png',
              nextScreen: const StoreScreen()),
        );
      },
    );
  }
}
