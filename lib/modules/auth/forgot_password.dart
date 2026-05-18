import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:stylclick/modules/auth/login.dart';
import 'package:stylclick/modules/auth/reset_password.dart';
import 'package:stylclick/modules/auth/verify_user.dart';
import 'package:stylclick/shared/constants/colors.dart';
import 'package:stylclick/shared/constants/images.dart';
import 'package:stylclick/shared/widgets/custom_textfield.dart';
import 'package:stylclick/shared/constants/strings.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
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
                  padding: EdgeInsets.all(4.w),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: white,
                    boxShadow: [
                      BoxShadow(
                        color: ink.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
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
                'Forgot password',
                textAlign: TextAlign.center,
                style: GoogleFonts.comfortaa(
                  fontSize: 32.sp,
                  color: ink,
                  fontWeight: FontWeight.w900,
                ),
              ),
              12.height,
              Text(
                'Please type in the email address linked to your StyClick account to reset your password.',
                textAlign: TextAlign.center,
                style: GoogleFonts.lora(
                  fontSize: 14.sp,
                  color: textLight,
                  height: 1.6,
                  fontWeight: FontWeight.w400,
                ),
              ),
              48.height,
              CustomTextField(
                label: 'Email',
                hintText: 'Enter your email',
                textInputType: TextInputType.emailAddress,
              ),
              24.height,
              GestureDetector(
                onTap: () {
                  const LoginScreen().launch(context);
                },
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      text: 'Remember Password? ',
                      style: GoogleFonts.lora(
                        fontSize: 14.sp,
                        color: textLight,
                      ),
                      children: [
                        TextSpan(
                          text: 'Sign in',
                          style: GoogleFonts.lora(
                            fontSize: 14.sp,
                            color: primary,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              64.height,
              ElevatedButton(
                onPressed: () {
                  const VerifyUser().launch(context);
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
                      'SEND RESET LINK',
                      style: GoogleFonts.dmMono(
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
