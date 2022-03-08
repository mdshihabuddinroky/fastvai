import 'package:fastvai/api_services/orderlist.dart';
import 'package:fastvai/appcolor.dart';
import 'package:fastvai/controller/logincontroller.dart';
import 'package:fastvai/reusable_widget/shimmerloading/orderlist.dart';
import 'package:fastvai/screens/emptyscreen.dart';
import 'package:fastvai/screens/order_details.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';

class Orderlist extends StatefulWidget {
  const Orderlist({Key? key}) : super(key: key);

  @override
  State<Orderlist> createState() => _OrderlistState();
}

class _OrderlistState extends State<Orderlist> {
  final Ordercontroller ordercontroller = Get.put(Ordercontroller());
  final Logincontroller logincontroller = Get.put(Logincontroller());

  @override
  void initState() {
    ordercontroller.fetchProducts('1');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final statusimage = [
      'assets/orderplaced.png',
      'assets/orderconfirmed.png',
      'assets/processing.png',
      'assets/delivered.png',
      'assets/ordercancel.png'
    ];
    final color = [
      Colors.green,
      Colors.amber,
      Colors.blueAccent,
      Colors.orangeAccent,
      Colors.redAccent
    ];
    final statusname = [
      'Pending',
      'Confirmed',
      'Processing',
      'Delivered',
      'Cancel'
    ];
    final icon = [
      const CircleAvatar(
        child: Icon(Icons.pending),
      ),
      const CircleAvatar(
        child: Icon(Icons.done),
      ),
      const CircleAvatar(
        child: Icon(Icons.delivery_dining_sharp),
      ),
      const CircleAvatar(
        child: Icon(Icons.done_all),
      ),
      const CircleAvatar(
        child: Icon(Icons.cancel),
      )
    ];
    return Scaffold(
        backgroundColor: Colors.white,
        body: Obx(
          () => (ordercontroller.isloading.value)
              ? ordershimmerloading()
              : ListView.builder(
                  itemCount: ordercontroller.Orderlist.length,
                  itemBuilder: (BuildContext context, int index) {
                    var statusindex = 0;
                    if (ordercontroller.Orderlist[index].status == 'pending') {
                      statusindex = 0;
                    } else if (ordercontroller.Orderlist[index].status ==
                        'driver-assigned') {
                      statusindex = 1;
                    } else if (ordercontroller.Orderlist[index].status ==
                        'out-for-delivery') {
                      statusindex = 2;
                    } else if (ordercontroller.Orderlist[index].status ==
                        'completed') {
                      statusindex = 3;
                    } else {
                      statusindex = 4;
                    }

                    return GestureDetector(
                      onTap: () {
                        Get.to(Orderdetails(
                          data: ordercontroller.Orderlist[index],
                          status: statusname[statusindex],
                        ));
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 1.h, horizontal: 1.h),
                        child: Container(
                          decoration: BoxDecoration(
                              color: MyTheme.light_grey,
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 1.5.h, horizontal: 1.5.h),
                            child: Row(
                              children: [
                                icon[statusindex],
                                SizedBox(
                                  width: 5.w,
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Order #${ordercontroller.Orderlist[index].id.toString()}',
                                            style: TextStyle(
                                                fontFamily: 'heading',
                                                fontSize: 13.sp,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(
                                            '৳${ordercontroller.Orderlist[index].total}',
                                            style: TextStyle(
                                                fontFamily: 'subheading',
                                                fontSize: 10.sp,
                                                color: color[statusindex]),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 2.h),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            statusname[statusindex],
                                            style: TextStyle(
                                                fontFamily: 'heading',
                                                fontSize: 13.sp,
                                                color: color[statusindex],
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(
                                            Jiffy(ordercontroller
                                                    .Orderlist[index]
                                                    .dateCreated)
                                                .MMMEd
                                                .toString(),
                                            style: TextStyle(
                                                fontFamily: 'subheading',
                                                fontSize: 8.sp),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
        ));
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
