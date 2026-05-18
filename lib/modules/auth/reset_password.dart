import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:stylclick/modules/auth/login.dart';
import 'package:stylclick/shared/constants/colors.dart';
import 'package:stylclick/shared/constants/images.dart';
import 'package:stylclick/shared/widgets/custom_textfield.dart';
import 'package:stylclick/shared/constants/strings.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cream,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              48.height,
              Center(
                child: Container(
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: white,
                    boxShadow: [
                      BoxShadow(
                        color: ink.withOpacity(0.1),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Image.asset(
                    loginLogo,
                    height: 80.h,
                    width: 80.h,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              40.height,
              Text(
                'Reset Password',
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  fontSize: 32.sp,
                  color: ink,
                  fontWeight: FontWeight.w900,
                ),
              ),
              8.height,
              Text(
                'Create a new password for your account',
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: 'Cinta', 
                  fontSize: 14.sp,
                  color: textLight,
                  fontWeight: FontWeight.w400,
                ),
              ),
              48.height,
              CustomTextField(
                label: 'New Password',
                hintText: 'Enter new password',
                obscureText: true,
                suffixIcon: Icon(Icons.visibility_off_outlined, color: textLight, size: 20.sp),
              ),
              24.height,
              CustomTextField(
                label: 'Confirm Password',
                hintText: 'Repeat new password',
                obscureText: true,
                suffixIcon: Icon(Icons.visibility_off_outlined, color: textLight, size: 20.sp),
              ),
              64.height,
              ElevatedButton(
                onPressed: () {
                  const LoginScreen().launch(context);
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
                      'RESET PASSWORD',
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
