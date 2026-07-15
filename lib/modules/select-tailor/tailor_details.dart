import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:stylclick/shared/constants/colors.dart';
import 'package:stylclick/shared/constants/images.dart';
import 'package:stylclick/shared/constants/strings.dart';
import 'package:stylclick/shared/utils/helpers.dart';
import 'package:stylclick/shared/widgets/custom_textfield.dart';

class TailorDetails extends StatelessWidget {
  final String businessName;
  const TailorDetails({Key? key, required this.businessName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cream,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Gradient header
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(gradient: brandGradient),
                padding: EdgeInsets.only(left: 17.w, right: 17.w, top: 16.h, bottom: 24.h),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Image.asset(backIcon, width: 24.w, color: Colors.white),
                    ),
                    20.width,
                    Text(
                      businessName,
                      style: TextStyle(
                        fontFamily: 'Cinta',
                        fontSize: 22.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.5,
                      ),
                    ),
                  ],
                ),
              ),
              // Business banner image
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 16.h),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.r),
                  child: Image.asset(bizImage, width: double.infinity, height: 160.h, fit: BoxFit.cover),
                ),
              ),
              // Avatar + Chat button row
              Padding(
                padding: EdgeInsets.only(left: 26.w, right: 17.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: white, width: 3),
                        boxShadow: [BoxShadow(color: ink.withOpacity(0.1), blurRadius: 8)],
                      ),
                      child: const CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage(profileIcon),
                      ),
                    ),
                    InkWell(
                      onTap: () => _chatStylist(context),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: primary.withOpacity(0.1),
                          border: Border.all(color: primary.withOpacity(0.3)),
                        ),
                        padding: EdgeInsets.all(10.w),
                        child: Image.asset(chatIcon, height: 18.h, width: 18.w, color: primary),
                      ),
                    ),
                  ],
                ),
              ),
              16.height,
              // Info section
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 17.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      businessName,
                      style: TextStyle(
                        fontFamily: 'Cinta',
                        fontSize: 18.sp,
                        color: ink,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    8.height,
                    Row(
                      children: [
                        Icon(Icons.location_on, color: locationIconColor, size: 14.sp),
                        4.width,
                        Text('Garki, Abuja', style: TextStyle(fontFamily: cinta, fontSize: 13.sp, color: textLight)),
                        16.width,
                        Image.asset(clock, height: 14, width: 14),
                        4.width,
                        Text('3y 3m on Styclick', style: TextStyle(fontFamily: cinta, fontSize: 12.sp, color: textLight)),
                      ],
                    ),
                    8.height,
                    Row(
                      children: [
                        RatingBar.builder(
                          initialRating: 4.5,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 14,
                          ignoreGestures: true,
                          itemBuilder: (context, _) => const Icon(Icons.star_rounded, color: Colors.amber),
                          onRatingUpdate: (_) {},
                        ),
                        8.width,
                        Text('4.5 (13 Reviews)', style: GoogleFonts.montserrat(fontSize: 11.sp, color: textLight)),
                      ],
                    ),
                    16.height,
                    Divider(color: sand),
                    16.height,
                    Text('SPECIALISES IN',
                        style: TextStyle(
                          fontFamily: 'Cinta',
                          fontSize: 11.sp,
                          color: textLight,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.5,
                        )),
                    12.height,
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        _chip('Men Wears', const Color(0xffFFF3E0)),
                        _chip('Traditional Wears', const Color(0xffe7faff)),
                        _chip('Corporate Wears', const Color(0xffecfaeb)),
                        _chip('Aso-ebi', const Color(0xffe7faff)),
                        _chip('Bridal Wears', const Color(0xffecfaeb)),
                        _chip('Suits', const Color(0xffFFF3E0)),
                      ],
                    ),
                    24.height,
                    Text('QUICK ACTIONS',
                        style: TextStyle(
                          fontFamily: 'Cinta',
                          fontSize: 11.sp,
                          color: textLight,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.5,
                        )),
                    16.height,
                    _actionTile(sewingMachine, 'Sew a New Style', 'Commission a custom outfit'),
                    12.height,
                    _actionTile(readyToWear, 'Get a Ready to Wear', 'Shop available finished pieces'),
                    40.height,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _chip(String label, Color bg) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(20.r)),
      child: Text(label,
          style: TextStyle(fontFamily: cinta, fontSize: 12.sp, fontWeight: FontWeight.w600, color: ink)),
    );
  }

  Widget _actionTile(String icon, String title, String sub) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: sand),
        boxShadow: [BoxShadow(color: ink.withOpacity(0.03), blurRadius: 8, offset: const Offset(0, 3))],
      ),
      child: Row(
        children: [
          Image.asset(icon, height: 40.h, width: 40.w),
          16.width,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: TextStyle(fontFamily: cinta, fontSize: 15.sp, fontWeight: FontWeight.w700, color: ink)),
                4.height,
                Text(sub, style: TextStyle(fontFamily: cinta, fontSize: 12.sp, color: textLight)),
              ],
            ),
          ),
          Icon(Icons.arrow_forward_ios, color: sand, size: 14.sp),
        ],
      ),
    );
  }

  void _chatStylist(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      elevation: 5,
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.only(topLeft: Radius.circular(25.r), topRight: Radius.circular(25.r)),
      ),
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            color: cream,
            borderRadius:
                BorderRadius.only(topLeft: Radius.circular(25.r), topRight: Radius.circular(25.r)),
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Chat Stylist',
                style: TextStyle(
                  fontFamily: 'Cinta',
                  fontSize: 20.sp,
                  color: primary,
                  fontWeight: FontWeight.w700,
                ),
              ),
              16.height,
              Text('Upload Image',
                  style: TextStyle(
                      fontSize: 14.sp, color: ink, fontFamily: cinta, fontWeight: FontWeight.w500)),
              8.height,
              DottedBorder(
                borderType: BorderType.RRect,
                radius: const Radius.circular(12),
                dashPattern: const [8, 4],
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  child: Container(
                    decoration: const BoxDecoration(color: uploadBtnColor),
                    height: 48.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        24.width,
                        Image.asset(uploadIcon, height: 24.h, width: 46.w),
                        Text('Upload image',
                            style: TextStyle(
                                fontSize: 14.sp,
                                color: uploadTextColor,
                                fontFamily: cinta,
                                fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                ),
              ),
              16.height,
              CustomTextField(
                label: 'Style Description',
                labelColor: ink,
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
                    borderRadius: BorderRadius.circular(14.r),
                    gradient:
                        const LinearGradient(colors: [primary, primaryGradient]),
                  ),
                  child: Center(
                    child: Text('Send message',
                        style: TextStyle(
                            fontFamily: cinta,
                            fontSize: 16.sp,
                            color: white,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
              24.height,
            ],
          ),
        );
      },
    );
  }
}
