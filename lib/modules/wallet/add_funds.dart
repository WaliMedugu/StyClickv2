import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:stylclick/shared/constants/colors.dart';
import 'package:stylclick/shared/constants/images.dart';
import 'package:stylclick/shared/utils/helpers.dart';
import 'package:stylclick/shared/widgets/snack_bar.dart';
import 'package:stylclick/shared/widgets/nav.dart';

class AddFundsPage extends StatefulWidget {
  const AddFundsPage({Key? key}) : super(key: key);

  @override
  State<AddFundsPage> createState() => _AddFundsPageState();
}

class _AddFundsPageState extends State<AddFundsPage> {
  TextEditingController _amountController = TextEditingController();
  String _selectedMethod = 'Card';

  final List<Map<String, dynamic>> _methods = [
    {'name': 'Card', 'icon': cardIcon, 'desc': 'Visa, Mastercard, Verve'},
    {'name': 'Transfer', 'icon': transferIcon, 'desc': 'Bank Transfer'},
    {'name': 'USSD', 'icon': ussdIcon, 'desc': 'Bank USSD Codes'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cream,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                      'Add Funds',
                      style: GoogleFonts.montserrat(
                        fontSize: 24.sp,
                        color: primary,
                        fontWeight: FontWeight.w900,
                        letterSpacing: -1.0,
                      ),
                    ),
                  ],
                ),
              ),
              40.height,
              // Amount Input
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 17.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ENTER AMOUNT',
                      style: GoogleFonts.montserrat(
                        fontSize: 12.sp,
                        color: textLight,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.5,
                      ),
                    ),
                    16.height,
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(20.r),
                        border: Border.all(color: sand),
                      ),
                      child: Row(
                        children: [
                          Text(
                            'NGN',
                            style: GoogleFonts.montserrat(
                              fontSize: 18.sp,
                              color: textLight,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          20.width,
                          Expanded(
                            child: TextField(
                              controller: _amountController,
                              keyboardType: TextInputType.number,
                              style: GoogleFonts.montserrat(
                                fontSize: 24.sp,
                                color: ink,
                                fontWeight: FontWeight.w800,
                              ),
                              decoration: InputDecoration(
                                hintText: '0.00',
                                hintStyle: GoogleFonts.montserrat(color: sand),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              40.height,
              // Quick Amounts
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 17.w),
                child: Wrap(
                  spacing: 12.w,
                  children: ['5000', '10000', '20000', '50000'].map((amt) {
                    return InkWell(
                      onTap: () => setState(() => _amountController.text = amt),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                        decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(color: sand),
                        ),
                        child: Text(
                          'NGN $amt',
                          style: GoogleFonts.montserrat(
                            fontSize: 13.sp,
                            color: ink,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              40.height,
              // Payment Methods
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 17.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'SELECT PAYMENT METHOD',
                      style: GoogleFonts.montserrat(
                        fontSize: 12.sp,
                        color: textLight,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.5,
                      ),
                    ),
                    20.height,
                    ..._methods.map((method) => _buildMethodTile(method)),
                  ],
                ),
              ),
              60.height,
              // Proceed Button
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 17.w),
                child: AppButton(
                  width: double.infinity,
                  text: 'Proceed to Payment',
                  textStyle: GoogleFonts.montserrat(
                    color: white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                  ),
                  color: primary,
                  onTap: () {
                    if (_amountController.text.isEmpty) {
                      toast('Please enter an amount');
                      return;
                    }
                    showMessage(context, 'Redirecting to payment gateway...');
                  },
                  shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
                ),
              ),
              40.height,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMethodTile(Map<String, dynamic> method) {
    bool isSelected = _selectedMethod == method['name'];
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: InkWell(
        onTap: () => setState(() => _selectedMethod = method['name']),
        child: Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(color: isSelected ? primary : sand, width: isSelected ? 2 : 1),
          ),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: cream,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Image.asset(method['icon'], height: 24.h, width: 24.w),
              ),
              16.width,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      method['name'],
                      style: TextStyle(fontFamily: 'Cinta', 
                        fontSize: 15.sp,
                        color: ink,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      method['desc'],
                      style: TextStyle(fontFamily: 'Cinta', 
                        fontSize: 12.sp,
                        color: textLight,
                      ),
                    ),
                  ],
                ),
              ),
              if (isSelected)
                Icon(Icons.check_circle, color: primary, size: 24.sp)
              else
                Container(
                  height: 24.sp,
                  width: 24.sp,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: sand, width: 2),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
