import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:stylclick/modules/auth/forgot_password.dart';
import 'package:stylclick/modules/auth/register.dart';
import 'package:stylclick/modules/auth/verify_user.dart';
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
  void initState() {
    super.initState();
    log('[LOGIN] LoginScreen initialized');
  }

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
                24.height,
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
                      height: 72.h,
                      width: 72.h,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                24.height,
                Text(
                  'Welcome Back',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Cinta',
                    fontSize: 28.sp,
                    color: ink,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                8.height,
                Text(
                  'Your Global Fashion Hub',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontFamily: 'Cinta', 
                    fontSize: 14.sp,
                    color: textLight,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                32.height,
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
                16.height,
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
                32.height,
                ElevatedButton(
                  onPressed: () async {
                    log('[LOGIN] Sign In button pressed');
                    if (_loginFormKey.currentState!.validate()) {
                      log('[LOGIN] Form validation succeeded. Preparing payload.');
                      setState(() {
                        isLoading = true;
                      });

                      String email = emailController.text.trim();
                      log('[LOGIN] Initiating API call to login for email: $email');
                      try {
                        final res = await AuthService.instance.login(
                          email,
                          passwordController.text.trim(),
                        );

                        log('[LOGIN] API Response status: ${res.status}, message: ${res.message}');
                        if (res.status == true && res.data != null) {
                          final data = res.data!;
                          final String? token = data['token'] as String?;
                          final dynamic user = data['user'];

                          log('[LOGIN] Login successful. Parsing and saving session data.');
                          if (token != null) {
                            setValue("access_token", token);
                            log('[LOGIN] Saved access_token');
                          }

                          String firstName = '';
                          String lastName = '';
                          String userEmail = email;

                          if (user != null && user is Map) {
                            firstName = user['first_name'] ?? user['firstname'] ?? '';
                            lastName = user['last_name'] ?? user['lastname'] ?? '';
                            userEmail = user['email'] ?? email;
                          } else {
                            firstName = data['first_name'] ?? data['firstname'] ?? data['firstName'] ?? '';
                            lastName = data['last_name'] ?? data['lastname'] ?? data['lastName'] ?? '';
                            userEmail = data['email'] ?? email;
                          }

                          setValue('fName', firstName);
                          setValue('lName', lastName);
                          setValue('email', userEmail);
                          setValue('home', true);

                          log('[LOGIN] Session saved: fName = $firstName, lName = $lastName, email = $userEmail, home = true');
                          log('[LOGIN] Navigating to Home Dashboard (Nav)');
                          const Nav().launch(context, isNewTask: true);
                        } else {
                          log('[LOGIN] Login failed: ${res.message}');
                          showMessage(context, res.message ?? 'Login failed. Please check your credentials.');
                          if (res.message != null && res.message!.toLowerCase().contains('verify your email')) {
                            log('[LOGIN] Unverified email. Navigating to VerifyUser screen.');
                            VerifyUser(email: email).launch(context);
                          }
                        }
                      } catch (e) {
                        log('[LOGIN] Unexpected error during login: ${e.toString()}');
                        showMessage(context, 'An unexpected error occurred. Please try again.');
                      } finally {
                        setState(() {
                          isLoading = false;
                        });
                      }
                    } else {
                      log('[LOGIN] Form validation failed.');
                    }
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
                              'Sign In',
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
