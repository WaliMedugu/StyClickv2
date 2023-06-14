import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      backgroundColor: white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              24.height,
              Center(
                child: Image.asset(
                  loginLogo,
                  height: 57.h,
                  width: 184.42.w,
                ),
              ),
              24.height,
              Center(
                child: Text('Forget password',
                    style: TextStyle(
                        fontFamily: cinta,
                        fontSize: 32.sp,
                        color: black,
                        fontWeight: FontWeight.bold)),
              ),
              32.height,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text(
                    'Please type in the email address linked to your Styclick\naccount to reset your password.',
                    style: TextStyle(
                        fontFamily: cinta,
                        fontSize: 14.sp,
                        color: forgotPasswordTextColor,
                        height: 1.5,
                        fontWeight: FontWeight.w400)),
              ),
              32.height,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: CustomTextField(
                  label: 'Email',
                  labelColor: black,
                  hintTextColor: const Color.fromRGBO(0, 0, 0, 0.5),
                  hintText: 'Enter email',
                ),
              ),
              24.height,
              GestureDetector(
                   onTap: () {
                  const LoginScreen().launch(context);
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    children: [
                      Text('Remember Password?, ',
                          style: TextStyle(
                              fontFamily: cinta,
                              fontSize: 14.sp,
                              color: forgotPasswordTextColor,
                              fontWeight: FontWeight.w500)),
                      Text('Back to sign-in',
                          style: TextStyle(
                              fontFamily: cinta,
                              fontSize: 14.sp,
                              color: signinTextColor,
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                ),
              ),
              80.height,
              GestureDetector(
                    onTap: () {
                  const VerifyUser().launch(context);
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Container(
                    height: 56.h,
                    child: Center(
                        child: Text('Send',
                            style: TextStyle(
                                fontFamily: cinta,
                                fontSize: 16.sp,
                                color: white,
                                fontWeight: FontWeight.bold))),
                    decoration: BoxDecoration(
                        // color: white,
                        borderRadius: BorderRadius.circular(9),
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [primary, primaryGradient],
                        )),
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
