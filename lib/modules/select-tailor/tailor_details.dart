import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:stylclick/shared/constants/colors.dart';
import 'package:stylclick/shared/constants/images.dart';
import 'package:stylclick/shared/constants/strings.dart';
import 'package:stylclick/shared/utils/helpers.dart';
import 'package:stylclick/shared/widgets/custom_textfield.dart';

class TailorDetails extends StatelessWidget {
  final String businessName;
  TailorDetails({Key? key, required this.businessName}) : super(key: key);

  Gradient gradient = const LinearGradient(
    colors: [
      Color(0xFFEF3F53),
      Color(0xFFF25E38),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              height: logicalHeight(),
              width: logicalWidth(),
            ),
            Container(
              decoration: const BoxDecoration(color: white),
              // height: 160.h,
              child: Padding(
                padding: EdgeInsets.only(left: 17.0.w, right: 17.w),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        backIcon,
                        width: 24.w,
                        color: selectTailorColor,
                      ),
                    ),
                    8.width,
                    Text(
                      businessName ?? '',
                      style: TextStyle(
                        color: selectTailorColor,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 17.w, right: 17.w, top: 60.h),
              child: Image.asset(bizImage),
            ),
            Padding(
              padding: EdgeInsets.only(left: 26.w, right: 17.w, top: 140.h),
              child: Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
                child: Stack(
                  children: const [
                    Align(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage(profileIcon),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 250,
              left: 300,
              child: InkWell(
                onTap: () {
                  chatStylist(context);
                },
                child: Container(
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: signinTextColor),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      chatIcon,
                      height: 20.h,
                      width: 20.w,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 250,
              child: Padding(
                padding: EdgeInsets.only(left: 17.0.w, right: 17.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      businessName ?? '',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: cinta,
                        color: Color(0xff313131),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    4.height,
                    Row(
                      children: [
                        const Icon(
                          (Icons.location_on),
                          color: locationIconColor,
                          size: 14,
                        ),
                        4.width,
                        Text(
                          'Garki, Abuja',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: cinta,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    4.height,
                    Row(
                      children: [
                        Image.asset(
                          clock,
                          height: 16,
                          width: 16,
                        ),
                        4.width,
                        Text(
                          '3y 3m on Stylclick',
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontFamily: cinta,
                              fontWeight: FontWeight.w500,
                              color: signinTextColor),
                          textAlign: TextAlign.center,
                        ),
                      ],
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
                    16.height,
                    Text(
                      'Specialized in:',
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontFamily: cinta,
                          fontWeight: FontWeight.bold,
                          color: signinTextColor),
                      textAlign: TextAlign.center,
                    ),
                    8.height,


                    Wrap(

                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        Container(
                          height: 41.h,
                          // width: ,
                          decoration: BoxDecoration(
                              color: menWearColor,
                              borderRadius: BorderRadius.circular(18.r)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                                child: Text(
                              'Men Wears',
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontFamily: cinta,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff333232)),
                            )),
                          ),
                        ),
                        Container(
                          height: 41.h,
                          // width: ,
                          decoration: BoxDecoration(
                              color: Color(0xffe7faff),
                              borderRadius: BorderRadius.circular(18.r)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                                child: Text(
                              'Traditional Wears',
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontFamily: cinta,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff333232)),
                            )),
                          ),
                        ),
                        Container(
                          height: 41.h,
                          // width: ,
                          decoration: BoxDecoration(
                              color: Color(0xffecfaeb),
                              borderRadius: BorderRadius.circular(18.r)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                                child: Text(
                              'Corporate Wears',
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontFamily: cinta,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff333232)),
                            )),
                          ),
                        ),
                        Container(
                          height: 41.h,
                          // width: ,
                          decoration: BoxDecoration(
                              color: Color(0xffe7faff),
                              borderRadius: BorderRadius.circular(18.r)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                                child: Text(
                              'Aso-ebi',
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontFamily: cinta,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff333232)),
                            )),
                          ),
                        ),
                        Container(
                          height: 41.h,
                          // width: ,
                          decoration: BoxDecoration(
                              color: Color(0xffecfaeb),
                              borderRadius: BorderRadius.circular(18.r)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                                child: Text(
                              'Bridal Wears',
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontFamily: cinta,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff333232)),
                            )),
                          ),
                        ),
                        Container(
                          height: 41.h,
                          // width: ,
                          decoration: BoxDecoration(
                              color: menWearColor,
                              borderRadius: BorderRadius.circular(18.r)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                                child: Text(
                              'Suits',
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontFamily: cinta,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff333232)),
                            )),
                          ),
                        )
                      ],
                    ),
                    16.height,
                    Container(
                      decoration: BoxDecoration(
                          color: const Color(0xffefefef),
                          borderRadius: BorderRadius.circular(5.r)),
                      height: 100.h,
                      width: logicalWidth() / 1.10,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          16.width,
                          Image.asset(
                            sewingMachine,
                            height: 48.h,
                            width: 48.w,
                          ),
                          16.width,
                          ShaderMask(
                            blendMode: BlendMode.srcIn,
                            shaderCallback: (bounds) {
                              return gradient.createShader(bounds);
                            },
                            child: Text(
                              'Sew a New Style',
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Spacer(),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Image.asset(
                                  forwardArrow,
                                  width: 41,
                                  color: Color(0xff999797),
                                )),
                          ),
                          // 8.width
                        ],
                      ),
                    ),
                    24.height,
                    Container(
                      decoration: BoxDecoration(
                          color: Color(0xffefefef),
                          borderRadius: BorderRadius.circular(5.r)),
                      height: 100.h,
                      width: logicalWidth() / 1.10,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          16.width,
                          Image.asset(
                            readyToWear,
                            height: 48.h,
                            width: 63.w,
                          ),
                          8.width,
                          ShaderMask(
                            blendMode: BlendMode.srcIn,
                            shaderCallback: (bounds) {
                              return gradient.createShader(bounds);
                            },
                            child: Text(
                              'Get a Ready to Wear',
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),Spacer(),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Image.asset(
                                  forwardArrow,
                                  width: 41,
                                  color: Color(0xff999797),
                                )),
                          ),
                          // 6.width
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  chatStylist(BuildContext context) {
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
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Chat Stylist',
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: Color(0xffef4a47),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  16.height,
                  Text(
                    'Upload Image',
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: black,
                        fontFamily: cinta,
                        fontWeight: FontWeight.w500),
                  ),
                  8.height,
                  DottedBorder(
                    borderType: BorderType.RRect,
                    radius: Radius.circular(12),
                    dashPattern: [8, 4],
                    // padding: EdgeInsets.all(6),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      child: Container(
                        decoration: BoxDecoration(color: uploadBtnColor),
                        height: 48.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            24.width,
                            Image.asset(
                              uploadIcon,
                              height: 24.h,
                              width: 46.w,
                            ),
                            // 4.width,
                            Text(
                              'Upload image',
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  color: uploadTextColor,
                                  fontFamily: cinta,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  16.height,
                  CustomTextField(
                    label: 'Style Description',
                    labelColor: black,
                    hintTextColor: const Color.fromRGBO(0, 0, 0, 0.5),
                    hintText: 'blue green dress with a touch of red',
                    maxLines: 5,
                  ),
                  24.height,
                  InkWell(
                    onTap: () async {},
                    child: Container(
                      height: 56.h,
                      decoration: BoxDecoration(
                          // color: white,
                          borderRadius: BorderRadius.circular(9),
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [primary, primaryGradient],
                          )),
                      child: Center(
                          child: Text('Send message',
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
