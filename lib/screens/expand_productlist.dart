import 'package:fastvai/api_services/homeapiservices.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fastvai/api_services/expandproductlistapi.dart';
import 'package:fastvai/reusable_widget/productcard.dart';
import 'package:google_fonts/google_fonts.dart';

class expandproductlist extends StatefulWidget {
  const expandproductlist({ Key? key }) : super(key: key);

  @override
  _expandproductlistState createState() => _expandproductlistState();
}

class _expandproductlistState extends State<expandproductlist> {

@override
 final ExpnadProductcontroller productcontroller = Get.put(ExpnadProductcontroller());
    var _data= Get.arguments;
    void initState() {  
  
  super.initState();
   print('fetching called');
   productcontroller.fetchProducts("${_data[1]}");  

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${_data[0]}",style: GoogleFonts.lato(color: Colors.black),),elevation: 0,backgroundColor: Colors.white,leading:  Padding(
        padding: const EdgeInsets.only(top: 15,left: 10),
        child: GestureDetector(
          onTap: (){
            Get.back();
          },
          child: const Text(
              'fi fi-rr-arrow-small-left',
              style: TextStyle(
                  fontFamily: 'uicons', color: Colors.black87, fontSize: 25,),
            ),
        ),
      ),),
      body: Obx(()  {
        if(productcontroller.isloading.value)
        {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }else if(productcontroller.isloading.value==false && productcontroller.productlist.isEmpty){

          return const Center(
            child: Text('No product available'),
          );
        }
        
        
        else{
          return RefreshIndicator(
            child: productListview(productcontroller: productcontroller),onRefresh: () async {productcontroller.fetchProducts("${_data[1]}");
          productcontroller.isloading(true);
          
          },); 
        }
          }
     

     )
        );
    
  }
}