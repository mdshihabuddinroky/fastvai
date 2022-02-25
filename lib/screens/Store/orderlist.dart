import 'package:fastvai/appcolor.dart';
import 'package:fastvai/reusable_widget/shimmerloading/orderlist.dart';
import 'package:fastvai/screens/emptyscreen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Orderlist extends StatelessWidget {
  const Orderlist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Container();
        },
      ),
    );
  }

  ListView ordershimmerloading() {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (contenxt, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 13.h,
              width: 95.w,
              decoration: BoxDecoration(
                  color: MyTheme.light_grey,
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 3.w,
                    ),
                    Ordershimmer(
                      height: 10.h,
                      width: 20.w,
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Ordershimmer(
                          height: 3.h,
                          width: 45.w,
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Ordershimmer(
                          height: 3.h,
                          width: 65.w,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

class Emptyorder extends StatelessWidget {
  const Emptyorder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Empty(
          icon: Icons.list_alt_outlined,
          title: 'No Order History',
          subtitle:
              'You have no order history. Please make order & get fastest delivery in Bangladesh',
        ),
      ],
    );
  }
}
