import 'package:fastvai/component/icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Webview extends StatelessWidget {
  const Webview({Key? key, this.title, this.link}) : super(key: key);
  final title;
  final link;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Center(
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Padding(
                padding: EdgeInsets.only(top: 1.h),
                child: Uicons(
                  iconName: 'fi fi-rr-angle-left',
                  iconcolor: Colors.black,
                  iconsize: 14.sp,
                ),
              ),
            ),
          ),
          backgroundColor: Colors.white,
          title: Text(title,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.2,
                  fontFamily: 'heading',
                  fontSize: 14.sp)),
        ),
        body: WebView(
          initialUrl: link,
          javascriptMode: JavascriptMode.unrestricted,
        ));
  }
}
