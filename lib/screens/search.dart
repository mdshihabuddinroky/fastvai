import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 10,top: 5,right: 10,bottom: 20),
          child: TextField(
          
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                borderSide: BorderSide(
                  width: 0,
                  color: Colors.red,
                  style: BorderStyle.none,
                ),
              ),
              filled: true,
              prefixIcon: Icon(
                Icons.search,
                color: Colors.redAccent,
              ),
              fillColor: Colors.white60,
              suffixIcon: Icon(Icons.sort,color: Colors.redAccent,),
              hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
              hintText: "What would your like to buy?",
            ),
            
          ),
        ),
      ),
    );
  }
  
}