import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:stylclick/modules/select-tailor/tailor_details.dart';
import 'package:stylclick/shared/constants/colors.dart';
import 'package:stylclick/shared/constants/images.dart';
import 'package:stylclick/shared/constants/strings.dart';
import 'package:stylclick/shared/widgets/custom_textfield.dart';

class SelectTailor extends StatefulWidget {
  const SelectTailor({Key? key}) : super(key: key);

  @override
  State<SelectTailor> createState() => _SelectTailorState();
}

class _SelectTailorState extends State<SelectTailor> {
  final List<String> images = [maleAsoebi, femaleAsoebi, femaleAsoebi];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(gradient: brandGradient),
              padding: EdgeInsets.only(left: 17.w, right: 17.w, top: 16.h, bottom: 24.h),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      backIcon,
                      color: Colors.white,
                      width: 24.w,
                    ),
                  ),
                  20.width,
                  Text(
                    'Select Tailor',
                    style: TextStyle(
                      fontFamily: 'Cinta',
                      fontSize: 26.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -1.0,
                    ),
                  ),
                ],
              ),
            ),
            24.height,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 17.w),
              child: Container(
                height: 52.h,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: sand),
                  boxShadow: [
                    BoxShadow(
                      color: ink.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Icon(Icons.search, color: ink.withOpacity(0.5), size: 20.sp),
                    12.width,
                    Expanded(
                      child: TextField(
                        style: TextStyle(fontFamily: 'Cinta', fontSize: 14.sp, color: ink),
                        decoration: InputDecoration(
                          hintText: 'Search for a tailor around you',
                          hintStyle: TextStyle(
                            fontFamily: 'Cinta', 
                            color: ink.withOpacity(0.4),
                            fontSize: 14.sp,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            16.height,
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 17.0.w, right: 17.w),
                child: SizedBox(
                  // height: 300,
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 16,
                            childAspectRatio: 9 / 16,
                    ),
                    itemCount: images.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          TailorDetails(businessName: 'Moralake Stitches').launch(context);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.r),
                            color: white,
                            border: Border.all(color: sand),
                            boxShadow: [
                              BoxShadow(
                                color: ink.withOpacity(0.03),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          padding: EdgeInsets.all(8.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12.r),
                                  child: Image.asset(
                                    images[index],
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                  ),
                                ),
                              ),
                              12.height,
                              Text(
                                'Morah Stitches',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontFamily: 'Cinta',
                                  fontSize: 14.sp,
                                  color: ink,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              4.height,
                              Row(
                                children: [
                                  Icon(Icons.location_on, color: locationIconColor, size: 12.sp),
                                  2.width,
                                  Text(
                                    'Akure, Ondo',
                                    style: TextStyle(
                                      fontFamily: 'Cinta',
                                      fontSize: 11.sp,
                                      color: textLight,
                                    ),
                                  ),
                                ],
                              ),
                              6.height,
                              Row(
                                children: [
                                  Icon(Icons.star_rounded, color: Colors.amber, size: 12.sp),
                                  2.width,
                                  Text(
                                    '4.8',
                                    style: GoogleFonts.montserrat(fontSize: 11.sp, fontWeight: FontWeight.w700, color: ink),
                                  ),
                                  4.width,
                                  Text(
                                    '(13)',
                                    style: GoogleFonts.montserrat(fontSize: 10.sp, color: textLight),
                                  ),
                                ],
                              ),
                              8.height,
                              Text(
                                'From NGN 15,000',
                                style: GoogleFonts.montserrat(
                                  fontSize: 13.sp,
                                  color: primary,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
