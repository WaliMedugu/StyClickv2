import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:stylclick/core/services/auth_service.dart';
import 'package:stylclick/modules/auth/login.dart';
import 'package:stylclick/shared/constants/colors.dart';
import 'package:stylclick/shared/constants/images.dart';
import 'package:stylclick/shared/constants/strings.dart';
import 'package:stylclick/shared/widgets/custom_textfield.dart';
import 'package:stylclick/shared/widgets/snack_bar.dart';

class ResetPassword extends StatefulWidget {
  final String email;
  const ResetPassword({super.key, required this.email});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final TextEditingController _tokenController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool obscurePassword = true;
  bool obscureConfirm = true;
  bool isLoading = false;

  @override
  void dispose() {
    _tokenController.dispose();
    _passwordController.dispose();
    _confirmController.dispose();
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
                    child: Image.asset(loginLogo, height: 80.h, width: 80.h, fit: BoxFit.contain),
                  ),
                ),
                40.height,
                Text(
                  'Reset Password',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Cinta',
                    fontSize: 32.sp,
                    color: ink,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                8.height,
                Text(
                  'Enter the code sent to ${widget.email} and your new password.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontFamily: 'Cinta', fontSize: 14.sp, color: textLight, height: 1.5),
                ),
                48.height,
                // OTP / Reset token field
                CustomTextField(
                  controller: _tokenController,
                  label: 'Reset Code',
                  hintText: 'Enter the code from your email',
                  textInputType: TextInputType.number,
                  validator: (v) {
                    if (v == null || v.isEmpty) return 'Reset code is required';
                    return null;
                  },
                ),
                24.height,
                CustomTextField(
                  controller: _passwordController,
                  label: 'New Password',
                  hintText: 'Enter new password',
                  obscureText: obscurePassword,
                  suffixIcon: IconButton(
                    onPressed: () => setState(() => obscurePassword = !obscurePassword),
                    icon: Icon(
                      obscurePassword ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                      color: textLight,
                      size: 20.sp,
                    ),
                  ),
                  validator: (v) {
                    if (v == null || v.isEmpty) return 'New password is required';
                    if (v.length < 6) return 'At least 6 characters';
                    return null;
                  },
                ),
                24.height,
                CustomTextField(
                  controller: _confirmController,
                  label: 'Confirm Password',
                  hintText: 'Repeat new password',
                  obscureText: obscureConfirm,
                  suffixIcon: IconButton(
                    onPressed: () => setState(() => obscureConfirm = !obscureConfirm),
                    icon: Icon(
                      obscureConfirm ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                      color: textLight,
                      size: 20.sp,
                    ),
                  ),
                  validator: (v) {
                    if (v == null || v.isEmpty) return 'Please confirm your password';
                    if (v != _passwordController.text) return 'Passwords do not match';
                    return null;
                  },
                ),
                64.height,
                ElevatedButton(
                  onPressed: isLoading
                      ? null
                      : () async {
                          if (!_formKey.currentState!.validate()) return;
                          setState(() => isLoading = true);

                          log('[RESET] Resetting password for: ${widget.email}');
                          final res = await AuthService.instance.resetPassword(
                            email: widget.email,
                            token: _tokenController.text.trim(),
                            newPassword: _passwordController.text.trim(),
                          );

                          log('[RESET] Status: ${res.status}, message: ${res.message}');

                          if (mounted) {
                            setState(() => isLoading = false);
                            if (res.status == true) {
                              showMessage(context, res.message ?? 'Password reset successfully!');
                              const LoginScreen().launch(context, isNewTask: true);
                            } else {
                              showMessage(context, res.message ?? 'Reset failed. Check your code and try again.');
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
                              'Reset Password',
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
