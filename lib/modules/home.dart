import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:stylclick/modules/buy-fabrics/buy_fabrics.dart';
import 'package:stylclick/modules/edit_profile.dart';
import 'package:stylclick/modules/order/saved_order.dart';
import 'package:stylclick/modules/select-tailor/select_tailor.dart';
import 'package:stylclick/modules/vendor/index.dart';
import 'package:stylclick/shared/constants/colors.dart';
import 'package:stylclick/shared/constants/images.dart';
import 'package:stylclick/shared/constants/strings.dart';
import 'package:stylclick/shared/utils/helpers.dart';

import '../shared/widgets/custom_textfield.dart';
import 'details.dart';

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

  Gradient logoutGradient = const LinearGradient(
    colors: [
      Color(0xFFef3f53),
      Color(0xFFf1562e),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  final List<String> images = [
   maleAsoebi,femaleAsoebi
  ];

  final List<String> categoriesText = [
    'Female\nAso-ebi',
    'Male\nAso-ebi',
    'Ankara'
  ];
  final List<String> categoriesImages = [femaleAsoebi, maleAsoebi, ankara];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: homeBgColor,
      drawer: buildDrawer(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(gradient: gradient),
                  height: 160.h,
                  margin: const EdgeInsets.only(bottom: 20 * 2.5),
                  child: Padding(
                    padding: EdgeInsets.only(left: 17.0.w, right: 17.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            _openDrawer();
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              menuIcon,
                              height: 20.h,
                            ),
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
                            height: 24.h,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 130,
                  left: 0,
                  right: 0,
                  child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 16.w),
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      // alignment: Alignment.topCenter,
                      decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                                offset: Offset(0, 10),
                                blurRadius: 50,
                                color: Colors.white24)
                          ]),
                      height: 54,
                      child: TextFormField(
                        decoration: const InputDecoration(
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            hintText: 'Search saved order',
                            hintStyle: TextStyle(color: grey)),
                      )),
                ),
                // Padding(
                //   padding: EdgeInsets.only(left: 17.w, right: 17.w, top: 110.h),
                //   child: CustomTextField(
                //       hintTextColor: homeSearchHintColor,
                //       hintText: 'Search for a tailor or fabrics seller',
                //       filledColor: Colors.white,
                //       borderRadius: BorderRadius.circular(15.r),
                //       prefixIcon: const Icon(Icons.search)),
                // ),
                // SizedBox(
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       140.height,
                //
                //
                //     ],
                //   ),
                // ),
              ],
            ),
            Center(
              child: CarouselSlider(
                items: images.map((image) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 19.0,right: 19),
                        child: Container(
                          color: Colors.black,
                          // height: 100.h,
                          width: double.infinity,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              // Image (Right-Centered)
                              Positioned(
                                right: 0,

                                child: Image.asset(
                                  man,
                                  // height: 100.h,
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
                        ),
                      );
                    },
                  );
                }).toList(),
                options: CarouselOptions(
                  height: 120,
                  viewportFraction: 1,
                  enlargeCenterPage: false,
                  enableInfiniteScroll: true,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration:
                  const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index, reason) {
                    // TODO: Implement indicator logic
                  },
                ),
              ),
            ),
            16.height,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 17.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      const SelectTailor().launch(context);
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
                            24.height,
                            Image.asset(
                              sewingMachine,
                              height: 36.h,
                              width: 48.w,
                              fit: BoxFit.contain,
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
                      const BuyFabrics().launch(context);
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
                            24.height,
                            Image.asset(
                              fabric,
                              height: 36.h,
                              width: 48.w,
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
                          24.height,
                          Image.asset(
                            dispatchRider,
                            height: 36.h,
                            width: 48.w,
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
                    return InkWell(
                      onTap: (){
                        CategoryDetails().launch(context);
                      },
                      child: Container(
                        width: 100,
                        height: 110,
                        margin: EdgeInsets.symmetric(horizontal: 4.w),
                        decoration: BoxDecoration(
                          // borderRadius: BorderRadius.circular(5),
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
                              fontSize: 13.sp,
                              fontFamily: cinta,
                              fontWeight: FontWeight.w600,
                            ),
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
                  left: 17.0.w, top: 16.h, right: 17.w),
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
                  const Spacer(),
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
                  const Icon(
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
                  physics: const NeverScrollableScrollPhysics(),
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
                        color: Color(0xffd1d1d1),
                      ),
                      width: context.width() * 0.35,
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
                                    decoration: const BoxDecoration(
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
                          4.height,
                          Text(
                            'Lace Asoebi',
                            style: TextStyle(
                              fontSize: 13.sp,
                              color: storeNameColor,
                              fontFamily: cinta,
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          8.height,
                          Row(
                            children: [
                              const Icon(
                                (Icons.location_on),
                                color: locationIconColor,
                                size: 16,
                              ),
                              4.width,
                              Text(
                                'Ojota, Lagos',
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
    );
  }

  Widget buildDrawer(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: white,
      ),
      width: logicalWidth() * 0.65,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 19.0),
            child: SizedBox(
              height: 130.h,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(profileIcon),
                  ),
                  16.width,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // 16.height,
                      Text(
                        'John',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 22.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      8.height,
                      InkWell(
                        onTap: (){
                          EditProfile().launch(context);
                        },
                        child: Text(
                          'Update Profile',
                          style: TextStyle(
                              color: Color(0xff1dbd82),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Divider(
            color: const Color(0xffd9d9d9),
            thickness: 3.h,
          ),
          // 16.height,
          Padding(
            padding: const EdgeInsets.only(left: 19.0),
            child: InkWell(
              onTap: () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    orders,
                    height: 24,
                    width: 24,
                  ),
                  16.width,
                  Text(
                    'My Orders',
                    style: TextStyle(
                        fontFamily: cinta,
                        fontSize: 14.sp,
                        color: quickAccessTextColor,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
          24.height,
          Padding(
            padding: const EdgeInsets.only(left: 19.0),
            child: InkWell(
              onTap: () {
                SavedOrderPage().launch(context);
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    savedIcon,
                    height: 24,
                    width: 24,
                  ),
                  16.width,
                  Text(
                    'Saved',
                    style: TextStyle(
                        fontFamily: cinta,
                        fontSize: 14.sp,
                        color: quickAccessTextColor,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
          24.height,
          Padding(
            padding: const EdgeInsets.only(left: 19.0),
            child: InkWell(
              onTap: () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    styleitIcon,
                    height: 24,
                    width: 24,
                  ),
                  16.width,
                  Text(
                    'Style it',
                    style: TextStyle(
                        fontFamily: cinta,
                        fontSize: 14.sp,
                        color: quickAccessTextColor,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
          24.height,
          Padding(
            padding: const EdgeInsets.only(left: 19.0),
            child: InkWell(
              onTap: () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    chats,
                    height: 24,
                    width: 24,
                  ),
                  16.width,
                  Text(
                    'Chat',
                    style: TextStyle(
                        fontFamily: cinta,
                        fontSize: 14.sp,
                        color: quickAccessTextColor,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
          24.height,
          Padding(
            padding: const EdgeInsets.only(left: 19.0),
            child: InkWell(
              onTap: () {
                VendorPage().launch(context);
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    becomeVendor,
                    height: 24,
                    width: 24,
                  ),
                  16.width,
                  Text(
                    'Become a vendor',
                    style: TextStyle(
                        fontFamily: cinta,
                        fontSize: 14.sp,
                        color: quickAccessTextColor,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
          24.height,
          Padding(
            padding: const EdgeInsets.only(left: 19.0),
            child: InkWell(
              onTap: () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    shareEarn,
                    height: 24,
                    width: 24,
                  ),
                  16.width,
                  Text(
                    'Share and Earn',
                    style: TextStyle(
                        fontFamily: cinta,
                        fontSize: 14.sp,
                        color: quickAccessTextColor,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
          24.height,
          Padding(
            padding: const EdgeInsets.only(left: 19.0),
            child: InkWell(
              onTap: () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    settings,
                    height: 24,
                    width: 24,
                  ),
                  16.width,
                  Text(
                    'Settings',
                    style: TextStyle(
                        fontFamily: cinta,
                        fontSize: 14.sp,
                        color: quickAccessTextColor,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
          24.height,
          Padding(
            padding: const EdgeInsets.only(left: 19.0),
            child: InkWell(
              onTap: () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    support,
                    height: 24,
                    width: 24,
                  ),
                  16.width,
                  Text(
                    'Supports',
                    style: TextStyle(
                        fontFamily: cinta,
                        fontSize: 14.sp,
                        color: quickAccessTextColor,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
          24.height,
          Padding(
            padding: const EdgeInsets.only(left: 19.0),
            child: InkWell(
              onTap: () {
                buildLogoutDialog(context);
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    logoutIcon,
                    height: 24,
                    width: 24,
                  ),
                  16.width,
                  Text(
                    'Logout',
                    style: TextStyle(
                        fontFamily: cinta,
                        fontSize: 14.sp,
                        color: quickAccessTextColor,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
          16.height,
          Divider(
            color: const Color(0xffd9d9d9),
            thickness: 3.h,
          ),
        ],
      ),
    );
  }

  buildLogoutDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Color(0xffd9d9d9),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                24.height,
                Center(
                  child: Text(
                    'Are you sure you want to log\nout',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14.sp,
                        color: black),
                  ),
                ),
                36.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 95.w,
                      height: 42.h,
                      decoration: BoxDecoration(
                          color: Color(0xffd9d9d9),
                          border: Border.all(color: Colors.black, width: 1.24),
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                          child: Text(
                        'Yes',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14.sp,
                            color: black),
                      )),
                    ),
                    24.width,
                    InkWell(
                      onTap: () {
                        pop();
                      },
                      child: Container(
                        width: 95.w,
                        height: 42.h,
                        decoration: BoxDecoration(
                            gradient: logoutGradient,
                            borderRadius: BorderRadius.circular(5)),
                        child: Center(
                            child: Text(
                          'No',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16.sp,
                              color: white),
                        )),
                      ),
                    )
                  ],
                ),   24.height,
              ],
            ),
          );
        });
  }
}
