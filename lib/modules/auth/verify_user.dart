import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

  @override
  void dispose() {
    // otpController.dispose();
    // focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Form(
        key: _verifyOtpFormKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              32.height,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text(
                    'Enter the 4-digit code sent to your\n${widget.phone} or ${widget.email}',
                    style: TextStyle(
                        fontFamily: cinta,
                        fontSize: 16.sp,
                        color: black,
                        fontWeight: FontWeight.bold)),
              ),
              PinCodeFields(
                length: 4,
                fieldBorderStyle: FieldBorderStyle.square,
                responsive: false,
                fieldHeight: 56.0,
                fieldWidth: 56.0,
                borderWidth: 0.5,
                activeBorderColor: biometricButtonColor,
                activeBackgroundColor: biometricButtonColor,
                borderRadius: BorderRadius.circular(5.0),
                keyboardType: TextInputType.number,
                autoHideKeyboard: false,
                fieldBackgroundColor: biometricButtonColor,
                borderColor: biometricButtonColor,
                textStyle: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w500,
                ),
                controller: otpController,
                onComplete: (output) {
                  // Your logic with pin code
                  print(output);
                },
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  children: [
                    Text('I haven’t received code (0:05), ',
                        style: TextStyle(
                            // fontFamily: poppins,
                            fontSize: 14.sp,
                            color: black,
                            fontWeight: FontWeight.w400)),
                    Text('Resend',
                        style: TextStyle(
                            // fontFamily: poppins,
                            fontSize: 16.sp,
                            color: signupTextColor,
                            fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
