import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:stylclick/modules/auth/login.dart';
import 'package:stylclick/modules/auth/verify_user.dart';
import 'package:stylclick/shared/constants/colors.dart';
import 'package:stylclick/shared/constants/images.dart';
import 'package:stylclick/shared/utils/helpers.dart';
import 'package:stylclick/shared/widgets/nav.dart';
import 'package:stylclick/core/services/auth_service.dart';
import 'package:stylclick/shared/widgets/snack_bar.dart';
import 'package:stylclick/shared/widgets/custom_textfield.dart';
import 'package:stylclick/shared/constants/strings.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController referralController = TextEditingController();

  bool obscurePassword = true;
  bool obscureConfirmPassword = true;
  String? selectedState;
  List<String> states = ['Lagos', 'Abuja', 'Oyo', 'Kano', 'Rivers'];
  String countryCode = "+234";
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    log('[REGISTER] RegisterScreen initialized');
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    addressController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    referralController.dispose();
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
            key: _registerFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              32.height,
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
                    height: 60.h,
                    width: 60.h,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              24.height,
              Text(
                'Registration',
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
                'Join the StyClick Community Today',
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: 'Cinta', 
                  fontSize: 14.sp,
                  color: textLight,
                  fontWeight: FontWeight.w400,
                ),
              ),
              32.height,
              CustomTextField(
                controller: nameController,
                label: 'Full Name',
                hintText: 'Enter your full name',
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Full name is required';
                  return null;
                },
              ),
              20.height,
              CustomTextField(
                controller: emailController,
                label: 'Email',
                hintText: 'Enter your email address',
                textInputType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Email is required';
                  if (!isValidEmail(value.validate())) return 'Enter a valid email';
                  return null;
                },
              ),
              20.height,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Phone Number',
                    style: GoogleFonts.montserrat(
                      fontSize: 10.sp,
                      color: textLight,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.2,
                    ),
                  ),
                  6.height,
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          color: white,
                          border: Border.all(color: sand),
                        ),
                        child: CountryCodePicker(
                          onInit: (_countryCode) {
                            countryCode = _countryCode.toString();
                          },
                          initialSelection: 'NG',
                          favorite: const ['+234', 'NG'],
                          onChanged: (_countryCode) {
                            countryCode = _countryCode.toString();
                          },
                          showCountryOnly: false,
                          showOnlyCountryWhenClosed: false,
                          alignLeft: false,
                          textStyle: TextStyle(fontFamily: 'Cinta', color: ink, fontSize: 14.sp),
                          dialogBackgroundColor: cream,
                          searchStyle: TextStyle(fontFamily: 'Cinta', color: ink),
                          dialogTextStyle: TextStyle(fontFamily: 'Cinta', color: ink),
                          barrierColor: ink.withOpacity(0.5),
                        ),
                      ),
                      12.width,
                      Expanded(
                        child: CustomTextField(
                          controller: phoneController,
                          label: '',
                          hintText: 'Mobile number',
                          textInputType: TextInputType.phone,
                          validator: (value) {
                            if (value == null || value.isEmpty) return 'Required';
                            if (value.length < 10 || value.length > 11) return '10-11 digits';
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              20.height,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'State',
                          style: GoogleFonts.montserrat(
                            fontSize: 10.sp,
                            color: textLight,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.2,
                          ),
                        ),
                        6.height,
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 12.w),
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(12.r),
                            border: Border.all(color: sand),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              isExpanded: true,
                              value: selectedState,
                              dropdownColor: cream,
                              icon: Icon(Icons.keyboard_arrow_down_rounded, color: textLight, size: 20.sp),
                              hint: Text('Select State', style: TextStyle(fontFamily: 'Cinta', color: textLight.withOpacity(0.5), fontSize: 14.sp)),
                              items: states.map((state) {
                                return DropdownMenuItem<String>(
                                  value: state,
                                  child: Text(state, style: TextStyle(fontFamily: 'Cinta', color: ink, fontSize: 14.sp)),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  selectedState = value;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  16.width,
                  Expanded(
                    child: CustomTextField(
                      controller: addressController,
                      label: 'Address',
                      hintText: 'Enter address',
                      validator: (value) {
                        if (value == null || value.isEmpty) return 'Required';
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              20.height,
              CustomTextField(
                controller: passwordController,
                label: 'Password',
                hintText: 'Create a password',
                obscureText: obscurePassword,
                suffixIcon: IconButton(
                  onPressed: () => setState(() => obscurePassword = !obscurePassword),
                  icon: Icon(
                    obscurePassword ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                    color: textLight,
                    size: 20.sp,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Password is required';
                  if (value.length < 6) return 'At least 6 characters';
                  return null;
                },
              ),
              20.height,
              CustomTextField(
                controller: confirmPasswordController,
                label: 'Confirm Password',
                hintText: 'Repeat your password',
                obscureText: obscureConfirmPassword,
                suffixIcon: IconButton(
                  onPressed: () => setState(() => obscureConfirmPassword = !obscureConfirmPassword),
                  icon: Icon(
                    obscureConfirmPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                    color: textLight,
                    size: 20.sp,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Please confirm password';
                  if (value != passwordController.text) return 'Passwords do not match';
                  return null;
                },
              ),
              20.height,
              CustomTextField(
                controller: referralController,
                label: 'Referral Code (Optional)',
                hintText: 'Enter Referral Code',
              ),
              32.height,
              ElevatedButton(
                onPressed: () async {
                  log('[REGISTER] Sign Up button pressed');
                  if (_registerFormKey.currentState!.validate()) {
                    if (selectedState == null) {
                      log('[REGISTER] State not selected. Aborting signup request.');
                      showMessage(context, 'Please select your state.');
                      return;
                    }
                    log('[REGISTER] Form validation succeeded. Preparing payload.');
                    setState(() {
                      isLoading = true;
                    });

                    try {
                      List<String> nameParts = nameController.text.trim().split(' ');
                      String firstName = nameParts.isNotEmpty ? nameParts.first : '';
                      String lastName = nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '';
                      String email = emailController.text.trim();
                      String phone = '$countryCode${phoneController.text.trim()}';
                      String address = addressController.text.trim();
                      String password = passwordController.text.trim();

                      log('[REGISTER] Initiating API call to signup for email: $email, name: $firstName $lastName, phone: $phone, state: $selectedState, address: $address');
                      final res = await AuthService.instance.signup(
                        email: email,
                        password: password,
                        firstName: firstName,
                        lastName: lastName,
                        phone: phone,
                        state: selectedState!,
                        address: address,
                        referralCode: referralController.text.trim().isNotEmpty ? referralController.text.trim() : null,
                      );

                      log('[REGISTER] API Response status: ${res.status}, message: ${res.message}');
                      if (res.status == true) {
                        log('[REGISTER] Signup successful. Redirecting to OTP Verification screen.');
                        showMessage(context, res.message ?? 'Registration successful! Verification code sent.');
                        VerifyUser(
                          email: email,
                          phone: phone,
                        ).launch(context);
                      } else {
                        log('[REGISTER] Signup failed: ${res.message}');
                        final lowerMsg = (res.message ?? '').toLowerCase();
                        final isEmailServiceError = lowerMsg.contains('credit') || 
                            lowerMsg.contains('unauthorized') || 
                            lowerMsg.contains('sendgrid') || 
                            lowerMsg.contains('email');

                        if (isEmailServiceError) {
                          showDialog(
                            context: context,
                            builder: (dialogCtx) => AlertDialog(
                              backgroundColor: cream,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.r),
                                side: const BorderSide(color: sand),
                              ),
                              title: Row(
                                children: [
                                  Icon(Icons.warning_amber_rounded, color: primary, size: 24.sp),
                                  8.width,
                                  Expanded(
                                    child: Text(
                                      'Email Service Issue',
                                      style: TextStyle(
                                        fontFamily: 'Cinta',
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w700,
                                        color: ink,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              content: Text(
                                'The registration request failed with: "${res.message}".\n\n'
                                'This typically indicates that the backend email service (SendGrid) has run out of credits or has incorrect API keys.\n\n'
                                'Would you like to bypass this error and proceed directly to OTP Verification (using the local dev bypass)?',
                                style: TextStyle(
                                  fontFamily: 'Cinta',
                                  fontSize: 14.sp,
                                  color: textLight,
                                  height: 1.4,
                                ),
                              ),
                              actionsPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(dialogCtx),
                                  child: Text(
                                    'Cancel',
                                    style: TextStyle(
                                      fontFamily: 'Cinta',
                                      fontSize: 14.sp,
                                      color: textLight,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(dialogCtx);
                                    log('[REGISTER] User opted to bypass signup error and proceed to OTP verification');
                                    VerifyUser(
                                      email: email,
                                      phone: phone,
                                    ).launch(context);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: primary,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.r),
                                    ),
                                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                                    elevation: 0,
                                  ),
                                  child: Text(
                                    'Bypass & Proceed',
                                    style: TextStyle(
                                      fontFamily: 'Cinta',
                                      fontSize: 14.sp,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        } else {
                          showMessage(context, res.message ?? 'Registration failed. Please try again.');
                        }
                      }
                    } catch (e) {
                      log('[REGISTER] Unexpected error during signup: ${e.toString()}');
                      showMessage(context, 'An unexpected error occurred. Please try again.');
                    } finally {
                      setState(() {
                        isLoading = false;
                      });
                    }
                  } else {
                    log('[REGISTER] Form validation failed.');
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
                            'Create Account',
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account? ',
                    style: TextStyle(fontFamily: 'Cinta', 
                      fontSize: 14.sp,
                      color: textLight,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      const LoginScreen().launch(context);
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    child: Text(
                      'Sign In',
                      style: TextStyle(fontFamily: 'Cinta', 
                        fontSize: 14.sp,
                        color: primary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              32.height,
            ],
          ),
        ),
      ),
    ),
    );
  }
}
