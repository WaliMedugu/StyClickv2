import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:stylclick/shared/widgets/snack_bar.dart';
import 'package:stylclick/modules/auth/login.dart';
import 'package:stylclick/modules/wallet/wallet.dart';
import 'package:stylclick/modules/wallet/transaction_history.dart';
import 'package:stylclick/modules/account.dart';
import 'package:stylclick/modules/edit_profile.dart';
import 'package:stylclick/modules/order/saved_order.dart';
import 'package:stylclick/modules/order/saved_items.dart';
import 'package:stylclick/modules/vendor/index.dart';
import 'package:stylclick/shared/widgets/nav.dart';
import 'package:stylclick/shared/constants/colors.dart';
import 'package:stylclick/shared/constants/images.dart';
import 'package:stylclick/modules/settings.dart';
import 'package:stylclick/modules/share_earn.dart';
import 'package:stylclick/shared/constants/strings.dart';
import 'package:stylclick/shared/utils/helpers.dart';
import 'package:stylclick/shared/widgets/custom_textfield.dart';

class CataloguePage extends StatefulWidget {
  const CataloguePage({Key? key}) : super(key: key);

  @override
  State<CataloguePage> createState() => _CataloguePageState();
}

class _CataloguePageState extends State<CataloguePage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  void _openEndDrawer() {
    _scaffoldKey.currentState?.openEndDrawer();
  }
  Gradient gradient = const LinearGradient(
    colors: [
      Color(0xFFEA4262),
      Color(0xFFDD6140),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  final List<String> images = [
    catFemaleAsoEbi,
    catMaleAsoEbi,
    catAnkara,
    catReadyToWear,
    catMaterials,
    catSenator,
    catLace,
    catFemaleAsoEbi,
    catMaleAsoEbi,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: buildDrawer(context),
      endDrawer: buildNotificationDrawer(context),
      backgroundColor: cream,
      body: SafeArea(
        child: Column(
          children: [
            16.height,
            // Header
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 17.w),
              child: Row(
                children: [
                  InkWell(
                    onTap: _openDrawer,
                    child: Image.asset(
                      menuIcon,
                      height: 24.h,
                      width: 24.w,
                      color: ink,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'Catalogue',
                    style: GoogleFonts.montserrat(
                      fontSize: 26.sp,
                      color: primary,
                      fontWeight: FontWeight.w900,
                      letterSpacing: -1.0,
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: _openEndDrawer,
                    child: Image.asset(
                      notificationIcon,
                      height: 24.h,
                      width: 24.w,
                      color: ink,
                    ),
                  ),
                ],
              ),
            ),
            24.height,
            // Search & Filter
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 17.w),
              child: Row(
                children: [
                  Expanded(
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
                                hintText: 'Search styles...',
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
                  12.width,
                  InkWell(
                    onTap: () => filterCategories(context),
                    child: Container(
                      height: 52.h,
                      width: 52.h,
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(color: sand),
                      ),
                      child: Icon(Icons.tune, color: primary, size: 24.sp),
                    ),
                  ),
                ],
              ),
            ),
            24.height,
            // Staggered Grid
            Expanded(
              child: MasonryGridView.count(
                padding: EdgeInsets.symmetric(horizontal: 17.w),
                crossAxisCount: 2,
                mainAxisSpacing: 8.w,
                crossAxisSpacing: 8.w,
                itemCount: images.length,
                itemBuilder: (context, index) {
                  double imageHeight = index.isEven ? 200.h : 260.h;
                  
                  return GestureDetector(
                    onDoubleTap: () {
                      print('DEBUG: Double-tapped catalogue item at index $index');
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
                                  index % 2 == 0 ? 'Lace Asoebi' : 'Ankara Style',
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
                                  print('DEBUG: Tapped favorite in catalogue at index $index');
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
                              Icon(Icons.star_rounded, color: Colors.amber, size: 14.sp),
                              2.width,
                              Text(
                                '4.8',
                                style: GoogleFonts.montserrat(
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w700,
                                  color: ink,
                                ),
                              ),
                              4.width,
                              Text(
                                '(13)',
                                style: GoogleFonts.montserrat(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w500,
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
          ],
        ),
      ),
    );
  }

  List<String> selectedCategories = [];
  final List<String> categories = [
    'Ankara Styles',
    'Lace Asoebi',
    'Senator & Kaftans',
    'Corporate Suits',
    'Wedding Gowns',
    'Agbada Sets',
    'Casual Wears',
    'Kids Collection',
    'Bespoke Wears'
  ];

  filterCategories(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Container(
              height: logicalHeight() * 0.75,
              decoration: BoxDecoration(
                color: cream,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32.r),
                  topRight: Radius.circular(32.r),
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Handle
                  Center(
                    child: Container(
                      width: 40.w,
                      height: 4.h,
                      decoration: BoxDecoration(
                        color: sand,
                        borderRadius: BorderRadius.circular(2.r),
                      ),
                    ),
                  ),
                  24.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Filter Selection',
                        style: GoogleFonts.montserrat(
                          fontSize: 24.sp,
                          color: primary,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          setModalState(() {
                            selectedCategories.clear();
                          });
                        },
                        child: Text(
                          'CLEAR',
                          style: GoogleFonts.montserrat(
                            fontSize: 12.sp,
                            color: textLight,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ),
                    ],
                  ),
                  12.height,
                  Text(
                    'Select categories to personalize your feed',
                    style: TextStyle(fontFamily: 'Cinta', 
                      fontSize: 14.sp,
                      color: textLight,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  32.height,
                  Text(
                    'CATEGORIES',
                    style: GoogleFonts.montserrat(
                      fontSize: 12.sp,
                      color: ink,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.5,
                    ),
                  ),
                  16.height,
                  Expanded(
                    child: SingleChildScrollView(
                      child: Wrap(
                        spacing: 12.w,
                        runSpacing: 12.h,
                        children: categories.map((category) {
                          bool isSelected = selectedCategories.contains(category);
                          return InkWell(
                            onTap: () {
                              setModalState(() {
                                if (isSelected) {
                                  selectedCategories.remove(category);
                                } else {
                                  selectedCategories.add(category);
                                }
                              });
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                              decoration: BoxDecoration(
                                color: isSelected ? primary : white,
                                borderRadius: BorderRadius.circular(12.r),
                                border: Border.all(
                                  color: isSelected ? primary : sand,
                                ),
                                boxShadow: isSelected
                                    ? [
                                        BoxShadow(
                                          color: primary.withOpacity(0.2),
                                          blurRadius: 8,
                                          offset: const Offset(0, 4),
                                        )
                                      ]
                                    : [],
                              ),
                              child: Text(
                                category,
                                style: TextStyle(fontFamily: 'Cinta', 
                                  fontSize: 13.sp,
                                  color: isSelected ? white : ink,
                                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  24.height,
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      height: 56.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        gradient: const LinearGradient(
                          colors: [primary, primaryGradient],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: primary.withOpacity(0.1),
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          'Apply Filter',
                          style: GoogleFonts.montserrat(
                            color: white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1.1,
                          ),
                        ),
                      ),
                    ),
                  ),
                  10.height,
                ],
              ),
            );
          },
        );
      },
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
