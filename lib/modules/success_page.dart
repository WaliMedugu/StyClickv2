import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:stylclick/shared/constants/colors.dart';
import 'package:stylclick/shared/constants/strings.dart';

import 'package:stylclick/shared/widgets/nav.dart';

class SuccessPage extends StatelessWidget {
  final String? message;
  final String? medium;

  const SuccessPage({Key? key, this.message, this.medium}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cream,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(
                Icons.check_circle_outline_rounded,
                size: 80,
                color: successColor,
              ),
              32.height,
              Text(
                'Successful',
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  fontSize: 32.sp,
                  color: ink,
                  fontWeight: FontWeight.w900,
                ),
              ),
              16.height,
              Text(
                message ?? 'Your request has been processed successfully.',
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: 'Cinta', 
                  fontSize: 16.sp,
                  color: textLight,
                  height: 1.5,
                  fontWeight: FontWeight.w400,
                ),
              ),
              if (medium != null) 32.height,
              if (medium != null)
                TextButton(
                  onPressed: () {
                    // Logic to view email or medium
                  },
                  child: Text(
                    'View $medium',
                    style: GoogleFonts.montserrat(
                      fontSize: 14.sp,
                      color: primary,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
              64.height,
              ElevatedButton(
                onPressed: () {
                  currentIndex = 2;
                  const Nav().launch(context, isNewTask: true);
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                  elevation: 0,
                ).copyWith(
                  backgroundColor: MaterialStateProperty.all(Colors.transparent),
                ),
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [primary, primaryGradient],
                    ),
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                  child: Container(
                    height: 56.h,
                    alignment: Alignment.center,
                    child: Text(
                      'CONTINUE',
                      style: GoogleFonts.montserrat(
                        fontSize: 14.sp,
                        color: white,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2,
                      ),
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
}
