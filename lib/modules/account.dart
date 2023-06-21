import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stylclick/modules/vendor/index.dart';
import 'package:stylclick/modules/wallet/wallet.dart';
import 'package:stylclick/shared/constants/colors.dart';
import 'package:stylclick/shared/constants/images.dart';
import 'package:stylclick/shared/constants/strings.dart';
import 'package:stylclick/shared/utils/helpers.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: homeBgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 17.w, right: 17.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                16.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Olayimmika\nSamuel',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Container(
                      height: 56.h,
                      width: 56.w,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      // borderRadius:
                      //     BorderRadius.circular(
                      //         30.r),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.network(
                          profileIcon,
                          height: 56.h,
                          width: 56.w,
                          fit: BoxFit.cover,
                          loadingBuilder: (BuildContext ctx, Widget child,
                              ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) return child;

                            return SizedBox.shrink();
                          },
                          errorBuilder: (context, object, stackTrace) {
                            return SizedBox(
                              height: 48.h,
                              width: 48.w,
                              child: Shimmer.fromColors(
                                  child: Container(
                                    height: 48.h,
                                    width: 48.w,
                                    decoration: BoxDecoration(
                                      color: black.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(30),
                                      // shape: BoxShape.circle,
                                    ),
                                  ),
                                  baseColor: Colors.black12,
                                  highlightColor: Colors.grey.shade100),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                8.height,
                Container(
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(22.r),
                  ),
                  height: 24.h,
                  width: 56.w,
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      8.width,
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 12,
                      ),
                      4.width,
                      Text(
                        '4.8',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: cinta,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                16.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 100.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(6.r)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          24.height,
                          Image.asset(
                            helpIcon,
                            height: 32,
                            width: 32,
                          ),
                          16.height,
                          Text(
                            'Help',
                            style: TextStyle(
                                fontFamily: cinta,
                                fontSize: 14.sp,
                                color: quickAccessTextColor,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        WalletPage().launch(context);
                      },
                      child: Container(
                        height: 100.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(6.r)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            24.height,
                            Image.asset(
                              wallet,
                              height: 32,
                              width: 32,
                            ),
                            16.height,
                            Text(
                              'Wallet',
                              style: TextStyle(
                                  fontFamily: cinta,
                                  fontSize: 14.sp,
                                  color: quickAccessTextColor,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 100.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(6.r)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          24.height,
                          Image.asset(
                            activity,
                            height: 32,
                            width: 32,
                          ),
                          16.height,
                          Text(
                            'Activity',
                            style: TextStyle(
                                fontFamily: cinta,
                                fontSize: 14.sp,
                                color: quickAccessTextColor,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                24.height,
                Container(
                  height: 4.h,
                  width: logicalWidth(),
                  color: accountDividerColor,
                ),
                24.height,
                InkWell(
                  onTap: () {},
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        orders,
                        height: 24,
                        width: 24,
                      ),
                      8.width,
                      Text(
                        'My Orders',
                        style: TextStyle(
                            fontFamily: cinta,
                            fontSize: 16.sp,
                            color: quickAccessTextColor,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                24.height,
                InkWell(
                  onTap: () {},
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        chats,
                        height: 24,
                        width: 24,
                      ),
                      8.width,
                      Text(
                        'Chats',
                        style: TextStyle(
                            fontFamily: cinta,
                            fontSize: 16.sp,
                            color: quickAccessTextColor,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                24.height,
                InkWell(
                  onTap: () {
                    VendorPage().launch(context);
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        becomeVendor,
                        height: 24,
                        width: 24,
                      ),
                      8.width,
                      Text(
                        'Become a vendor',
                        style: TextStyle(
                            fontFamily: cinta,
                            fontSize: 16.sp,
                            color: quickAccessTextColor,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                24.height,
                InkWell(
                  onTap: () {},
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        shareEarn,
                        height: 24,
                        width: 24,
                      ),
                      8.width,
                      Text(
                        'Share and Earn',
                        style: TextStyle(
                            fontFamily: cinta,
                            fontSize: 16.sp,
                            color: quickAccessTextColor,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                24.height,
                InkWell(
                  onTap: () {},
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        settings,
                        height: 24,
                        width: 24,
                      ),
                      8.width,
                      Text(
                        'Settings',
                        style: TextStyle(
                            fontFamily: cinta,
                            fontSize: 16.sp,
                            color: quickAccessTextColor,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                24.height,
                InkWell(
                  onTap: () {},
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        support,
                        height: 24,
                        width: 24,
                      ),
                      8.width,
                      Text(
                        'Supports',
                        style: TextStyle(
                            fontFamily: cinta,
                            fontSize: 16.sp,
                            color: quickAccessTextColor,
                            fontWeight: FontWeight.bold),
                      )
                    ],
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
