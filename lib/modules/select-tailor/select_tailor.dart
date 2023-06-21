import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
            Padding(
              padding: EdgeInsets.only(
                left: 17.0.w,
              ),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        backIcon,
                        color: selectTailorColor,
                        width: 24.w,
                      ),
                    ),
                  ),
                  Text(
                    'Select Tailor',
                    style: TextStyle(
                      color: selectTailorColor,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 17.w, right: 17.w),
              child: CustomTextField(
                  hintTextColor: homeSearchHintColor,
                  hintText: 'Search for a tailor around you',
                  filledColor: const Color(0xfffffcfc),
                  borderColor: const Color(0xffbcb6b6),
                  borderRadius: BorderRadius.circular(25.r),
                  prefixIcon: const Icon(Icons.search)),
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
                            childAspectRatio: 9 / 14
                    ),
                    itemCount: images.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          TailorDetails(
                            businessName: 'Moralake Stitches',
                          ).launch(context);
                        },
                        child: Container(
                          width: context.width() * 0.4,
                          height: 250,
                          decoration: const BoxDecoration(
                            // borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                          ),
                          child: Wrap(
                            crossAxisAlignment: WrapCrossAlignment.start,
                            children: [
                              Expanded(
                                child: Image.asset(
                                  images[index],
                                  fit: BoxFit.cover,
                                  height: 184.h,
                                  width: 184.w,
                                ),
                              ),
                              4.height,
                              Text(
                                'Morah Stitches',
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  color: storeNameColor,
                                  fontFamily: cinta,
                                  fontWeight: FontWeight.w700,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              4.height,
                              Row(
                                children: [
                                  const Icon(
                                    (Icons.location_on),
                                    color: locationIconColor,
                                    size: 16,
                                  ),
                                  4.width,
                                  Text(
                                    'Akure, Ondo',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontFamily: cinta,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                              4.height,
                              Row(
                                children: [
                                  RatingBar.builder(
                                    initialRating: 3,
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemSize: 12,
                                    // itemPadding: EdgeInsets.symmetric(
                                    //     horizontal: 2.0),
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 5,
                                    ),
                                    onRatingUpdate: (rating) {
                                      log(rating);
                                    },
                                  ),
                                  4.width,
                                  Text(
                                    '13 Reviews',
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        fontFamily: cinta,
                                        fontWeight: FontWeight.bold,
                                        color: signinTextColor),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                              4.height,
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
