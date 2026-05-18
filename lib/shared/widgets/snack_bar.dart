import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stylclick/shared/constants/colors.dart';

void showMessage(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Container(
        padding: EdgeInsets.zero,
        child: Text(
          message,
          textAlign: TextAlign.center,
          style: GoogleFonts.dmMono(
            fontSize: 12.sp,
            color: Colors.white,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.1,
          ),
        ),
      ),
      backgroundColor: primary,
      behavior: SnackBarBehavior.floating,
      elevation: 8,
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14.r),
      ),
      duration: const Duration(seconds: 2),
    ),
  );
}
