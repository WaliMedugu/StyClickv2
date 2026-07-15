import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
import 'package:stylclick/shared/constants/strings.dart';
import 'package:stylclick/shared/constants/colors.dart';
import 'package:stylclick/core/services/auth_service.dart';
import 'package:stylclick/shared/widgets/snack_bar.dart';
import 'package:stylclick/shared/widgets/nav.dart';
import 'package:stylclick/modules/auth/login.dart';

class VerifyUser extends StatefulWidget {
  final String? phone;
  final String? email;

  const VerifyUser({super.key, this.email, this.phone});

  @override
  State<VerifyUser> createState() => _VerifyUserState();
}

class _VerifyUserState extends State<VerifyUser> {
  bool isLoading = false;
  bool isResending = false;
  TextEditingController otpController = TextEditingController();
  final GlobalKey<FormState> _verifyOtpFormKey = GlobalKey<FormState>();
  FocusNode focusNode = FocusNode();
  Timer? _timer;
  int _start = 10;

  void startTimer() {
    _start = 10;
    const oneSec = Duration(seconds: 1);
    _timer?.cancel();
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    log('[VERIFY] VerifyUser screen initialized for email: ${widget.email}, phone: ${widget.phone}');
    startTimer();
  }

  @override
  void dispose() {
    otpController.dispose();
    focusNode.dispose();
    _timer?.cancel();
    super.dispose();
  }

  Future<void> _verifyCode() async {
    log('[VERIFY] _verifyCode triggered');
    String otp = otpController.text.trim();
    if (otp.length < 4) {
      log('[VERIFY] OTP code is incomplete (length: ${otp.length}). Aborting verify request.');
      showMessage(context, 'Please enter the 4-digit code.');
      return;
    }
    log('[VERIFY] Initiating actual verification request.');
    setState(() {
      isLoading = true;
    });
    try {
      final res = await AuthService.instance.verify(
        email: widget.email ?? '',
        token: otp,
      );
      log('[VERIFY] API Response status: ${res.status}, message: ${res.message}');
      if (res.status == true && res.data != null) {
        final data = res.data!;
        final String? token = data['token'] as String?;
        final dynamic user = data['user'];

        log('[VERIFY] Verification successful. Saving session.');
        if (token != null) {
          setValue("access_token", token);
          log('[VERIFY] Saved access_token');
        }

        String firstName = '';
        String lastName = '';
        String userEmail = widget.email ?? '';

        if (user != null && user is Map) {
          firstName = user['first_name'] ?? user['firstname'] ?? '';
          lastName = user['last_name'] ?? user['lastname'] ?? '';
          userEmail = user['email'] ?? userEmail;
        } else {
          firstName = data['first_name'] ?? data['firstname'] ?? data['firstName'] ?? '';
          lastName = data['last_name'] ?? data['lastname'] ?? data['lastName'] ?? '';
          userEmail = data['email'] ?? userEmail;
        }

        setValue('fName', firstName);
        setValue('lName', lastName);
        setValue('email', userEmail);
        setValue('home', true);

        log('[VERIFY] Session saved: fName = $firstName, lName = $lastName, email = $userEmail, home = true');
        log('[VERIFY] Navigating to Home Dashboard (Nav)');
        const Nav().launch(context, isNewTask: true);
      } else {
        log('[VERIFY] Verification failed: ${res.message}');
        showMessage(context, res.message ?? 'Verification failed. Please check the code.');
      }
    } catch (e) {
      log('[VERIFY] Unexpected error during verification: ${e.toString()}');
      showMessage(context, 'An unexpected error occurred. Please try again.');
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cream,
      body: SafeArea(
        child: Form(
          key: _verifyOtpFormKey,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                64.height,
                Text(
                  'Verification',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Cinta',
                    fontSize: 32.sp,
                    color: ink,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                16.height,
                Text(
                  'Enter the 4-digit code sent to\n${widget.phone ?? widget.email ?? "your device"}',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontFamily: 'Cinta', 
                    fontSize: 16.sp,
                    color: textLight,
                    height: 1.5,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                48.height,
                Center(
                  child: PinCodeFields(
                    length: 4,
                    fieldBorderStyle: FieldBorderStyle.square,
                    responsive: false,
                    fieldHeight: 64.h,
                    fieldWidth: 64.w,
                    borderWidth: 1.0,
                    activeBorderColor: primary,
                    activeBackgroundColor: white,
                    borderRadius: BorderRadius.circular(12.r),
                    keyboardType: TextInputType.number,
                    autoHideKeyboard: false,
                    fieldBackgroundColor: white,
                    borderColor: sand,
                    textStyle: GoogleFonts.montserrat(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                      color: ink,
                    ),
                    controller: otpController,
                    onComplete: (output) {
                      log('[VERIFY] Pin code fields completed: $output');
                      _verifyCode();
                    },
                  ),
                ),
                40.height,
                Column(
                  children: [
                    Text(
                      'I haven’t received code (0:${_start.toString().padLeft(2, '0')}) ',
                      style: TextStyle(fontFamily: 'Cinta', 
                        fontSize: 14.sp,
                        color: textLight,
                      ),
                    ),
                    8.height,
                    TextButton(
                      onPressed: (_start == 0 && !isResending)
                          ? () async {
                              log('[VERIFY] Resend button clicked.');
                              setState(() => isResending = true);
                              final res = await AuthService.instance.resendVerificationOtp(
                                email: widget.email ?? '',
                              );
                              if (mounted) {
                                setState(() => isResending = false);
                                showMessage(context, res.message ?? (res.status == true ? 'Code resent!' : 'Could not resend. Try again.'));
                                if (res.status == true) startTimer();
                              }
                            }
                          : null,
                      style: TextButton.styleFrom(padding: EdgeInsets.zero),
                      child: isResending
                          ? SizedBox(
                              height: 14.sp,
                              width: 14.sp,
                              child: CircularProgressIndicator(strokeWidth: 2, color: primary),
                            )
                          : Text(
                              'Resend',
                              style: TextStyle(
                                fontFamily: 'Cinta',
                                fontSize: 14.sp,
                                color: _start == 0 ? primary : textLight.withOpacity(0.5),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                    ),
                  ],
                ),
                64.height,
                ElevatedButton(
                   onPressed: () {
                    _verifyCode();
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
                      child: isLoading
                          ? const CircularProgressIndicator(color: white)
                          : Text(
                              'Verify Code',
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
                TextButton(
                  onPressed: () {
                    finish(context);
                  },
                  child: Text(
                    'Wrong Email?',
                    style: TextStyle(fontFamily: 'Cinta', 
                      fontSize: 14.sp,
                      color: primary,
                      fontWeight: FontWeight.w600,
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
