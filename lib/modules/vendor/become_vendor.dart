import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:im_stepper/stepper.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:stylclick/modules/success_page.dart';
import 'package:stylclick/shared/constants/colors.dart';
import 'package:stylclick/shared/constants/images.dart';
import 'package:stylclick/shared/constants/strings.dart';
import 'package:stylclick/shared/widgets/custom_textfield.dart';

class BecomeVendor extends StatefulWidget {
  const BecomeVendor({Key? key}) : super(key: key);

  @override
  State<BecomeVendor> createState() => _BecomeVendorState();
}

class _BecomeVendorState extends State<BecomeVendor> {
  int currentStep = 0;
  TextEditingController textField1Controller = TextEditingController();
  TextEditingController textField2Controller = TextEditingController();
  TextEditingController textField3Controller = TextEditingController();
  List<String> selectedChips = [];

  // THE FOLLOWING TWO VARIABLES ARE REQUIRED TO CONTROL THE STEPPER.
  int activeStep = 3; // Initial step set to 5.

  int upperBound = 4; // upperBound MUST BE total number of icons minus 1.

  Gradient gradient = const LinearGradient(
    colors: [
      Color(0xFFEA4262),
      Color(0xFFDD6140),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  @override
  void dispose() {
    textField1Controller.dispose();
    textField2Controller.dispose();
    textField3Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffefefef),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 17.0.w,
                ),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        backIcon,
                        color: Colors.black,
                        width: 24.w,
                      ),
                    ),
                    8.width,
                    Text(
                      'Become a vendor',
                      style: TextStyle(
                        color: black,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 17.0.w, top: 16.h, bottom: 16.h),
                child: Text(
                  'Register your fashion shop on Styclick',
                  style: TextStyle(
                    color: black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              ImageStepper(
                enableNextPreviousButtons: false,
                activeStepColor: Color(0xFFEA4262),
                activeStepBorderColor: Color(0xFFEA4262),
                lineColor: activeStep == true ? Color(0xFFEA4262) : Colors.grey,

                images: [
                  AssetImage(profileIcon),
                  AssetImage(profileIcon),
                  AssetImage(profileIcon)
                ], // activeStep property set to activeStep variable defined above.
                activeStep: activeStep,
                // This ensures step-tapping updates the activeStep.
                onStepReached: (index) {
                  setState(() {
                    activeStep = index;
                  });
                },
              ),
              header(),
            ],
          ),
        ),
      ),
    );
  }

  /// Returns the header wrapping the header text.
  Widget header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'test',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'test2',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'test3',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }

  Widget form1() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: CustomTextField(
            label: 'Shop Name',
            labelColor: black,
            hintTextColor: const Color.fromRGBO(0, 0, 0, 0.5),
            hintText: 'Enter your shop name',
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: CustomTextField(
            label: 'Address',
            labelColor: black,
            hintTextColor: const Color.fromRGBO(0, 0, 0, 0.5),
            hintText: 'Enter your shop address',
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: CustomTextField(
            label: 'Business email',
            labelColor: black,
            hintTextColor: const Color.fromRGBO(0, 0, 0, 0.5),
            hintText: 'Enter your business email',
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: CustomTextField(
            label: 'Phone number',
            labelColor: black,
            hintTextColor: const Color.fromRGBO(0, 0, 0, 0.5),
            hintText: 'Enter your phone number',
          ),
        ),
        InkWell(
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Container(
              height: 61.h,
              decoration: BoxDecoration(
                  // color: white,
                  borderRadius: BorderRadius.circular(9),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [primary, primaryGradient],
                  )),
              child: Center(
                  child: Text('Proceed',
                      style: TextStyle(
                          fontFamily: cinta,
                          fontSize: 16.sp,
                          color: white,
                          fontWeight: FontWeight.bold))),
            ),
          ),
        ),
      ],
    );
  }

  Widget form2() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Specialized in',
            style: TextStyle(
                fontFamily: cinta,
                fontSize: 14.sp,
                color: Colors.black,
                fontWeight: FontWeight.w500)),
        8.height,
        Container(
          height: 42.h,
          decoration: BoxDecoration(
              color: categoryColor,
              borderRadius: BorderRadius.circular(18.r),
              border: Border.all(width: 1.5.w, color: categoryColor)),
          child: Center(
              child: Text('Men wear',
                  style: TextStyle(
                      fontFamily: cinta,
                      fontSize: 12.sp,
                      color: categoryColor,
                      fontWeight: FontWeight.w500))),
        ),
        InkWell(
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Container(
              height: 61.h,
              decoration: BoxDecoration(
                  // color: white,
                  borderRadius: BorderRadius.circular(9),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [primary, primaryGradient],
                  )),
              child: Center(
                  child: Text('Proceed',
                      style: TextStyle(
                          fontFamily: cinta,
                          fontSize: 16.sp,
                          color: white,
                          fontWeight: FontWeight.bold))),
            ),
          ),
        ),
        Center(
          child: Text('Previous',
              style: TextStyle(
                  fontFamily: cinta,
                  fontSize: 14.sp,
                  color: black,
                  fontWeight: FontWeight.bold)),
        )
      ],
    );
  }

  Widget form3() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Upload Certificate',
          style: TextStyle(
              fontSize: 14.sp,
              color: black,
              fontFamily: cinta,
              fontWeight: FontWeight.w500),
        ),
        DottedBorder(
          borderType: BorderType.RRect,
          radius: Radius.circular(12),
          padding: EdgeInsets.all(6),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            child: Container(
              decoration: BoxDecoration(color: uploadBtnColor),
              height: 178.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(uploadIcon),
                  4.width,
                  Text(
                    'Upload image',
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: uploadTextColor,
                        fontFamily: cinta,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
          ),
        ),
        Text(
          'Upload Banner Image',
          style: TextStyle(
              fontSize: 14.sp,
              color: black,
              fontFamily: cinta,
              fontWeight: FontWeight.w500),
        ),
        DottedBorder(
          borderType: BorderType.RRect,
          radius: Radius.circular(12),
          padding: EdgeInsets.all(6),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            child: Container(
              decoration: BoxDecoration(color: uploadBtnColor),
              height: 56.h,
              child: Row(
                children: [
                  24.width,
                  Image.asset(uploadIcon),
                  4.width,
                  Text(
                    'Upload banner image',
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: uploadTextColor,
                        fontFamily: cinta,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
          ),
        ),
        Text(
          'Upload Logo Image',
          style: TextStyle(
              fontSize: 14.sp,
              color: black,
              fontFamily: cinta,
              fontWeight: FontWeight.w500),
        ),
        DottedBorder(
          borderType: BorderType.RRect,
          radius: Radius.circular(12),
          padding: EdgeInsets.all(6),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            child: Container(
              decoration: BoxDecoration(color: uploadBtnColor),
              height: 56.h,
              child: Row(
                children: [
                  24.width,
                  Image.asset(uploadIcon),
                  4.width,
                  Text(
                    'Upload logo image',
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: uploadTextColor,
                        fontFamily: cinta,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
          ),
        ),
        Row(
          children: [
            Checkbox(value: null, onChanged: (value) {}),
            Text(
              'I agree to the ',
              style: TextStyle(
                  fontSize: 12.sp,
                  color: Color.fromRGBO(41, 40, 40, 0.8),
                  fontFamily: cinta,
                  fontWeight: FontWeight.w500),
            ),
            Text('Terms and Conditions ',
                style: TextStyle(
                    fontSize: 12.sp,
                    color: categoryColor,
                    fontFamily: cinta,
                    fontWeight: FontWeight.w500)),
            Text(
              'and ',
              style: TextStyle(
                  fontSize: 12.sp,
                  color: Color.fromRGBO(41, 40, 40, 0.8),
                  fontFamily: cinta,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              'Privacy\nPolicy',
              style: TextStyle(
                  fontSize: 12.sp,
                  color: categoryColor,
                  fontFamily: cinta,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
        InkWell(
          onTap: () {
            SuccessPage(
              medium: 'Via email',
              message:
                  'Your application has been successfully\nsubmitted, check out your Approval',
            ).launch(context);
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Container(
              height: 61.h,
              decoration: BoxDecoration(
                  // color: white,
                  borderRadius: BorderRadius.circular(9),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [primary, primaryGradient],
                  )),
              child: Center(
                  child: Text('Save',
                      style: TextStyle(
                          fontFamily: cinta,
                          fontSize: 16.sp,
                          color: white,
                          fontWeight: FontWeight.bold))),
            ),
          ),
        ),
        InkWell(
          onTap: () {},
          child: Center(
            child: Text('Previous',
                style: TextStyle(
                    fontFamily: cinta,
                    fontSize: 14.sp,
                    color: black,
                    fontWeight: FontWeight.bold)),
          ),
        )
      ],
    );
  }
}
