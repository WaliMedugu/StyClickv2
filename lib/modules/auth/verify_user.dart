import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
import 'package:stylclick/shared/constants/strings.dart';
import 'package:stylclick/shared/constants/colors.dart';

class VerifyUser extends StatefulWidget {
  final String? phone;
  final String? email;

  const VerifyUser({super.key, this.email, this.phone});

  @override
  State<VerifyUser> createState() => _VerifyUserState();
}

class _VerifyUserState extends State<VerifyUser> {
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
    startTimer();
  }

  @override
  void dispose() {
    otpController.dispose();
    focusNode.dispose();
    _timer?.cancel();
    super.dispose();
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
                  style: GoogleFonts.montserrat(
                    fontSize: 32.sp,
                    color: ink,
                    fontWeight: FontWeight.w900,
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
                      log(output);
                    },
                  ),
                ),
                40.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'I haven’t received code (0:${_start.toString().padLeft(2, '0')}) ',
                      style: TextStyle(fontFamily: 'Cinta', 
                        fontSize: 14.sp,
                        color: textLight,
                      ),
                    ),
                    TextButton(
                      onPressed: _start == 0
                          ? () {
                              startTimer();
                              // Add your resend API call here
                            }
                          : null,
                      style: TextButton.styleFrom(padding: EdgeInsets.zero),
                      child: Text(
                        'Resend',
                        style: TextStyle(fontFamily: 'Cinta', 
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
                    // Verification logic
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
                        'VERIFY CODE',
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
