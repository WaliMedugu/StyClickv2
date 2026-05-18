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

class BecomeVendor extends StatefulWidget {
  const BecomeVendor({Key? key}) : super(key: key);

  @override
  State<BecomeVendor> createState() => _BecomeVendorState();
}

class _BecomeVendorState extends State<BecomeVendor> {
  int _currentStep = 0;
  
  // Controllers
  final TextEditingController _shopName = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _experience = TextEditingController();

  List<String> _specializations = [];
  final List<String> _options = ['Traditional', 'Corporate', 'Casual', 'Bridal', 'Asoebi', 'Streetwear'];

  // Image Upload Paths
  String? _cacImagePath;
  String? _portfolioImagePath;

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
                    'Designer Registration',
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
                    if (_currentStep == 0) _buildBusinessInfo(),
                    if (_currentStep == 1) _buildSpecialization(),
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

  Widget _buildBusinessInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader('BUSINESS DETAILS', 'Tell us about your brand.'),
        24.height,
        _buildTextField('Brand/Shop Name', _shopName, FeatherIcons.briefcase),
        16.height,
        _buildTextField('Business Email', _email, FeatherIcons.mail, type: TextInputType.emailAddress),
        16.height,
        _buildTextField('Phone Number', _phone, FeatherIcons.phone, type: TextInputType.phone),
        16.height,
        _buildTextField('Physical Address', _address, FeatherIcons.mapPin),
      ],
    );
  }

  Widget _buildSpecialization() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader('SPECIALIZATION', 'What styles do you master?'),
        24.height,
        Wrap(
          spacing: 12.w,
          runSpacing: 12.h,
          children: _options.map((opt) {
            bool isSelected = _specializations.contains(opt);
            return InkWell(
              onTap: () {
                setState(() {
                  if (isSelected) _specializations.remove(opt);
                  else _specializations.add(opt);
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                decoration: BoxDecoration(
                  color: isSelected ? primary : white,
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(color: isSelected ? primary : sand),
                ),
                child: Text(
                  opt,
                  style: TextStyle(
                    fontFamily: cinta,
                    fontSize: 14.sp,
                    color: isSelected ? white : ink,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
        32.height,
        _buildTextField('Years of Experience', _experience, FeatherIcons.clock, type: TextInputType.number),
      ],
    );
  }

  Widget _buildVerification() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader('VERIFICATION', 'Upload proof of your craft.'),
        24.height,
        _buildUploadField(
          'Business Registration (CAC)',
          'PDF or Image',
          _cacImagePath,
          () {
            setState(() {
              _cacImagePath = bizImage; // Mock uploaded file using bizImage asset
            });
          },
        ),
        16.height,
        _buildUploadField(
          'Portfolio/Recent Work',
          'Min. 3 high-quality images',
          _portfolioImagePath,
          () {
            setState(() {
              _portfolioImagePath = sewingMachine; // Mock uploaded file using sewingMachine asset
            });
          },
        ),
        32.height,
        Row(
          children: [
            Icon(FeatherIcons.info, color: primary, size: 16.sp),
            8.width,
            Expanded(
              child: Text(
                'Approval typically takes 24-48 hours after manual review.',
                style: TextStyle(fontFamily: cinta, fontSize: 12.sp, color: textLight),
              ),
            ),
          ],
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
                    Icon(FeatherIcons.uploadCloud, color: primary, size: 32.sp),
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
                    message: 'Your designer profile is being reviewed. We will contact you shortly.',
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
