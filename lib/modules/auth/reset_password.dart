import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                child: Text('Reset Password',
                    style: TextStyle(
                        fontFamily: cinta,
                        fontSize: 32.sp,
                        color: black,
                        fontWeight: FontWeight.bold)),
              ),48.height,
                 Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: CustomTextField(
                  label: 'Password',
                  labelColor: black,
                  hintTextColor: const Color.fromRGBO(0, 0, 0, 0.5),
                  hintText: 'Enter password',
                  suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.visibility_off,
                          color: Color.fromRGBO(0, 0, 0, 1))),
                ),
              ),32.height,
                     Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: CustomTextField(
                  label: 'Confirm password',
                  labelColor: black,
                  hintTextColor: const Color.fromRGBO(0, 0, 0, 0.5),
                  hintText: 'Enter password',
                  suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.visibility_off,
                          color: Color.fromRGBO(0, 0, 0, 1))),
                ),
              ),56.height,
                Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Container(
                  height: 56.h,
                  child: Center(
                      child: Text('Reset',
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
              )
           
            ],
          ),
        ),
      ),
    );
  }
}
