import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:stylclick/modules/auth/forgot_password.dart';
import 'package:stylclick/modules/auth/register.dart';
import 'package:stylclick/modules/auth/reset_password.dart';
import 'package:stylclick/modules/home.dart';
import 'package:stylclick/shared/constants/colors.dart';
import 'package:stylclick/shared/constants/images.dart';
import 'package:stylclick/shared/constants/strings.dart';
import 'package:stylclick/shared/widgets/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obscureText = true;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  Gradient gradient = const LinearGradient(
    colors: [primary, primaryGradient],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

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
                  height: 66.h,
                  width: 213.33.w,
                ),
              ),
              24.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Welcome',
                      style: TextStyle(
                          fontFamily: cinta,
                          fontSize: 35.sp,
                          color: black,
                          fontWeight: FontWeight.bold)),
                  8.width,
                  ShaderMask(
                    shaderCallback: (size) => gradient.createShader(
                      Rect.fromLTWH(0, 0, size.width, size.height + 24),
                    ),
                    child: Text('back',
                        style: TextStyle(
                            fontFamily: cinta,
                            fontSize: 35.sp,
                            color: white,
                            fontWeight: FontWeight.w900)),
                  ),
                ],
              ),
              48.height,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: CustomTextField(
                  label: 'Email',
                  labelColor: black,
                  hintTextColor: const Color.fromRGBO(0, 0, 0, 0.5),
                  hintText: 'Enter email',
                ),
              ),
              32.height,
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
              48.height,
              InkWell(
                onTap: () {
                  HomePage().launch(context);
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Container(
                    height: 61.h,
                    decoration: BoxDecoration(
                        // color: white,
                        borderRadius: BorderRadius.circular(9),
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [primary, primaryGradient],
                        )),
                    child: Center(
                        child: Text('Login',
                            style: TextStyle(
                                fontFamily: cinta,
                                fontSize: 16.sp,
                                color: white,
                                fontWeight: FontWeight.bold))),
                  ),
                ),
              ),
              32.height,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(color: lineColor),
                      height: 1.2.h,
                      // width: 160.w,
                    ),
                  ),
                  8.width,
                  Text('Or',
                      style: TextStyle(
                          fontFamily: cinta,
                          fontSize: 16.sp,
                          color: black,
                          fontWeight: FontWeight.w400)),
                  8.width,
                  Flexible(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(color: lineColor),
                      height: 1.2.h,
                      // width: 160.w,
                    ),
                  ),
                ]),
              ),
              32.height,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Container(
                  height: 61.h,
                  decoration: BoxDecoration(
                    color: biometricButtonColor,
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        fingerprint,
                        height: 45,
                        width: 45,
                      ),
                      8.width,
                      Text('Sign in with Biometrics',
                          style: TextStyle(
                              fontFamily: cinta,
                              fontSize: 16.sp,
                              color: biometricTextColor,
                              fontWeight: FontWeight.w600)),
                    ],
                  ),
                ),
              ),
              24.height,
              GestureDetector(
                onTap: () {
                  const ForgotPassword().launch(context);
                },
                child: Center(
                  child: Text('Don’t have an account ? Sign Up',
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
