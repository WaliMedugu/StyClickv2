import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:stylclick/modules/success_page.dart';
import 'package:stylclick/shared/constants/colors.dart';
import 'package:stylclick/shared/constants/images.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:stylclick/shared/widgets/custom_textfield.dart';
import 'package:stylclick/shared/utils/validator.dart';

class BecomeSeller extends StatefulWidget {
  const BecomeSeller({Key? key}) : super(key: key);

  @override
  State<BecomeSeller> createState() => _BecomeSellerState();
}

class _BecomeSellerState extends State<BecomeSeller> {
  int _currentStep = 0;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  
  // Controllers
  final TextEditingController _shopName = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phone = TextEditingController();

  List<String> _fabricTypes = [];
  final List<String> _options = ['Lace', 'Ankara', 'Silk', 'Cotton', 'Adire', 'Chiffon', 'Velvet', 'Crepe'];

  // Image Upload Paths
  String? _idImagePath;
  String? _storeImagePath;

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
                    'Seller Registration',
                    style: TextStyle(
                      fontFamily: 'Cinta',
                      fontSize: 22.sp,
                      color: primary,
                      fontWeight: FontWeight.w700,
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
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (_currentStep == 0) _buildShopInfo(),
                      if (_currentStep == 1) _buildProductInfo(),
                      if (_currentStep == 2) _buildVerification(),
                      60.height,
                    ],
                  ),
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

  Widget _buildShopInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader('SHOP DETAILS', 'Register your fabrics boutique.'),
        24.height,
        _buildTextField(
          'Shop Name',
          _shopName,
          FeatherIcons.shoppingBag,
          validator: (v) => v.validate().isEmpty ? 'Shop Name is required' : null,
        ),
        16.height,
        _buildTextField(
          'Business Email',
          _email,
          FeatherIcons.mail,
          type: TextInputType.emailAddress,
          validator: EmailValidator.validateEmail,
        ),
        16.height,
        _buildTextField(
          'Business Phone',
          _phone,
          FeatherIcons.phone,
          type: TextInputType.phone,
          validator: PhoneValidator.validatePhone,
        ),
        16.height,
        _buildTextField(
          'Store Address',
          _address,
          FeatherIcons.mapPin,
          validator: (v) => v.validate().isEmpty ? 'Store Address is required' : null,
        ),
      ],
    );
  }

  Widget _buildProductInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader('INVENTORY', 'Which fabrics do you supply?'),
        24.height,
        Wrap(
          spacing: 12.w,
          runSpacing: 12.h,
          children: _options.map((opt) {
            bool isSelected = _fabricTypes.contains(opt);
            return InkWell(
              onTap: () {
                setState(() {
                  if (isSelected) _fabricTypes.remove(opt);
                  else _fabricTypes.add(opt);
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
                  style: TextStyle(fontFamily: 'Cinta', 
                    fontSize: 14.sp,
                    color: isSelected ? white : ink,
                    fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
        32.height,
        Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(color: white, borderRadius: BorderRadius.circular(16.r), border: Border.all(color: sand)),
          child: Row(
            children: [
              Icon(FeatherIcons.truck, color: primary, size: 20.sp),
              20.width,
              Expanded(
                child: Text(
                  'Do you offer nationwide shipping?',
                  style: TextStyle(fontFamily: 'Cinta', fontSize: 14.sp, color: ink, fontWeight: FontWeight.w600),
                ),
              ),
              Switch(value: true, onChanged: (v) {}, activeColor: primary),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildVerification() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader('IDENTITY', 'Verify your business.'),
        24.height,
        _buildUploadField(
          'Government Issued ID',
          'Owner\'s Identification',
          _idImagePath,
          () {
            setState(() {
              _idImagePath = bizImage; // Mock uploaded file using bizImage
            });
          },
        ),
        16.height,
        _buildUploadField(
          'Store/Warehouse Photos',
          'Interior & Exterior',
          _storeImagePath,
          () {
            setState(() {
              _storeImagePath = sewingMachine; // Mock uploaded file using sewingMachine
            });
          },
        ),
        32.height,
        Text(
          'By submitting, you agree to Styclick\'s Seller Quality Guidelines.',
          style: TextStyle(fontFamily: 'Cinta', fontSize: 12.sp, color: textLight, fontStyle: FontStyle.italic),
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
          style: TextStyle(
            fontFamily: 'Cinta',
            fontSize: 12.sp,
            color: primary,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.5,
          ),
        ),
        8.height,
        Text(
          sub,
          style: TextStyle(fontFamily: 'Cinta', fontSize: 22.sp, color: ink, fontWeight: FontWeight.w700),
        ),
      ],
    );
  }

  Widget _buildTextField(
    String hint,
    TextEditingController controller,
    IconData icon, {
    TextInputType type = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return CustomTextField(
      controller: controller,
      hintText: hint,
      textInputType: type,
      prefixIcon: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Icon(icon, color: sand, size: 18.sp),
      ),
      validator: validator,
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
                          Text('File uploaded successfully', style: TextStyle(fontFamily: 'Cinta', fontSize: 12.sp, color: successColor)),
                        ],
                      ),
                    ),
                    Icon(FeatherIcons.checkCircle, color: successColor, size: 20.sp),
                  ],
                )
              : Column(
                  children: [
                    Icon(FeatherIcons.image, color: primary, size: 28.sp),
                    12.height,
                    Text(label, style: TextStyle(fontFamily: 'Cinta', fontSize: 15.sp, color: ink, fontWeight: FontWeight.w700)),
                    4.height,
                    Text(sub, style: TextStyle(fontFamily: 'Cinta', fontSize: 12.sp, color: textLight)),
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
              text: _currentStep == 2 ? 'Submit Registration' : 'Next Step',
              textStyle: GoogleFonts.montserrat(color: white, fontWeight: FontWeight.w700),
              color: primary,
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  if (_currentStep == 1 && _fabricTypes.isEmpty) {
                    toast('Please select at least one fabric type');
                    return;
                  }
                  if (_currentStep == 2) {
                    if (_idImagePath == null) {
                      toast('Please upload Government Issued ID');
                      return;
                    }
                    if (_storeImagePath == null) {
                      toast('Please upload Store/Warehouse Photos');
                      return;
                    }
                  }

                  if (_currentStep < 2) {
                    setState(() => _currentStep++);
                  } else {
                    const SuccessPage(
                      medium: 'Registration Sent',
                      message: 'Your fabrics store application is being processed.',
                    ).launch(context);
                  }
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
