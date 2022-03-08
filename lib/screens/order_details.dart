import 'package:fastvai/api_services/orderlist.dart';
import 'package:fastvai/appcolor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:sizer/sizer.dart';

class Orderdetails extends StatelessWidget {
  Orderdetails({Key? key, this.data, this.status}) : super(key: key);
  final data;
  final status;
  final Ordercontroller ordercontroller = Get.put(Ordercontroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          title: const Text(
            'Order Details',
            style: TextStyle(fontFamily: 'primary', color: AppColors.black),
          ),
          elevation: 0,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 2.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 3.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '#Order Id: ${data.id.toString()}',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 11.sp,
                              fontFamily: 'primary'),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Text(
                          Jiffy(data.dateCreated).MMMEd.toString(),
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w700,
                              fontSize: 10.sp),
                        )
                      ],
                    ),
                    Text(
                      status,
                      style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w700,
                          fontSize: 12.sp),
                    )
                  ],
                ),
                SizedBox(
                  height: 1.8.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Delivered to',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 10.sp,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      data.billing.address1,
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontFamily: 'primary',
                          fontSize: 11.sp),
                    )
                  ],
                ),
                SizedBox(
                  height: 1.8.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Payment Method',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 10.sp,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      data.paymentMethod,
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontFamily: 'primary',
                          fontSize: 11.sp),
                    )
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                ListView.builder(
                    itemCount: data.lineItems.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return productlist(context, index);
                    }),
                SizedBox(
                  height: 5.h,
                ),
                rowline(context, 'Discount Total', '৳${data.discountTotal}'),
                SizedBox(height: 1.h),
                rowline(context, 'Shipping Total', "৳${data.shippingTotal}"),
                SizedBox(height: 1.h),
                rowline(context, 'Total price', '৳${data.total}')
              ],
            ),
          ),
        ));
  }

  Widget rowline(BuildContext context, String maintext, String price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          maintext,
          style: TextStyle(
              fontSize: 9.sp,
              color: Color.fromARGB(204, 0, 0, 0),
              fontWeight: FontWeight.w500),
        ),
        Text(
          price,
          style:
              TextStyle(fontWeight: FontWeight.w500, fontFamily: 'secondary'),
        )
      ],
    );
  }

// ignore: camel_case_types

  Widget productlist(BuildContext context, int index) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.2.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.lineItems[index].name,
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 11.sp,
                    fontFamily: 'primary'),
              ),
              SizedBox(
                height: 1.h,
              ),
              Text(
                'Quantity: ${data.lineItems[index].quantity.toString()}',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w700,
                    fontSize: 8.sp),
              )
            ],
          ),
          Text(
            '৳${data.lineItems[index].price.toString()}',
            style: TextStyle(
                color: AppColors.black,
                fontWeight: FontWeight.w700,
                fontSize: 10.sp),
          )
        ],
      ),
    );
  }
}
