import 'package:carousel_slider/carousel_state.dart';
import 'package:fastvai/reusable_widget/productcard.dart';
import 'package:fastvai/screens/product_details.dart';
import 'package:fastvai/screens/search.dart';
import 'package:flutter/material.dart';
import 'package:fastvai/appcolor.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_html/style.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:fastvai/api_services/homeapiservices.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fastvai/reusable_widget/seemore.dart';
import 'package:fastvai/screens/expand_productlist.dart';




class Home extends StatelessWidget {
  final Productcontroller productcontroller = Get.put(Productcontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Center(
            child: Text(
          'fi fi-rr-arrow-small-left',
          style: TextStyle(
              fontFamily: 'uicons', color: Colors.black87, fontSize: 25),
        )),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Baghaichari Store',
              style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            Text(
              'view Details ',
              style: GoogleFonts.poppins(fontSize: 14, color: Colors.black87),
            ),
          ],
        ),
        actions:   [
          Center(
              child: GestureDetector(
                onTap: (){Get.to(SearchWidget());},
                child: const Text(
                          'fi fi-rr-search',
                          style: TextStyle(
                  fontFamily: 'uicons', color: Colors.black87, fontSize: 22),
                        ),
              )),
          const SizedBox(
            width: 15,
          ),
          const Center(
              child: Text(
            'fi fi-rr-shopping-cart',
            style: TextStyle(
                fontFamily: 'uicons', color: Colors.black87, fontSize: 22),
          )),
          const SizedBox(
            width: 15,
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Obx(() {
        if (productcontroller.isloading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                 width: MediaQuery.of(context).size.width,
                child: CarouselSlider(
                    items: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            'https://fiverr-res.cloudinary.com/images/q_auto,f_auto/gigs2/184628548/original/a41a65716fc0987f47811c8eafd72bb9aeacf34b/design-food-banner-flyer-poster-or-restaurant-food-menu-4348.jpg',
                            width: 280,
                            fit: BoxFit.cover,
                          )),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            'https://img.freepik.com/free-vector/cash-delivery-illustration-pay-with-cash-after-package-is-delivered_106954-598.jpg?size=626&ext=jpg',
                            width: 280,
                            fit: BoxFit.cover,
                          )),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            'https://media.istockphoto.com/vectors/fast-delivery-by-scooter-on-mobile-ecommerce-and-order-concept-online-vector-id1224069801?k=6&m=1224069801&s=170667a&w=0&h=LDc3h9u952_mCO4M07VrdzrLhggeeeHLWrER1YKNWoA=',
                            width: 280,
                            fit: BoxFit.cover,
                          ))
                    ],
                    options: CarouselOptions(
                      autoPlay: true,
                      autoPlayAnimationDuration: const Duration(seconds: 2),
                          enlargeCenterPage:true,
                          viewportFraction: 1,
                          height: 150,
                         aspectRatio: 1.0,
                         
                       //  aspectRatio: 1.0,
                       // aspectRatio: 16.9,
                        autoPlayInterval: const Duration(microseconds: 3000),
                        )),
              ),
              const Seemore(text: 'Categories'),
              Container(
                height: 110,
                child: Padding(
                  padding:  EdgeInsets.only(left: 10, right: 10),
                  child: CatgeoryListview(productcontroller: productcontroller),
                ),
              ),
              const Seemore(text: 'Popular products'),
              Padding(
                padding:  EdgeInsets.all(5.0),
                child: productListview(productcontroller: productcontroller),
              ),
            ],
          ),
        );
      }),
    );
  }
}

class CatgeoryListview extends StatelessWidget {
  const CatgeoryListview({
    Key? key,
    required this.productcontroller,
  }) : super(key: key);

  final Productcontroller productcontroller;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: productcontroller.categorylist.length,
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding:  EdgeInsets.all(8.0),
          child: GestureDetector(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      productcontroller
                          .categorylist[index].image.src,
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    )),
                Text(
                  productcontroller.categorylist[index].name,
                  style: GoogleFonts.lato(),
                )
              ],
            ),
            onTap: () {
             Get.to(() => expandproductlist(),arguments: [(productcontroller.categorylist[index].name),productcontroller.categorylist[index].id]);
            },
          ),
        );
      },
    );
  }
}

