import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

DateTime now = DateTime.now();
String formattedDate = DateFormat('yyyy-MM-dd - kk:mm').format(now);

class Debug extends StatelessWidget {
  const Debug({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('fff'),
        ],
      )),
    );
  }
}
