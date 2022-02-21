import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Uicons extends StatelessWidget {
  const Uicons({Key? key, this.iconName, this.iconcolor, this.iconsize})
      : super(key: key);
  final iconName;
  final iconcolor;
  final iconsize;

  @override
  Widget build(BuildContext context) {
    return Text(
      iconName,
      // ignore: prefer_const_constructors
      style:
          TextStyle(fontFamily: 'uicons', color: iconcolor, fontSize: iconsize),
    );
  }
}
