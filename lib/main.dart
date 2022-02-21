import 'package:fastvai/screens/LandingPage/Landing_page.dart';
import 'package:fastvai/screens/home.dart';
import 'package:fastvai/screens/search.dart';
import 'package:fastvai/screens/set_delivery.dart';
import 'package:fastvai/screens/introductionscreen.dart';
import 'package:fastvai/screens/Store/store.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
//import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.black, // navigation bar color
    statusBarColor: Colors.white, // status bar color
  ));

  runApp(const Splash());
}

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    onesignalinit();
  }

  onesignalinit() {
    // OneSignal.shared.setAppId("c73de0da-2479-4680-8b73-6d48363d252e");
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
              splash: 'assets/ficonfast.jpg', nextScreen: const StoreScreen()),
        );
      },
    );
  }
}
