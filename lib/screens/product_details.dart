import 'package:fastvai/appcolor.dart';
import 'package:fastvai/screens/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/shims/dart_ui_real.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class details extends StatelessWidget {
  const details({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CarouselController _controller = CarouselController();
    var Itemcount = RxInt(1);
    final _data = Get.arguments;
    Increament() {
      Itemcount++;
    }

    Decrement() {
      if (Itemcount != 0) {
        Itemcount--;
      }
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {Get.back();},
          icon: const CircleAvatar(
            radius: 16,
            child: Center(
              child: Text(
                'fi fi-rr-arrow-small-left',
                style: TextStyle(
                    fontFamily: 'uicons', fontSize: 25, color: Colors.black),
              ),
            ),
            backgroundColor: Colors.black12,
          ),
          splashColor: Colors.black38,
          splashRadius: 20.0,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const CircleAvatar(
                child: Padding(
                  padding: EdgeInsets.only(top: 7),
                  child: Text(
                    'fi fi-rr-shopping-cart',
                    style: TextStyle(
                        fontFamily: 'uicons',
                        fontSize: 20,
                        color: Colors.black),
                  ),
                ),
                backgroundColor: Colors.black12),
            splashColor: Colors.black38,
            splashRadius: 20.0,
          )
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height-100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 180,
                  child: Stack(
                    children: [
                      SizedBox(
                        height: 220,
                        width: MediaQuery.of(context).size.width,
                        child: CarouselSlider.builder(
                          carouselController: _controller,
                          itemCount: _data[0].images.length,
                          itemBuilder: (BuildContext context, index, nothing) {
                            return Container(
                                height: 150,
                                color: Colors.blueAccent,
                                child: Image.network(_data[0].images[index].src));
                          },
                          options: CarouselOptions(
                            autoPlay: false,
                            enlargeCenterPage: true,
                            viewportFraction: 1,
                            height: 150,
                            aspectRatio: 1.0,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Align(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                onPressed: () {
                                  _controller.previousPage();
                                },
                                icon: const Text(
                                  'fi fi-rr-angle-left',
                                  style: TextStyle(
                                      fontFamily: 'uicons', fontSize: 25),
                                ),
                                splashColor: Colors.black38,
                                splashRadius: 20.0,
                              ),
                              const Expanded(child: SizedBox()),
                              IconButton(
                                onPressed: () {
                                  _controller.nextPage();
                                },
                                icon: const Text(
                                  'fi fi-rr-angle-right',
                                  style: TextStyle(
                                      fontFamily: 'uicons', fontSize: 25),
                                ),
                                splashColor: Colors.black38,
                                splashRadius: 20.0,
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Text(
                        _data[0].name,
                        style: GoogleFonts.poppins(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const Expanded(child: SizedBox()),
                      Text(
                        '৳${_data[0].price}',
                        style: GoogleFonts.lato(
                            fontSize: 20, fontWeight: FontWeight.w800),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Container(
                    width: 105,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.lightGray),
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Decrement();
                            },
                            icon: const Expanded(
                                child: Icon(
                              Icons.remove,
                              size: 20,
                            ))),
                        Obx(() => Text(Itemcount.toString())),
                        IconButton(
                            onPressed: () {
                              Increament();
                            },
                            icon: const Expanded(
                                child: Icon(
                              Icons.add,
                              size: 20,
                            ))),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Description',
                    style: GoogleFonts.roboto(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ),
                Html(
                  data: "${_data[0].description}",
                  shrinkWrap: true,
                ),Spacer(),
                 Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(10)),
                  height: 40,
                  width: 200,
                  child: GestureDetector(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 10.0),
                            child: Text(
                              'fi fi-rr-shopping-cart-add',
                              style: TextStyle(
                                  fontFamily: 'uicons',
                                  fontSize: 20,
                                  color: Colors.white),
                            ),
                          ),
                          Text(
                            'Add to cart',
                            style: GoogleFonts.lato(
                                fontSize: 22, color: Colors.white),
                          )
                        ],
                      )),
                ),
              )
                
               
              ],
            ),
          ),
        ),
      ),
    );
  }
}
