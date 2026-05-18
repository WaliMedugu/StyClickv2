import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:stylclick/modules/auth/forgot_password.dart';
import 'package:stylclick/modules/auth/register.dart';
import 'package:stylclick/shared/constants/colors.dart';
import 'package:stylclick/shared/constants/images.dart';
import 'package:stylclick/shared/constants/strings.dart';
import 'package:stylclick/core/services/auth_service.dart';
import 'package:stylclick/shared/widgets/custom_textfield.dart';
import 'package:stylclick/shared/widgets/nav.dart';
import 'package:stylclick/shared/widgets/snack_bar.dart';
import 'package:stylclick/shared/utils/helpers.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obscureText = true;
  bool isLoading = false;

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
      backgroundColor: cream,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Form(
            key: _loginFormKey,
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
                  'Welcome back',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    fontSize: 32.sp,
                    color: ink,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                8.height,
                Text(
                  'Your Style in one Click',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontFamily: 'Cinta', 
                    fontSize: 14.sp,
                    color: textLight,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                48.height,
                CustomTextField(
                  controller: emailController,
                  label: 'Email Address',
                  hintText: 'e.g. name@example.com',
                  textInputType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email is required';
                    }
                    if (!isValidEmail(value.validate())) {
                      return 'Enter a valid email';
                    }
                    return null;
                  },
                ),
                24.height,
                CustomTextField(
                  controller: passwordController,
                  label: 'Password',
                  hintText: 'Enter your password',
                  obscureText: obscureText,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                    icon: Icon(
                      obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                      color: textLight,
                      size: 20.sp,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password is required';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
                12.height,
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      const ForgotPassword().launch(context);
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: Text(
                      'Forgot Password?',
                      style: GoogleFonts.montserrat(
                        fontSize: 12.sp,
                        color: primary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                40.height,
                ElevatedButton(
                  onPressed: () {
                    // Temporary bypass for server error
                    setValue('home', true);
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
                    shadowColor: MaterialStateProperty.all(Colors.transparent),
                  ),
                  child: Ink(
                    decoration: BoxDecoration(
                      gradient: gradient,
                      borderRadius: BorderRadius.circular(14.r),
                    ),
                    child: Container(
                      height: 56.h,
                      alignment: Alignment.center,
                      child: isLoading
                          ? const CircularProgressIndicator(color: white)
                          : Text(
                              'SIGN IN',
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
                24.height,
                Row(
                  children: [
                    Expanded(child: Divider(color: sand, thickness: 1)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Text(
                        'OR',
                        style: GoogleFonts.montserrat(
                          fontSize: 12.sp,
                          color: textLight,
                        ),
                      ),
                    ),
                    Expanded(child: Divider(color: sand, thickness: 1)),
                  ],
                ),
                24.height,
                OutlinedButton.icon(
                  onPressed: () {
                    showMessage(context, 'Coming soon');
                  },
                  icon: Image.asset(fingerprint, height: 24.h),
                  label: Text(
                    'SIGN IN WITH BIOMETRICS',
                    style: GoogleFonts.montserrat(
                      fontSize: 12.sp,
                      color: ink,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    minimumSize: Size(double.infinity, 56.h),
                    side: BorderSide(color: sand),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.r),
                    ),
                    backgroundColor: white,
                  ),
                ),
                32.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don’t have an account? ',
                      style: TextStyle(fontFamily: 'Cinta', 
                        fontSize: 14.sp,
                        color: textLight,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        const RegisterScreen().launch(context);
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(fontFamily: 'Cinta', 
                          fontSize: 14.sp,
                          color: primary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
                24.height,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
