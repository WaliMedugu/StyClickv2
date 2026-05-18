import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:stylclick/modules/success_page.dart';
import 'package:stylclick/shared/constants/colors.dart';
import 'package:stylclick/shared/constants/images.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:stylclick/shared/constants/strings.dart';

class BecomeRider extends StatefulWidget {
  const BecomeRider({Key? key}) : super(key: key);

  @override
  State<BecomeRider> createState() => _BecomeRiderState();
}

class _BecomeRiderState extends State<BecomeRider> {
  int _currentStep = 0;
  
  // Controllers
  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _vehicleMake = TextEditingController();
  final TextEditingController _plateNumber = TextEditingController();

  String _vehicleType = 'Motorcycle';

  // Image Upload Paths
  String? _licenseImagePath;
  String? _insuranceImagePath;
  String? _ninImagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cream,
      body: SafeArea(
        child: Column(
          children: [
            20.height,
            // Header
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 17.w),
              child: Row(
                children: [
                  InkWell(
                    onTap: () => pop(context),
                    child: Icon(FeatherIcons.arrowLeft, color: ink, size: 24.sp),
                  ),
                  20.width,
                  Text(
                    'Rider Registration',
                    style: GoogleFonts.montserrat(
                      fontSize: 22.sp,
                      color: primary,
                      fontWeight: FontWeight.w900,
                      letterSpacing: -1.0,
                    ),
                  ),
                ],
              ),
            ),
            32.height,
            // Progress Indicator
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 17.w),
              child: Row(
                children: [0, 1, 2].map((i) {
                  bool isActive = _currentStep >= i;
                  return Expanded(
                    child: Container(
                      height: 4.h,
                      margin: EdgeInsets.only(right: i == 2 ? 0 : 8.w),
                      decoration: BoxDecoration(
                        color: isActive ? primary : sand,
                        borderRadius: BorderRadius.circular(2.r),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            24.height,
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 17.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (_currentStep == 0) _buildPersonalInfo(),
                    if (_currentStep == 1) _buildVehicleInfo(),
                    if (_currentStep == 2) _buildVerification(),
                    60.height,
                  ],
                ),
              ),
            ),
            // Navigation Buttons
            _buildNavButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildPersonalInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader('PERSONAL DETAILS', 'Create your dispatch profile.'),
        24.height,
        _buildTextField('Full Name', _fullName, FeatherIcons.user),
        16.height,
        _buildTextField('Email Address', _email, FeatherIcons.mail, type: TextInputType.emailAddress),
        16.height,
        _buildTextField('Phone Number', _phone, FeatherIcons.phone, type: TextInputType.phone),
        16.height,
        _buildTextField('Residential Address', _address, FeatherIcons.mapPin),
      ],
    );
  }

  Widget _buildVehicleInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader('VEHICLE DETAILS', 'Register your vehicle.'),
        24.height,
        Text(
          'Vehicle Type',
          style: GoogleFonts.montserrat(fontSize: 14.sp, color: ink, fontWeight: FontWeight.w700),
        ),
        12.height,
        Row(
          children: ['Motorcycle', 'Bicycle', 'Car'].map((type) {
            bool isSelected = _vehicleType == type;
            return Expanded(
              child: InkWell(
                onTap: () => setState(() => _vehicleType = type),
                child: Container(
                  margin: EdgeInsets.only(right: type == 'Car' ? 0 : 8.w),
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  decoration: BoxDecoration(
                    color: isSelected ? primary : white,
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(color: isSelected ? primary : sand),
                  ),
                  child: Center(
                    child: Text(
                      type,
                      style: TextStyle(
                        fontFamily: cinta,
                        fontSize: 14.sp,
                        color: isSelected ? white : ink,
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
        24.height,
        _buildTextField('Vehicle Manufacturer (e.g. Honda)', _vehicleMake, FeatherIcons.truck),
        16.height,
        _buildTextField('License Plate Number', _plateNumber, FeatherIcons.hash),
      ],
    );
  }

  Widget _buildVerification() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader('DOCUMENTATION', 'Verify your credentials.'),
        24.height,
        _buildUploadField(
          'Driver\'s License',
          'Front & Back View',
          _licenseImagePath,
          () {
            setState(() {
              _licenseImagePath = bizImage; // Mock uploaded file using bizImage
            });
          },
        ),
        16.height,
        _buildUploadField(
          'Vehicle Insurance/Reg',
          'Valid Documents',
          _insuranceImagePath,
          () {
            setState(() {
              _insuranceImagePath = sewingMachine; // Mock uploaded file using sewingMachine
            });
          },
        ),
        16.height,
        _buildUploadField(
          'NIN/ID Card',
          'National Identification',
          _ninImagePath,
          () {
            setState(() {
              _ninImagePath = profileAvatar; // Mock uploaded file using profileAvatar
            });
          },
        ),
        32.height,
        Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(color: primary.withOpacity(0.05), borderRadius: BorderRadius.circular(16.r)),
          child: Row(
            children: [
              Icon(FeatherIcons.shield, color: primary, size: 20.sp),
              16.width,
              Expanded(
                child: Text(
                  'Your data is encrypted and only used for verification purposes.',
                  style: TextStyle(fontFamily: cinta, fontSize: 12.sp, color: ink.withOpacity(0.7)),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSectionHeader(String title, String sub) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.montserrat(fontSize: 12.sp, color: primary, fontWeight: FontWeight.w700, letterSpacing: 1.5),
        ),
        8.height,
        Text(
          sub,
          style: GoogleFonts.montserrat(fontSize: 22.sp, color: ink, fontWeight: FontWeight.w700),
        ),
      ],
    );
  }

  Widget _buildTextField(String hint, TextEditingController controller, IconData icon, {TextInputType type = TextInputType.text}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(color: white, borderRadius: BorderRadius.circular(16.r), border: Border.all(color: sand)),
      child: Row(
        children: [
          Icon(icon, color: sand, size: 18.sp),
          16.width,
          Expanded(
            child: TextField(
              controller: controller,
              keyboardType: type,
              style: TextStyle(fontFamily: cinta, fontSize: 15.sp, color: ink),
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(fontFamily: cinta, color: sand),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUploadField(String label, String sub, String? imagePath, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: DottedBorder(
        color: sand,
        strokeWidth: 1,
        dashPattern: const [8, 4],
        borderType: BorderType.RRect,
        radius: Radius.circular(16.r),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(color: white, borderRadius: BorderRadius.circular(16.r)),
          child: imagePath != null
              ? Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.r),
                      child: Image.asset(
                        imagePath,
                        height: 50.h,
                        width: 50.w,
                        fit: BoxFit.cover,
                      ),
                    ),
                    16.width,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(label, style: GoogleFonts.montserrat(fontSize: 15.sp, color: ink, fontWeight: FontWeight.w700)),
                          4.height,
                          Text('File uploaded successfully', style: TextStyle(fontFamily: cinta, fontSize: 12.sp, color: successColor)),
                        ],
                      ),
                    ),
                    Icon(FeatherIcons.checkCircle, color: successColor, size: 20.sp),
                  ],
                )
              : Column(
                  children: [
                    Icon(FeatherIcons.camera, color: primary, size: 28.sp),
                    12.height,
                    Text(label, style: GoogleFonts.montserrat(fontSize: 15.sp, color: ink, fontWeight: FontWeight.w700)),
                    4.height,
                    Text(sub, style: TextStyle(fontFamily: cinta, fontSize: 12.sp, color: textLight)),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _buildNavButtons() {
    return Padding(
      padding: EdgeInsets.all(17.w),
      child: Row(
        children: [
          if (_currentStep > 0)
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(right: 12.w),
                child: AppButton(
                  text: 'Back',
                  textStyle: GoogleFonts.montserrat(color: ink, fontWeight: FontWeight.w700),
                  color: white,
                  onTap: () => setState(() => _currentStep--),
                  shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r), side: BorderSide(color: sand)),
                ),
              ),
            ),
          Expanded(
            flex: 2,
            child: AppButton(
              text: _currentStep == 2 ? 'Submit Application' : 'Next Step',
              textStyle: GoogleFonts.montserrat(color: white, fontWeight: FontWeight.w700),
              color: primary,
              onTap: () {
                if (_currentStep < 2) {
                  setState(() => _currentStep++);
                } else {
                  const SuccessPage(
                    medium: 'Application Sent',
                    message: 'Your rider profile is being reviewed. We will contact you shortly.',
                  ).launch(context);
                }
              },
              shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
            ),
          ),
        ],
      ),
    );
  }
}
