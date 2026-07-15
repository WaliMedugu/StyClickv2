import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:stylclick/modules/auth/login.dart';
import 'package:stylclick/shared/constants/colors.dart';
import 'package:stylclick/shared/constants/images.dart';
import 'package:stylclick/shared/widgets/custom_textfield.dart';
import 'package:stylclick/shared/constants/strings.dart';

class PasswordSetting extends StatefulWidget {
  const PasswordSetting({super.key});

  @override
  State<PasswordSetting> createState() => _PasswordSettingState();
}

class _PasswordSettingState extends State<PasswordSetting> {
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
              Text('Registration',
                  style: TextStyle(
                      fontFamily: cinta,
                      fontSize: 35.sp,
                      color: black,
                      fontWeight: FontWeight.bold)),
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
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: CustomTextField(
                  label: 'Confirm Password',
                  labelColor: black,
                  hintTextColor: const Color.fromRGBO(0, 0, 0, 0.5),
                  hintText: 'Enter password',
                  suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.visibility_off,
                          color: Color.fromRGBO(0, 0, 0, 1))),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Container(
                  height: 61.h,
                  child: Center(
                      child: Text('Sign Up',
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
              GestureDetector(
                onTap: () {},
                child: Center(
                  child: Text('Previous',
                      style: TextStyle(
                          fontFamily: cinta,
                          fontSize: 16.sp,
                          color: black,
                          fontWeight: FontWeight.w600)),
                ),
              ),
              GestureDetector(
                onTap: () {
                  const LoginScreen().launch(context);
                },
                child: Center(
                  child: Text('Already have an account ? Sign In',
                      style: TextStyle(
                          fontFamily: cinta,
                          fontSize: 16.sp,
                          color: signupTextColor,
                          fontWeight: FontWeight.w500)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
