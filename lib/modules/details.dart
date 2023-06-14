import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:stylclick/shared/constants/colors.dart';
import 'package:stylclick/shared/constants/images.dart';
import 'package:stylclick/shared/constants/strings.dart';
import 'package:stylclick/shared/utils/helpers.dart';
import 'package:stylclick/shared/widgets/custom_bottom_sheet.dart';

class Details extends StatelessWidget {
  Details({Key? key}) : super(key: key);

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
      backgroundColor: homeBgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(gradient: gradient),
                height: 56.h,
                child: Padding(
                  padding: EdgeInsets.only(left: 17.0.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          backIcon,
                          width: 24.w,
                        ),
                      ),
                      Text(
                        'Details',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 17.0.w, right: 17.w),
                child: Row(
                  children: [
                    Container(
                      width: 199.w,
                      height: 195.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: const DecorationImage(
                          image: AssetImage(femaleAsoebi),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      width: 199.w,
                      height: 195.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: const DecorationImage(
                          image: AssetImage(femaleAsoebi),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: white, borderRadius: BorderRadius.circular(5.r)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Female lace aso ebi',
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: storeNameColor,
                        fontFamily: cinta,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    4.height,
                    Text(
                      'NGN 50,000 - 100,000',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: cinta,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    4.height,
                    Row(
                      children: [
                        RatingBar.builder(
                          initialRating: 3,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 12,
                          // itemPadding: EdgeInsets.symmetric(
                          //     horizontal: 2.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 5,
                          ),
                          onRatingUpdate: (rating) {
                            log(rating);
                          },
                        ),
                        4.width,
                        Text(
                          '13 Reviews',
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontFamily: cinta,
                              fontWeight: FontWeight.bold,
                              color: signinTextColor),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Text(
                'Product details',
                style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: cinta,
                    fontWeight: FontWeight.w500,
                    color: productDetailsColor),
                textAlign: TextAlign.center,
              ),
              Container(
                decoration: BoxDecoration(
                    color: white, borderRadius: BorderRadius.circular(5.r)),
                height: 119.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Description',
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontFamily: cinta,
                              fontWeight: FontWeight.w600,
                              color: productDetailsTextColor),
                          textAlign: TextAlign.center,
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: viewAllTextColor,
                          size: 16,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Category',
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontFamily: cinta,
                              fontWeight: FontWeight.w600,
                              color: productDetailsTextColor),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          'Asoebi gown',
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontFamily: cinta,
                              fontWeight: FontWeight.w500,
                              color: productDetailsText2Color),
                          // textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Clothing material',
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontFamily: cinta,
                              fontWeight: FontWeight.w600,
                              color: productDetailsTextColor),
                          // textAlign: TextAlign.center,
                        ),
                        Text(
                          'Beaded lace and bridal satin',
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontFamily: cinta,
                              fontWeight: FontWeight.w500,
                              color: productDetailsText2Color),
                          // textAlign: TextAlign.center,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Text(
                'Seller information',
                style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: cinta,
                    fontWeight: FontWeight.w500,
                    color: productDetailsColor),
                textAlign: TextAlign.center,
              ),
              Container(
                height: 127.h,
                width: logicalWidth(),
                decoration: BoxDecoration(color: white),
                child: InkWell(
                  onTap: () {
                    addToCartSheet(context);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
                    child: Container(
                      height: 61.h,
                      decoration: BoxDecoration(
                          // color: white,
                          borderRadius: BorderRadius.circular(9),
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [primary, primaryGradient],
                          )),
                      child: Center(
                          child: Text('Proceed with order',
                              style: TextStyle(
                                  fontFamily: cinta,
                                  fontSize: 16.sp,
                                  color: white,
                                  fontWeight: FontWeight.bold))),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  addToCartSheet(BuildContext ctx) {
    showModalBottomSheet(
        isScrollControlled: true,
        elevation: 5,
        context: ctx,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(9.r), topRight: Radius.circular(9.r)),
        ),
        builder: (ctx) =>
            StatefulBuilder(builder: (context, StateSetter setState) {
              return CustomBottomSheet(
                height: deviceHeight(context) * 0.4,
                children: [
                  Text('M',
                      style: TextStyle(
                          fontFamily: cinta,
                          fontSize: 10.sp,
                          color: productDetailsTextColor,
                          fontWeight: FontWeight.w500)),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('NGN 50,000',
                              style: TextStyle(
                                  fontFamily: cinta,
                                  fontSize: 14.sp,
                                  color: productDetailsTextColor,
                                  fontWeight: FontWeight.bold)),
                          Text('In stock',
                              style: TextStyle(
                                  fontFamily: cinta,
                                  fontSize: 10.sp,
                                  color: instockTextColor,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Container(
                        height: 75.h,
                        width: 33.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3.r),
                            color: removeBtnColor),
                        child: const Center(
                            child: Icon(
                          Icons.remove,
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
                        height: 75.h,
                        width: 33.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3.r),
                            color: removeBtnColor),
                        child: const Center(
                            child: Icon(
                          Icons.add,
                          color: white,
                        )),
                      )
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      addedToCartSheet(ctx);
                    },
                    child: Padding(
                      padding:
                          EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
                      child: Container(
                        height: 61.h,
                        decoration: BoxDecoration(
                            // color: white,
                            borderRadius: BorderRadius.circular(9),
                            gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [primary, primaryGradient],
                            )),
                        child: Center(
                            child: Text('Add to Cart',
                                style: TextStyle(
                                    fontFamily: cinta,
                                    fontSize: 16.sp,
                                    color: white,
                                    fontWeight: FontWeight.bold))),
                      ),
                    ),
                  ),
                ],
              );
            }));
  }

  addedToCartSheet(BuildContext ctx) {
    showModalBottomSheet(
        isScrollControlled: true,
        elevation: 5,
        context: ctx,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(9.r), topRight: Radius.circular(9.r)),
        ),
        builder: (ctx) =>
            StatefulBuilder(builder: (context, StateSetter setState) {
              return CustomBottomSheet(
                height: deviceHeight(context) * 0.4,
                children: [
                  Text(
                    '2M, 2XL of Lace Aso ebi has been\nadded to your order',
                    style: TextStyle(
                        fontFamily: cinta,
                        fontSize: 16.sp,
                        color: viewOrderTextColor,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Padding(
                      padding:
                          EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
                      child: Container(
                        height: 61.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border:
                              Border.all(color: viewOrderBtnColor, width: 2),
                          borderRadius: BorderRadius.circular(9),
                        ),
                        child: Center(
                            child: Text('Add to Cart',
                                style: TextStyle(
                                    fontFamily: cinta,
                                    fontSize: 16.sp,
                                    color: viewOrderBtnTextColor,
                                    fontWeight: FontWeight.bold))),
                      ),
                    ),
                  ),
                ],
              );
            }));
  }
}
