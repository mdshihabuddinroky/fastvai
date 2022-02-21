// ignore_for_file: file_names, unrelated_type_equality_checks

import 'package:fastvai/api_services/storeapiservice.dart';
import 'package:fastvai/controller/logincontroller.dart';
import 'package:fastvai/reusable_widget/storewidgets/bottomitem.dart';
import 'package:fastvai/screens/Store/loginbottombar.dart';
import 'package:fastvai/screens/Store/orderlist.dart';
import 'package:fastvai/screens/Store/storehome.dart';
import 'package:fastvai/screens/Store/storemyaccount.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:fastvai/appcolor.dart';

import 'package:shimmer/shimmer.dart';
import 'package:fastvai/Models/storemodel.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({Key? key}) : super(key: key);

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    logincontroller.checklogin();
    Getlocation();
    logincontroller.islogin();
    tabController = TabController(
      length: 4,
      vsync: this,
      initialIndex: 0,
    );
    tabController!.addListener(() {
      var typelist = ['', 'Food', 'Grocery', 'Pharmacy'];

      searchdata(typelist[tabController!.index]);
    });
    super.initState();
  }

  // List<String> list = [].obs;
  var locationlist = [].obs;
  final Storecontroller storecontroller = Get.put(Storecontroller());
  final Logincontroller logincontroller = Get.put(Logincontroller());

  Getlocation() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var List = pref.getStringList('userlocation');

    locationlist(List);
    if (locationlist != null) {
      storecontroller.fetchBanners(locationlist);
    }
  }

  searchdata(str) {
    var strExist = str.length > 0 ? true : false;
    if (strExist) {
      var localstorelist = <Store>[];
      for (var i = 0; i < storecontroller.unfilterstorelist.length; i++) {
        if (storecontroller.unfilterstorelist[i].type.contains(str)) {
          localstorelist.add(storecontroller.unfilterstorelist[i]);
        }
      }
      var filterexist = localstorelist == null ? false : true;
      if (filterexist) {
        storecontroller.storelist.value = localstorelist;
        print(storecontroller.storelist.value);
      }
    } else {
      storecontroller.storelist.value = storecontroller.unfilterstorelist;
    }
  }

  @override
  Widget build(BuildContext context) {
    var bottomindex = 0.obs;
    var ismyaccount = false.obs;

    var Screenlist = [
      StoreHome(storecontroller: storecontroller, tabController: tabController),
      Orderlist(),
      MyAccount()
    ];

    return Obx(() => Scaffold(
        appBar: AppBar(
          title: (ismyaccount.value)
              ? Center(
                  child: Text('My Account',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.2,
                          fontFamily: 'heading',
                          fontSize: 14.sp)),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //title
                    Text('Home',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2,
                            fontFamily: 'heading',
                            fontSize: 14.sp)),
                    //address text
                    Text(
                      'Marishya Govt primary school',
                      style: GoogleFonts.lato(
                          color: Colors.black45,
                          fontWeight: FontWeight.w500,
                          fontSize: 10.sp),
                    ),
                  ],
                ),
          backgroundColor: Colors.white,
          elevation: 0,
          leading: (ismyaccount.value)
              ? Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 0.6.h, vertical: 0.7.h),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: AppColors.lighterGray,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 0.7.h),
                      child: Text(
                        'fi fi-rr-arrow-small-left',
                        // ignore: prefer_const_constructors
                        style: TextStyle(
                            fontFamily: 'uicons',
                            color: Colors.black87,
                            fontSize: 19.sp),
                      ),
                    ),
                  ),
                )
              : Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 0.5.h, vertical: 0.2.h),
                  child: const CircleAvatar(
                    radius: 10,
                    backgroundColor: AppColors.primary,
                    child: Icon(
                      Icons.location_on_outlined,
                      color: AppColors.white,
                    ),
                  ),
                ),
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.0.h, vertical: 2.0.h),
              child: Center(
                  child: Text(
                'fi fi-rr-shopping-cart',
                // ignore: prefer_const_constructors
                style: TextStyle(
                    fontFamily: 'uicons',
                    color: Colors.black87,
                    fontSize: 15.sp),
              )),
            )
          ],
        ),
        //bottomnavigation bar properties
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: AppColors.primary,
          selectedLabelStyle: const TextStyle(fontFamily: 'subheading'),
          unselectedLabelStyle: const TextStyle(fontFamily: 'subheading'),
          currentIndex: bottomindex.value,
          onTap: (int index) async {
            if (index == 1) {
              // Obtain shared preferences.

              if (logincontroller.islogin.value == false) {
                bottomindex(0);
                LoginBottom();
                print('loginbootom');
              } else {
                bottomindex(index);
              }
            } else {
              bottomindex(index);
            }
          },
          items: bottomitem,
        ),
        backgroundColor: AppColors.lighterGray,
        body: Screenlist[bottomindex.value]));
  }
}
