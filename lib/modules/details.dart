import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:stylclick/shared/constants/colors.dart';
import 'package:stylclick/shared/constants/images.dart';
import 'package:stylclick/shared/constants/strings.dart';
import 'package:stylclick/shared/utils/helpers.dart';
import 'package:stylclick/shared/widgets/custom_bottom_sheet.dart';

class CategoryDetails extends StatelessWidget {
  CategoryDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: homeBgColor,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          height: 100.h,
          decoration: const BoxDecoration(gradient: brandGradient),
          child: Padding(
            padding: EdgeInsets.only(left: 17.0.w, right: 17.w),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    pop();
                  },
                  child: Image.asset(
                    backIcon,
                    width: 24.w,
                    color: white,
                  ),
                ),
                8.width,
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
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              16.height,
              Padding(
                padding: EdgeInsets.only(left: 17.0.w, right: 17.w),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        width: 180.w,
                        height: 180.h,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(femaleAsoebi),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    8.width,
                    Expanded(
                      child: Container(
                        width: 180.w,
                        height: 180.h,
                        decoration: const BoxDecoration(
                          // borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            image: AssetImage(femaleAsoebi),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              16.height,
              Padding(
                padding: EdgeInsets.only(left: 17.0.w, right: 17.w),
                child: Container(
                  height: 150.h,
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage(walletBg),
                        fit: BoxFit.cover,
                      ),
                      color: white,
                      borderRadius: BorderRadius.circular(5.r)),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 8.0, top: 16, right: 8),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
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
                        8.height,
                        Text(
                          'NGN 50,000 - 100,000',
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontFamily: cinta,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        8.height,
                        Row(
                          mainAxisSize: MainAxisSize.min,
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
                              itemBuilder: (context, _) => const Icon(
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
                        8.height,
                        const Divider(
                          thickness: 1,
                          color: Color.fromRGBO(0, 0, 0, 0.16),
                        ),
                        // 8.height,
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Size',
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontFamily: cinta,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xff263238)),
                              textAlign: TextAlign.center,
                            ),
                            const Spacer(),
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
                ),
              ),
              16.height,
              Padding(
                padding: EdgeInsets.only(left: 17.0.w, right: 17.w, bottom: 8),
                child: Text(
                  'Product details',
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: cinta,
                      fontWeight: FontWeight.w500,
                      color: productDetailsColor),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 17.0.w, right: 17.w),
                child: Container(
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage(walletBg),
                        fit: BoxFit.cover,
                      ),
                      color: white,
                      borderRadius: BorderRadius.circular(5.r)),
                  height: 100.h,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 8.0, top: 16, right: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Description',
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontFamily: cinta,
                                  fontWeight: FontWeight.w700,
                                  color: productDetailsTextColor),
                              textAlign: TextAlign.center,
                            ),
                            Spacer(),
                            const Icon(
                              Icons.arrow_forward_ios,
                              color: viewAllTextColor,
                              size: 14,
                            )
                          ],
                        ),
                        8.height,
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Category',
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontFamily: cinta,
                                  fontWeight: FontWeight.w700,
                                  color: productDetailsTextColor),
                              textAlign: TextAlign.center,
                            ),
                            8.width,
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
                        8.height,
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Clothing material',
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontFamily: cinta,
                                  fontWeight: FontWeight.w700,
                                  color: productDetailsTextColor),
                              // textAlign: TextAlign.center,
                            ),
                            8.width,
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
                ),
              ),
              16.height,
              Padding(
                padding: EdgeInsets.only(left: 17.0.w, right: 17.w, bottom: 8),
                child: Text(
                  'Seller information',
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: cinta,
                      fontWeight: FontWeight.w500,
                      color: productDetailsColor),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                height: 127.h,
                width: logicalWidth(),
                decoration: const BoxDecoration(color: white),
                child: InkWell(
                  onTap: () {
                    addToCartSheet(context);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 20.w, right: 20.w, top: 20.h, bottom: 50.h),
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
              topLeft: Radius.circular(25.r), topRight: Radius.circular(25.r)),
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
                    mainAxisSize: MainAxisSize.min,
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
                      Spacer(),
                      Container(
                        height: 24.h,
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
                      padding: EdgeInsets.only(top: 20.h, bottom: 24.h),
                      child: Container(
                        height: 48.h,
                        width: logicalWidth(),
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
              topLeft: Radius.circular(25.r), topRight: Radius.circular(25.r)),
        ),
        builder: (ctx) =>
            StatefulBuilder(builder: (context, StateSetter setState) {
              return CustomBottomSheet(
                height: deviceHeight(context) * 0.4,
                children: [
                  24.height,
                  24.height,
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
                      padding: EdgeInsets.only(top: 20.h, bottom: 24.h),
                      child: Container(
                        height: 48.h,
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
