import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:stylclick/modules/vendor/become_rider.dart';
import 'package:stylclick/modules/vendor/become_vendor.dart';
import 'package:stylclick/shared/constants/colors.dart';
import 'package:stylclick/shared/constants/images.dart';

import '../../shared/utils/helpers.dart';

class VendorPage extends StatelessWidget {
  VendorPage({Key? key}) : super(key: key);

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
      backgroundColor: const Color(0xffefefef),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          16.height,
          Padding(
            padding: EdgeInsets.only(
              left: 17.0.w,
            ),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      backIcon,
                      color: Colors.black,
                      width: 24.w,
                    ),
                  ),
                ),
                Text(
                  'Become a vendor',
                  style: TextStyle(
                    color: black,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
          16.height,
          Padding(
            padding: EdgeInsets.only(left: 17.0.w, right: 17.w),
            child: Text(
              'Lorem ipsum dolor sit amet consectetur. Id morbi\ndignissim est lectus.',
              style: TextStyle(
                color: Color(0xff444343),
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          24.height,
          InkWell(
            onTap: (){
              BecomeVendor().launch(context);
            },
            child: Padding(
              padding: EdgeInsets.only(left: 17.0.w, right: 17.w),
              child: Container(
                height: 100.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5), color: white),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    16.width,
                    Image.asset(
                      sewingMachine,
                      height: 48,
                      width: 48,
                    ),
                    8.width,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ShaderMask(
                          blendMode: BlendMode.srcIn,
                          shaderCallback: (bounds) {
                            return gradient.createShader(bounds);
                          },
                          child: Text(
                            'Fashion designer',
                            style: TextStyle(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        // 8.height,
                        Text(
                          'Register as a fashion designer',
                          style: TextStyle(
                            color: black,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),Spacer(),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: Image.asset(
                            forwardArrow,
                            width: 41,
                            color: Color(0xff414040),
                          )),
                    ),16.width
                  ],
                ),
              ),
            ),
          ),
          24.height,
          Padding(
            padding: EdgeInsets.only(left: 17.0.w, right: 17.w),
            child: Container(
              height: 100.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5), color: white),
              width: double.infinity,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  16.width,
                  Image.asset(
                    fabric,
                    height: 48,
                    width: 48,
                  ),
                  8.width,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ShaderMask(
                        blendMode: BlendMode.srcIn,
                        shaderCallback: (bounds) {
                          return gradient.createShader(bounds);
                        },
                        child: Text(
                          'Fabrics Seller',
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      // 8.height,
                      Text(
                        'Register as a fabrics seller',
                        style: TextStyle(
                          color: black,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),Spacer(),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Image.asset(
                          forwardArrow,
                          width: 41,
                          color: Color(0xff414040),
                        )),
                  ),16.width
                ],
              ),
            ),
          ),
          24.height,
          InkWell(
            onTap: (){
              BecomeRider().launch(context);
            },
            child: Padding(
              padding: EdgeInsets.only(left: 17.0.w, right: 17.w),
              child: Container(
                height: 100.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5), color: white),
                // padding: EdgeInsets.only(left: 17.0.w, right: 17.w),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    16.width,
                    Image.asset(
                      dispatchRider,
                      height: 48,
                      width: 48,
                    ),
                    8.width,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ShaderMask(
                          blendMode: BlendMode.srcIn,
                          shaderCallback: (bounds) {
                            return gradient.createShader(bounds);
                          },
                          child: Text(
                            'Dispatch rider',
                            style: TextStyle(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        // 8.height,
                        Text(
                          'Register as a dispatch rider',
                          style: TextStyle(
                            color: black,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: Image.asset(
                            forwardArrow,
                            width: 41,
                            color: Color(0xff414040),
                          )),
                    ),16.width
                  ],
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
