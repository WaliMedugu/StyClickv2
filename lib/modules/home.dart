import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:stylclick/modules/buy-fabrics/buy_fabrics.dart';
import 'package:stylclick/modules/edit_profile.dart';
import 'package:stylclick/modules/order/saved_order.dart';
import 'package:stylclick/modules/order/saved_items.dart';
import 'package:stylclick/modules/select-tailor/select_tailor.dart';
import 'package:stylclick/modules/vendor/index.dart';
import 'package:stylclick/shared/widgets/nav.dart';
import 'package:stylclick/shared/constants/colors.dart';
import 'package:stylclick/shared/constants/images.dart';
import 'package:stylclick/modules/settings.dart';
import 'package:stylclick/modules/share_earn.dart';
import 'package:stylclick/shared/constants/strings.dart';
import 'package:stylclick/shared/utils/helpers.dart';

import 'package:stylclick/modules/auth/login.dart';
import 'package:stylclick/modules/wallet/wallet.dart';
import 'package:stylclick/modules/wallet/transaction_history.dart';
import 'package:stylclick/modules/account.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:stylclick/shared/widgets/snack_bar.dart';
import '../shared/widgets/custom_textfield.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'details.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  void _openEndDrawer() {
    _scaffoldKey.currentState?.openEndDrawer();
  }

  final List<String> images = [
    catFemaleAsoEbi,
    catMaleAsoEbi,
    catAnkara,
    catReadyToWear,
    catMaterials,
    catSenator,
    catLace,
  ];

  final List<String> categoriesText = [
    'Female\nAso-ebi',
    'Male\nAso-ebi',
    'Ankara',
    'Ready to\nWear',
    'Materials',
    'Senator\nStyles',
    'Lace\nStyles'
  ];

  final List<String> categoriesImages = [
    catFemaleAsoEbi,
    catMaleAsoEbi,
    catAnkara,
    catReadyToWear,
    catMaterials,
    catSenator,
    catLace,
  ];

  final List<Map<String, String>> carouselData = [
    {'title': 'Premium Tailoring', 'sub': 'Expert hands for your perfect fit.'},
    {'title': 'Quality Fabrics', 'sub': 'Sourced from the finest collections.'},
    {'title': 'Swift Logistics', 'sub': 'Delivered to your doorstep on time.'},
    {'title': 'Traditional Styles', 'sub': 'Celebrating heritage with every stitch.'},
    {'title': 'Modern Cuts', 'sub': 'Contemporary fashion for the bold.'},
    {'title': 'Asoebi Special', 'sub': 'Look stunning at your next event.'},
    {'title': 'Ready to Wear', 'sub': 'Instant elegance for any occasion.'},
    {'title': 'Fabric Sourcing', 'sub': 'Discover unique prints and textures.'},
    {'title': 'Design Your Fit', 'sub': 'Your measurements, our masterpiece.'},
    {'title': 'Style Consulting', 'sub': 'Talk to our fashion experts today.'},
  ];

  @override
  Widget build(BuildContext context) {
    final List<String> carouselImages = List.generate(10, (index) => categoriesImages[index % categoriesImages.length]);

    return Scaffold(
      key: _scaffoldKey,
      drawer: buildDrawer(context),
      endDrawer: buildNotificationDrawer(context),
      backgroundColor: cream,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              16.height,
              // Header
              // Header
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(gradient: brandGradient),
                padding: EdgeInsets.only(left: 17.w, right: 17.w, top: 16.h, bottom: 24.h),
                child: Row(
                  children: [
                    InkWell(
                      onTap: _openDrawer,
                      child: Image.asset(
                        menuIcon,
                        height: 24.h,
                        width: 24.w,
                        color: Colors.white,
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        homeLogo,
                        height: 35.h,
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: _openEndDrawer,
                      child: Image.asset(
                        notificationIcon,
                        height: 24.h,
                        width: 24.w,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              24.height,
              // Search Bar
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
                            hintText: 'Search for tailors or fabrics...',
                            hintStyle: TextStyle(fontFamily: 'Cinta', 
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
              24.height,
              // Carousel
              Center(
                child: CarouselSlider(
                  items: List.generate(10, (index) {
                    final data = carouselData[index];
                    return Builder(
                      builder: (BuildContext context) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 17.w),
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [primary, primaryGradient],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                            width: double.infinity,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Positioned(
                                  right: 0,
                                  top: 0,
                                  bottom: 0,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(16.r),
                                      bottomRight: Radius.circular(16.r),
                                    ),
                                    child: Image.asset(
                                      carouselImages[index],
                                      width: 150.w,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 24.w,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        data['title']!,
                                        style: TextStyle(fontFamily: 'Cinta', 
                                          color: Colors.white,
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      4.height,
                                      SizedBox(
                                        width: 160.w,
                                        child: Text(
                                          data['sub']!,
                                          style: GoogleFonts.montserrat(
                                            color: Colors.white.withOpacity(0.7),
                                            fontSize: 11.sp,
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
                      },
                    );
                  }).toList(),
                  options: CarouselOptions(
                    height: 120.h,
                    viewportFraction: 1,
                    enlargeCenterPage: false,
                    enableInfiniteScroll: true,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 4),
                    autoPlayAnimationDuration: const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ),
              24.height,
              // Quick Access
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 17.w),
                child: Row(
                  children: [
                    Expanded(
                      child: _buildQuickAccessItem(
                        context,
                        'Tailors',
                        sewingMachine,
                        () => const SelectTailor().launch(context),
                      ),
                    ),
                    8.width,
                    Expanded(
                      child: _buildQuickAccessItem(
                        context,
                        'Fabrics',
                        fabric,
                        () => const BuyFabrics().launch(context),
                      ),
                    ),
                    8.width,
                    Expanded(
                      child: _buildQuickAccessItem(
                        context,
                        'Logistics',
                        dispatchRider,
                        () {},
                      ),
                    ),
                  ],
                ),
              ),
              24.height,
              // Categories
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 17.w),
                child: Text(
                  'Categories',
                  style: GoogleFonts.montserrat(
                    fontSize: 20.sp,
                    color: ink,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              14.height,
              SizedBox(
                height: 120.h,
                child: ListView.builder(
                  padding: EdgeInsets.only(left: 17.w),
                  scrollDirection: Axis.horizontal,
                  itemCount: categoriesImages.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => CategoryDetails().launch(context),
                      child: Container(
                        width: 110.w,
                        margin: EdgeInsets.only(right: 8.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          border: Border.all(color: sand),
                          boxShadow: [
                            BoxShadow(
                              color: ink.withOpacity(0.05),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                          image: DecorationImage(
                            image: AssetImage(categoriesImages[index]),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.r),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                ink.withOpacity(0.6),
                              ],
                            ),
                          ),
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4.w),
                              child: Text(
                                categoriesText[index],
                                textAlign: TextAlign.center,
                                style: TextStyle(fontFamily: 'Cinta', 
                                  color: Colors.white,
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              24.height,
              // Featured Section Header
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 17.w),
                child: Row(
                  children: [
                    Text(
                      'Featured',
                      style: GoogleFonts.montserrat(
                        fontSize: 20.sp,
                        color: ink,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      child: Text(
                        'View All',
                        style: GoogleFonts.montserrat(
                          fontSize: 12.sp,
                          color: primary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    4.width,
                    const Icon(Icons.arrow_forward_ios, color: primary, size: 10),
                  ],
                ),
              ),
              14.height,
              // Featured Grid
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 17.w),
                child: MasonryGridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  mainAxisSpacing: 8.w,
                  crossAxisSpacing: 8.w,
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    // Simulating staggered heights
                    double imageHeight = index.isEven ? 180.h : 220.h;
                    
                    return GestureDetector(
                      onDoubleTap: () {
                        print('DEBUG: Double-tapped card at index $index');
                        showMessage(context, 'Added to Favorites!');
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
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12.r),
                              child: Image.asset(
                                images[index],
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: imageHeight,
                              ),
                            ),
                            12.height,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    'Lace Asoebi',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(fontFamily: 'Cinta', 
                                      fontSize: 14.sp,
                                      color: ink,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    print('DEBUG: Single-tapped favorite icon at index $index');
                                    showMessage(context, 'Added to Favorites!');
                                  },
                                  child: Image.asset(
                                    favoriteIcon,
                                    height: 18.h,
                                    width: 18.w,
                                    color: primary,
                                  ),
                                ),
                              ],
                            ),
                            6.height,
                            Row(
                              children: [
                                RatingBar.builder(
                                  initialRating: 4.5,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemSize: 12.sp,
                                  itemPadding: EdgeInsets.only(right: 2.w),
                                  itemBuilder: (context, _) => const Icon(
                                    Icons.star_rounded,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (rating) {},
                                ),
                                4.width,
                                Text(
                                  '(13)',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w700,
                                    color: textLight,
                                  ),
                                ),
                              ],
                            ),
                            8.height,
                            Text(
                              'NGN 45,000',
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
              100.height, // Space for floating nav bar
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuickAccessItem(BuildContext context, String title, String asset, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 120.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: white,
          border: Border.all(color: sand),
          boxShadow: [
            BoxShadow(
              color: ink.withOpacity(0.01),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              asset,
              height: 40.h,
              width: 40.h,
              fit: BoxFit.contain,
              color: primary,
            ),
            12.height,
            Text(
              title,
              style: TextStyle(fontFamily: 'Cinta', 
                fontSize: 13.sp,
                color: ink,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDrawer(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(color: cream),
        child: Column(
          children: [
            40.height,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(4.w),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: primary.withOpacity(0.5), width: 2),
                    ),
                    child: CircleAvatar(
                      radius: 35.r,
                      backgroundColor: white,
                      backgroundImage: const AssetImage(defaultUserImage),
                    ),
                  ),
                  20.width,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'You',
                        style: TextStyle(fontFamily: 'Cinta', 
                          color: ink,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      4.height,
                      InkWell(
                        onTap: () => const EditProfile().launch(context),
                        child: Text(
                          'UPDATE PROFILE',
                          style: GoogleFonts.montserrat(
                            color: primary,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            30.height,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Divider(color: sand, thickness: 1),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
                children: [
                  _buildDrawerItem(context, 'Home', () {
                    currentIndex = 0;
                    const Nav().launch(context, isNewTask: true);
                  }),
                  _buildDrawerItem(context, 'Catalogue', () {
                    currentIndex = 1;
                    const Nav().launch(context, isNewTask: true);
                  }),
                  _buildDrawerItem(context, 'Account', () {
                    currentIndex = 2;
                    const Nav().launch(context, isNewTask: true);
                  }),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    child: Divider(color: sand, thickness: 1),
                  ),
                  _buildDrawerItem(context, 'My Invoices', () => const TransactionHistory().launch(context)),
                  _buildDrawerItem(context, 'My Orders', () => const SavedOrderPage().launch(context)),
                  _buildDrawerItem(context, 'Saved', () => const SavedItemsPage().launch(context)),
                  _buildDrawerItem(context, 'Chat', () {}),
                  _buildDrawerItem(context, 'Wallet', () => const WalletPage().launch(context)),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    child: Divider(color: sand, thickness: 1),
                  ),
                  _buildDrawerItem(context, 'Become a vendor', () => VendorPage().launch(context)),
                  _buildDrawerItem(context, 'Share & Earn', () => const ShareEarnPage().launch(context)),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    child: Divider(color: sand, thickness: 1),
                  ),
                  _buildDrawerItem(context, 'Settings', () => const SettingsPage().launch(context)),
                  _buildDrawerItem(context, 'Support', () {
                    currentIndex = 2;
                    const Nav().launch(context, isNewTask: true);
                  }),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    child: Divider(color: sand, thickness: 1),
                  ),
                  _buildDrawerItem(context, 'Logout', () {
                    setValue('home', false);
                    LoginScreen().launch(context, isNewTask: true);
                  }),
                  40.height,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(BuildContext context, String title, VoidCallback onTap) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Container(
              width: 10.w,
              height: 10.h,
              decoration: BoxDecoration(
                color: sand.withOpacity(0.8),
                shape: BoxShape.circle,
              ),
            ),
            20.width,
            Text(
              title,
              style: TextStyle(fontFamily: 'Cinta', 
                fontSize: 16.sp,
                color: ink,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildNotificationDrawer(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(color: cream),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            60.height,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Text(
                'Notifications',
                style: GoogleFonts.montserrat(
                  fontSize: 24.sp,
                  color: primary,
                  fontWeight: FontWeight.w900,
                  letterSpacing: -1.0,
                ),
              ),
            ),
            20.height,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Divider(color: sand, thickness: 1),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
                children: [
                  _buildNotificationItem(
                    'Order Confirmed',
                    'Your Aso-ebi order #4290 has been received.',
                    '2m ago',
                    FeatherIcons.checkCircle,
                  ),
                  _buildNotificationItem(
                    'Promotion',
                    'Get 20% off on all Ankara materials this weekend!',
                    '1h ago',
                    FeatherIcons.tag,
                  ),
                  _buildNotificationItem(
                    'Update',
                    'Your measurements have been successfully updated.',
                    '5h ago',
                    FeatherIcons.user,
                  ),
                  _buildNotificationItem(
                    'Payment Successful',
                    'Wallet top-up of NGN 50,000 successful.',
                    'Yesterday',
                    FeatherIcons.creditCard,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationItem(String title, String sub, String time, IconData icon) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              color: white,
              shape: BoxShape.circle,
              border: Border.all(color: sand),
            ),
            child: Icon(icon, color: primary, size: 20.sp),
          ),
          16.width,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: TextStyle(fontFamily: 'Cinta', 
                          fontSize: 14.sp,
                          color: ink,
                          fontWeight: FontWeight.w700,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    8.width,
                    Text(
                      time,
                      style: GoogleFonts.montserrat(
                        fontSize: 10.sp,
                        color: textLight,
                      ),
                    ),
                  ],
                ),
                4.height,
                Text(
                  sub,
                  style: TextStyle(fontFamily: 'Cinta', 
                    fontSize: 12.sp,
                    color: textLight,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
