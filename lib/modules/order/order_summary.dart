import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:stylclick/shared/constants/colors.dart';
import 'package:stylclick/shared/constants/images.dart';
import 'package:stylclick/shared/constants/strings.dart';
import 'package:stylclick/shared/utils/helpers.dart';

import 'checkout.dart';

class OrderSummary extends StatefulWidget {
  const OrderSummary({Key? key}) : super(key: key);

  @override
  State<OrderSummary> createState() => _OrderSummaryState();
}

class _OrderSummaryState extends State<OrderSummary> {
  Gradient gradient = const LinearGradient(
    colors: [
      Color(0xFFEA4262),
      Color(0xFFDD6140),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffd1d1d1),
      bottomNavigationBar: InkWell(
        onTap: () async {
          CheckoutPage().launch(context);
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 17, right: 17, bottom: 17),
          child: Container(
            height: 48.h,
            decoration: BoxDecoration(
                // color: white,
                borderRadius: BorderRadius.circular(9),
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [primary, primaryGradient],
                )),
            child: Center(
                child: Text('Checkout (NGN 5000)',
                    style: TextStyle(
                        fontFamily: cinta,
                        fontSize: 16.sp,
                        color: white,
                        fontWeight: FontWeight.bold))),
          ),
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          height: 100.h,
          decoration: BoxDecoration(gradient: gradient),
          child: Padding(
            padding: EdgeInsets.only(left: 17.0.w, right: 17.w),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    backIcon,
                    width: 24.w,
                    color: white,
                  ),
                ),
                8.width,
                Text(
                  'My Order',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.sp,   fontFamily: comfortaa,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.only(left: 17.w, right: 17.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            16.height,
            Text(
              'Order Summary',
              style: TextStyle(
                color: const Color(0xff898a8d),
                fontSize: 14.sp,   fontFamily: cinta,
                fontWeight: FontWeight.w500,
              ),
            ),
            8.height,
            Container(
              height: 100,
              decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(width: 1, color: const Color(0xffdddcdc))),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8, top: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    // 16.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Sub total',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.sp,   fontFamily: cinta,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'NGN 24500',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.sp,   fontFamily: cinta,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    24.height,
                    Text(
                      'Delivery fee not included yet',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.sp,   fontFamily: cinta,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            16.height,
            Text(
              'Cart (4)',
              style: TextStyle(
                color: const Color(0xff898a8d),
                fontSize: 14.sp,
                fontFamily: cinta,
                fontWeight: FontWeight.w500,
              ),
            ),
            8.height,
            SizedBox(
              height: logicalHeight(),
              width: logicalWidth(),
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(5),
                          border:
                              Border.all(width: 1, color: const Color(0xffdddcdc))),
                      height: 200,
                      child: Row(
                        children: [
                          8.width,
                          Image.asset(
                            maleAsoebi,
                            height: 180.h,
                            width: 150.w,
                            fit: BoxFit.cover,
                          ),
                          16.width,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              16.height,
                              Text(
                                'Swiss Ankara',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.sp,
                                  fontFamily: cinta,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                'Moraloke store',
                                style: TextStyle(
                                  color: const Color(0xff7e7e7e),
                                  fontSize: 12.sp,
                                  fontFamily: cinta,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              8.height,
                              Text(
                                'NGN 3500/yard',
                                style: TextStyle(
                                  color: const Color(0xffef4a47),
                                  fontSize: 12.sp,
                                  fontFamily: cinta,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              8.height,
                              Text(
                                'M',
                                style: TextStyle(
                                  color: const Color(0xff7e7e7e),
                                  fontSize: 12.sp,
                                  fontFamily: cinta,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              8.height,
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    height: 32.h,
                                    width: 28.w,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(3.r),
                                        color: const Color(0xffcccccc)),
                                    child: const Center(
                                        child: Icon(
                                      Icons.remove,
                                      size: 16,
                                      color: white,
                                    )),
                                  ),
                                  8.width,
                                  Text('0',
                                      style: TextStyle(
                                          fontFamily: cinta,
                                          fontSize: 14.sp,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500)),
                                  8.width,
                                  Container(
                                    height: 32.h,
                                    width: 28.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(3.r),
                                      color: const Color(0xffef4a47),
                                    ),
                                    child: const Center(
                                        child: Icon(
                                      Icons.add,
                                      size: 16,
                                      color: white,
                                    )),
                                  )
                                ],
                              ),
                              24.height,
                              InkWell(
                                onTap: () {
                                  removeItem(context);
                                },
                                child: Row(
                                  children: [
                                    Container(
                                      height: 16.h,
                                      width: 16.w,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: const Color(0xffef4a47),
                                          ),
                                          color: Colors.white),
                                      child: const Center(
                                          child: Icon(
                                        Icons.remove,
                                        size: 10,
                                        color: Color(0xffef4a47),
                                      )),
                                    ),
                                    4.width,
                                    Text('Remove',
                                        style: TextStyle(
                                            fontFamily: cinta,
                                            fontSize: 14.sp,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500)),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      )),
    );
  }

  removeItem(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.r), topRight: Radius.circular(25.r)),
        ),
        builder: (BuildContext context) {
          return Container(
              height: logicalHeight() * 0.36,
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Remove from order',
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: const Color(0xffef4a47),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  8.height,
                  Text(
                    'Do you really want to remove this item\nfrom the order',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  16.height,
                  InkWell(
                    onTap: () async {},
                    child: Container(
                      height: 48.h,
                      decoration: BoxDecoration(
                          // color: white,
                          borderRadius: BorderRadius.circular(9),
                          color: const Color(0xffd9d9d9)),
                      child: Center(
                          child: Text('Save for later',
                              style: TextStyle(
                                  fontFamily: cinta,
                                  fontSize: 16.sp,
                                  color: const Color(0xffffffff),
                                  fontWeight: FontWeight.bold))),
                    ),
                  ),
                  16.height,
                  InkWell(
                    onTap: () async {},
                    child: Container(
                      height: 48.h,
                      decoration: BoxDecoration(
                          // color: white,
                          borderRadius: BorderRadius.circular(9),
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [primary, primaryGradient],
                          )),
                      child: Center(
                          child: Text('Remove Product',
                              style: TextStyle(
                                  fontFamily: cinta,
                                  fontSize: 16.sp,
                                  color: white,
                                  fontWeight: FontWeight.bold))),
                    ),
                  ),
                  24.height,
                ],
              ));
        });
  }
}
