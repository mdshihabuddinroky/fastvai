import 'package:fastvai/api_services/cartapi.dart';
import 'package:fastvai/screens/product_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:sizer/sizer.dart';

class productListview extends StatelessWidget {
  final productcontroller;
  productListview({
    Key? key,
    required this.productcontroller,
  }) : super(key: key);

  final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: productcontroller.productlist.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(3.0),
          child: GestureDetector(
            onTap: () {
              Get.to(const details(),
                  arguments: [(productcontroller.productlist[index]), index]);
            },
            child: Card(
              elevation: 0,
              child: Container(
                clipBehavior: Clip.antiAlias,
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.network(
                      productcontroller.productlist[index].images[0].src,
                      fit: BoxFit.fill,
                      width: 100,
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 180,
                          child: Text(
                            productcontroller.productlist[index].name,
                            style: GoogleFonts.ptSans(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ),

                        //Text('${productcontroller.productlist[index].attributes}')
                        Container(
                          width: 150,
                          child: Html(
                            data: productcontroller
                                .productlist[index].purchaseNote,
                            style: {
                              "body": Style(
                                  fontSize: const FontSize(14.0),
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black,
                                  width: 200),
                            },
                          ),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          '৳${productcontroller.productlist[index].regularPrice}',
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Visibility(
                          visible: productcontroller.productlist[index].onSale,
                          child: Text(
                            '৳${productcontroller.productlist[index].salePrice}',
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.redAccent,
                                decoration: TextDecoration.lineThrough),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        GestureDetector(
                            onTap: () {
                              cartController.addcart(productcontroller
                                  .productlist[index].id
                                  .toString());
                            },
                            child: Container(
                              width: 10.w,
                              height: 5.h,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.deepOrange,
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsets.only(top: 0.9.h, right: 0.5.h),
                                child: const Text(
                                  'fi fi-rr-shopping-cart-add',
                                  style: TextStyle(
                                    fontFamily: 'uicons',
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ))
                      ],
                    ), //SizedBox(width: 5,)
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
