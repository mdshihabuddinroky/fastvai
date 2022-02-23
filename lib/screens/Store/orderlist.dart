import 'package:fastvai/screens/emptyscreen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Orderlist extends StatelessWidget {
  const Orderlist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Ordershimmer();
        // Spacer(),
        // Center(
        //   child: Empty(
        //     icon: Icons.list_alt_outlined,
        //     title: 'No Order History',
        //     subtitle:
        //         'You have no order history. Please make order & get fastest delivery in Bangladesh',
        //   ),
        // ),
        // Spacer(),
      ],
    ));
  }
}
