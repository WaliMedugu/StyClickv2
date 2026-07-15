import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:stylclick/core/services/auth_service.dart';
import 'package:stylclick/modules/auth/login.dart';
import 'package:stylclick/modules/auth/reset_password.dart';
import 'package:stylclick/shared/constants/colors.dart';
import 'package:stylclick/shared/constants/images.dart';
import 'package:stylclick/shared/utils/helpers.dart';
import 'package:stylclick/shared/widgets/custom_textfield.dart';
import 'package:stylclick/shared/constants/strings.dart';
import 'package:stylclick/shared/widgets/snack_bar.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cream,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Form(
            key: _formKey,
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
                  'Forgot Password',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Cinta',
                    fontSize: 32.sp,
                    color: ink,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                12.height,
                Text(
                  'Please type in the email address linked to your StyClick account to reset your password.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Cinta',
                    fontSize: 14.sp,
                    color: textLight,
                    height: 1.6,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                48.height,
                CustomTextField(
                  controller: _emailController,
                  label: 'Email',
                  hintText: 'Enter your email',
                  textInputType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'Email is required';
                    if (!isValidEmail(value.validate())) return 'Enter a valid email';
                    return null;
                  },
                ),
                24.height,
                GestureDetector(
                  onTap: () => const LoginScreen().launch(context),
                  child: Center(
                    child: RichText(
                      text: TextSpan(
                        text: 'Remember Password? ',
                        style: TextStyle(fontFamily: 'Cinta', fontSize: 14.sp, color: textLight),
                        children: [
                          TextSpan(
                            text: 'Sign In',
                            style: TextStyle(
                              fontFamily: 'Cinta',
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
                  onPressed: isLoading
                      ? null
                      : () async {
                          if (!_formKey.currentState!.validate()) return;
                          setState(() => isLoading = true);

                          final email = _emailController.text.trim();
                          log('[FORGOT] Requesting password reset for: $email');

                          final res = await AuthService.instance.requestPasswordReset(email: email);

                          log('[FORGOT] Status: ${res.status}, message: ${res.message}');

                          if (mounted) {
                            setState(() => isLoading = false);
                            if (res.status == true) {
                              showMessage(context, res.message ?? 'Reset link sent. Check your email.');
                              ResetPassword(email: email).launch(context);
                            } else {
                              showMessage(context, res.message ?? 'Could not send reset link. Try again.');
                            }
                          }
                        },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.r)),
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
                      child: isLoading
                          ? const CircularProgressIndicator(color: white)
                          : Text(
                              'Send Reset Link',
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
      ),
    );
  }
}
