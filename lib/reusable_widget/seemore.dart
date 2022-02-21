import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Seemore extends StatelessWidget {
  final String text;
  const Seemore({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  const EdgeInsets.only(top: 10,left: 15,right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            text,
            style:  GoogleFonts.ptSans(fontSize: 16,color:Colors.red),
          ),
           const Text(
            'See More',
            style: TextStyle(fontSize: 14,color: Colors.blueAccent),
          )
        ],
      ),
    );
  }
}
