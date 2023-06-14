import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:stylclick/modules/success_page.dart';
import 'package:stylclick/shared/constants/colors.dart';
import 'package:stylclick/shared/constants/images.dart';
import 'package:stylclick/shared/constants/strings.dart';
import 'package:stylclick/shared/widgets/custom_textfield.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  Gradient gradient = const LinearGradient(
    colors: [
      Color(0xFFEA4262),
      Color(0xFFDD6140),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  String? selectedCountry;
  String? selectedState;
  String? selectedCity;

  List<String> countries = ['Country 1', 'Country 2', 'Country 3'];
  List<String> states = ['State 1', 'State 2', 'State 3'];
  List<String> cities = ['City 1', 'City 2', 'City 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffefefef),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(gradient: gradient),
              height: 160.h,
              child: Padding(
                padding: EdgeInsets.only(left: 17.0.w, right: 17.w),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          backIcon,
                          color: white,
                          width: 24.w,
                        ),
                      ),
                    ),
                    Text(
                      'Profile',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 17.w, right: 17.w, top: 110.h),
              child: Container(
                width: 110,
                height: 110,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Stack(
                  children: [
                    const Align(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage(profileIcon),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        height: 36,
                        width: 36,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Color(0xffdd6140)),
                        child: const Center(
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 230),
              child: Padding(
                padding: const EdgeInsets.only(left: 17.0, right: 17.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 48.h,
                      decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(5.r)),
                      child: Row(
                        children: [
                          8.width,
                          Image.asset(
                            profileAvatar,
                            height: 24,
                            width: 24,
                          ),
                          8.width,
                          Text('Personal Information',    style: TextStyle(
                              fontSize: 15.sp,
                              color: const Color(0xffde6041),
                              fontFamily: cinta,
                              fontWeight: FontWeight.w700),),
                          const Spacer(),
                          Image.asset(
                            downArrow,
                            height: 8,
                            width: 24,
                          ),
                          8.width,
                        ],
                      ),
                    ),
                    8.height,
                    CustomTextField(
                      label: 'Fullname',
                      filledColor: const Color(0xffdedede),
                      labelColor: black,
                      hintTextColor: const Color.fromRGBO(0, 0, 0, 0.5),
                      hintText: 'Oluwafemi Doe',
                    ),
                    8.height,
                    CustomTextField(
                      label: 'Address',
                      filledColor: const Color(0xffdedede),
                      labelColor: black,
                      hintTextColor: const Color.fromRGBO(0, 0, 0, 0.5),
                      hintText: 'No 12 Asombi Street, Nyanya Abuja ',
                    ),
                    8.height,
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'City',
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    color: black,
                                    fontFamily: cinta,
                                    fontWeight: FontWeight.w500),
                              ),
                              8.height,
                              Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xffdedede),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, right: 8),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      isExpanded: true,
                                      value: selectedCity,
                                      items: cities.map((city) {
                                        return DropdownMenuItem<String>(
                                          value: city,
                                          child: Text(city),
                                        );
                                      }).toList(),
                                      onChanged: (value) {
                                        setState(() {
                                          selectedCity = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        16.width,
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                'State',
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    color: black,
                                    fontFamily: cinta,
                                    fontWeight: FontWeight.w500),
                              ),
                              8.height,
                              Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xffdedede),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, right: 8),
                                    child: DropdownButton<String>(
                                      isExpanded: true,
                                      value: selectedState,
                                      items: states.map((state) {
                                        return DropdownMenuItem<String>(
                                          value: state,
                                          child: Text(state),
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
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Country',
                      style: TextStyle(
                          fontSize: 14.sp,
                          color: black,
                          fontFamily: cinta,
                          fontWeight: FontWeight.w500),
                    ),
                    8.height,
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xffdedede),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8),
                          child: DropdownButton<String>(
                            value: selectedCountry,
                            isExpanded: true,
                            items: countries.map((country) {
                              return DropdownMenuItem<String>(
                                value: country,
                                child: Text(country),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedCountry = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    16.height,
                    Container(
                      height: 48.h,
                      decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(5.r)),
                      child: Center(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            8.width,
                            Image.asset(
                              kycIcon,
                              height: 24,
                              width: 24,
                            ),
                            8.width,
                            Text(
                              'KYC Settings',
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  color: const Color(0xffde6041),
                                  fontFamily: cinta,
                                  fontWeight: FontWeight.w700),
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.arrow_forward_ios,
                              color: Color(0xffde6041),
                              size: 16,
                            ),
                            8.width,
                          ],
                        ),
                      ),
                    ),
                    16.height,
                    Container(
                      height: 48.h,
                      decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(5.r)),
                      child: Row(
                        children: [
                          8.width,
                          const Icon(Icons.account_balance,  color: Color(0xffde6041),),8.width,
                          Text('Bank Account',    style: TextStyle(
                              fontSize: 15.sp,
                              color: const Color(0xffde6041),
                              fontFamily: cinta,
                              fontWeight: FontWeight.w700),),const Spacer(),
                          const Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xffde6041),
                            size: 16,
                          ),
                          8.width,
                        ],
                      ),
                    ),32.height,
                    InkWell(
                      onTap: () async {
                        const SuccessPage(
                          message:
                              'Your profile has been successfully\nupdated',
                        ).launch(context);
                      },
                      child: Container(
                        height: 48.h,
                        decoration: BoxDecoration(
                            // color: white,
                            borderRadius: BorderRadius.circular(9),
                            gradient: const LinearGradient(
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
                    32.height,
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
