import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:im_stepper/stepper.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:stylclick/modules/success_page.dart';
import 'package:stylclick/shared/constants/colors.dart';
import 'package:stylclick/shared/constants/images.dart';
import 'package:stylclick/shared/constants/strings.dart';

import '../../shared/widgets/custom_textfield.dart';

class BecomeRider extends StatefulWidget {
  const BecomeRider({Key? key}) : super(key: key);

  @override
  State<BecomeRider> createState() => _BecomeRiderState();
}

class _BecomeRiderState extends State<BecomeRider> {
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
      backgroundColor: homeBgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 17.0.w,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          backIcon,
                          color: Colors.black,
                          width: 24.w,
                        ),
                      ),
                    ),
                    Text(
                      'Become a Dispatch rider',
                      style: TextStyle(
                        color: black,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                'Register as a dispatch rider on Styclick',
                style: TextStyle(
                  color: black,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
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
            label: 'Fullname',
            labelColor: black,
            hintTextColor: const Color.fromRGBO(0, 0, 0, 0.5),
            hintText: 'Enter your shop name',
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: CustomTextField(
            label: 'Email',
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
        Row(
          children: [
            Checkbox(value: null, onChanged: (value) {}),
            Text(
              'I have a motorcycle that i will drive',
              style: TextStyle(
                  fontSize: 12.sp,
                  color: Color.fromRGBO(41, 40, 40, 0.8),
                  fontFamily: cinta,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
        8.height,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: CustomTextField(
            label: 'Motorcycle Manufacturer',
            labelColor: black,
            hintTextColor: const Color.fromRGBO(0, 0, 0, 0.5),
            hintText: 'Enter motorcycle manufacturer',
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: CustomTextField(
            label: 'Motorcycle Model',
            labelColor: black,
            hintTextColor: const Color.fromRGBO(0, 0, 0, 0.5),
            hintText: 'Enter your motorcycle model',
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: CustomTextField(
            label: 'License plate',
            labelColor: black,
            hintTextColor: const Color.fromRGBO(0, 0, 0, 0.5),
            hintText: 'Enter your license plate number',
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
          'Your driver licensing details will be kept private',
          style: TextStyle(
              fontSize: 14.sp,
              color: black,
              fontFamily: cinta,
              fontWeight: FontWeight.w500),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: CustomTextField(
            label: 'License plate',
            labelColor: black,
            hintTextColor: const Color.fromRGBO(0, 0, 0, 0.5),
            hintText: 'Enter your license plate number',
          ),
        ),
        Text(
          "License number on your driver's documents",
          style: TextStyle(
              fontSize: 14.sp,
              color: black,
              fontFamily: cinta,
              fontWeight: FontWeight.w500),
        ),
        32.height,
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
                  child: Text('Proceed',
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

  Widget form4() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Rider License',
          style: TextStyle(
              fontSize: 14.sp,
              color: black,
              fontFamily: cinta,
              fontWeight: FontWeight.w500),
        ),
        Text(
          'Please provide a clear license showing the license\nnumber, your name and date of birth',
          style: TextStyle(
              fontSize: 14.sp,
              color: black,
              fontFamily: cinta,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500),
        ),
        Container(
          decoration: BoxDecoration(
              color: uploadBtnColor, borderRadius: BorderRadius.circular(32.r)),
          height: 48.h,
          width: 172.w,
          child: Row(
            children: [
              8.width,
              Image.asset(uploadIcon),
              4.width,
              Text(
                'Upload files',
                style: TextStyle(
                    fontSize: 14.sp,
                    color: uploadTextColor,
                    fontFamily: cinta,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
        Text(
          'Motorcycle License',
          style: TextStyle(
              fontSize: 14.sp,
              color: black,
              fontFamily: cinta,
              fontWeight: FontWeight.w500),
        ),
        Text(
          'Please provide the license document of your\nmotorcycle',
          style: TextStyle(
              fontSize: 14.sp,
              color: black,
              fontFamily: cinta,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500),
        ),
        Container(
          decoration: BoxDecoration(
              color: uploadBtnColor, borderRadius: BorderRadius.circular(32.r)),
          height: 48.h,
          width: 172.w,
          child: Row(
            children: [
              8.width,
              Image.asset(uploadIcon),
              4.width,
              Text(
                'Upload files',
                style: TextStyle(
                    fontSize: 14.sp,
                    color: uploadTextColor,
                    fontFamily: cinta,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
        32.height,
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
