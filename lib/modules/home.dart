import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:stylclick/modules/buy-fabrics/buy_fabrics.dart';
import 'package:stylclick/modules/select-tailor/select_tailor.dart';
import 'package:stylclick/shared/constants/colors.dart';
import 'package:stylclick/shared/constants/images.dart';
import 'package:stylclick/shared/constants/strings.dart';
import 'package:stylclick/shared/utils/helpers.dart';

import '../shared/widgets/custom_textfield.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentCarouselIndex = 0;

  Gradient gradient = const LinearGradient(
    colors: [
      Color(0xFFEA4262),
      Color(0xFFDD6140),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      carouselBg,
      carouselBg,
    ];

    final List<String> categoriesText = [
      'Female\nAso-ebi',
      'Male\nAso-ebi',
      'Ankara'
    ];
    final List<String> categoriesImages = [femaleAsoebi, maleAsoebi, ankara];
    return Scaffold(
      backgroundColor: homeBgColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(gradient: gradient),
              height: 160.h,
              child: Padding(
                padding: EdgeInsets.only(left: 17.0.w, right: 17.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        menuIcon,
                        height: 28.h,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        homeLogo,
                        height: 35.h,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        notificationIcon,
                        height: 35.h,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 17.w, right: 17.w, top: 110.h),
              child: CustomTextField(
                  hintTextColor: homeSearchHintColor,
                  hintText: 'Search for a tailor or fabrics seller',
                  filledColor: Colors.white,
                  borderRadius: BorderRadius.circular(15.r),
                  prefixIcon: const Icon(Icons.search)),
            ),
            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  140.height,
                  Center(
                    child: CarouselSlider(
                      items: images.map((image) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: double.infinity,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  // Image (Right-Centered)
                                  Positioned(
                                    right: 0,
                                    child: Image.asset(
                                      man,
                                      height: 100.h,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  // Text (Left-Centered)
                                  Positioned(
                                    left: 16,
                                    child: Text(
                                      'Your Text',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      }).toList(),
                      options: CarouselOptions(
                        height: 200,
                        viewportFraction: 1,
                        enlargeCenterPage: false,
                        enableInfiniteScroll: true,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        scrollDirection: Axis.horizontal,
                        onPageChanged: (index, reason) {
                          // TODO: Implement indicator logic
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 17.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            SelectTailor().launch(context);
                          },
                          child: Container(
                              height: 120.h,
                              width: 100.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.r),
                                  color: Colors.white),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  19.height,
                                  Image.asset(
                                    sewingMachine,
                                    height: 47.h,
                                    width: 62.w,
                                  ),
                                  16.height,
                                  Text(
                                    'Select Tailor',
                                    style: TextStyle(
                                        fontFamily: cinta,
                                        fontSize: 12.sp,
                                        color: quickAccessTextColor,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              )),
                        ),
                        InkWell(
                          onTap: () {
                            BuyFabrics().launch(context);
                          },
                          child: Container(
                              height: 120.h,
                              width: 100.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.r),
                                  color: Colors.white),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  19.height,
                                  Image.asset(
                                    fabric,
                                    height: 47.h,
                                    width: 62.w,
                                  ),
                                  16.height,
                                  Text(
                                    'Buy Fabrics',
                                    style: TextStyle(
                                        fontFamily: cinta,
                                        fontSize: 12.sp,
                                        color: quickAccessTextColor,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              )),
                        ),
                        Container(
                            height: 120.h,
                            width: 100.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.r),
                                color: Colors.white),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                19.height,
                                Image.asset(
                                  dispatchRider,
                                  height: 47.h,
                                  width: 62.w,
                                ),
                                16.height,
                                Text(
                                  'Dispatch Rider',
                                  style: TextStyle(
                                      fontFamily: cinta,
                                      fontSize: 12.sp,
                                      color: quickAccessTextColor,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ))
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 17.0.w, top: 16.h, bottom: 14.h),
                    child: Text(
                      'Categories',
                      style: TextStyle(
                          fontFamily: cinta,
                          fontSize: 16.sp,
                          color: black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 17.0.w),
                    child: SizedBox(
                      height: 100.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categoriesImages.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            width: 120,
                            margin: EdgeInsets.symmetric(horizontal: 4.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                image: AssetImage(categoriesImages[index]),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                categoriesText[index],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontFamily: cinta,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 17.0.w, top: 16.h, bottom: 14.h, right: 17.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Featured',
                          style: TextStyle(
                              fontFamily: cinta,
                              fontSize: 16.sp,
                              color: black,
                              fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            'View All',
                            style: TextStyle(
                                fontFamily: cinta,
                                fontSize: 12.sp,
                                color: viewAllTextColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        4.width,
                        Icon(
                          Icons.arrow_forward_ios,
                          color: viewAllTextColor,
                          size: 10,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 17.0.w, right: 17.w),
                    child: SizedBox(
                      height: logicalHeight(),
                      child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 16,
                                childAspectRatio: 9 / 14),
                        itemCount: images.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white,
                            ),
                            width: context.width() * 0.4,
                            height: 300,
                            child: Wrap(
                              crossAxisAlignment: WrapCrossAlignment.start,
                              children: [
                                AspectRatio(
                                  aspectRatio: 9 / 11,
                                  child: Stack(
                                    children: [
                                      Image.asset(images[index],
                                          fit: BoxFit.cover,
                                          height: 200,
                                          width: double.infinity),
                                      Positioned(
                                        top: 170,
                                        right: 8,
                                        child: Container(
                                          width: 32,
                                          height: 32,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Image.asset(favoriteIcon,
                                                height: 16.h, width: 16.w),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  'Image $index',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    color: storeNameColor,
                                    fontFamily: cinta,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                4.height,
                                Row(
                                  children: [
                                    Icon(
                                      (Icons.location_on),
                                      color: locationIconColor,
                                      size: 14,
                                    ),
                                    4.width,
                                    Text(
                                      'Image $index',
                                      style: TextStyle(
                                        fontSize: 14.sp,
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
                                      itemBuilder: (context, _) => Icon(
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
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
