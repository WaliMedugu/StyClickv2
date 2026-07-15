import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stylclick/modules/edit_profile.dart';
import 'package:stylclick/modules/order/saved_order.dart';
import 'package:stylclick/modules/order/saved_items.dart';
import 'package:stylclick/modules/auth/login.dart';
import 'package:stylclick/modules/wallet/transaction_history.dart';
import 'package:stylclick/modules/vendor/index.dart';
import 'package:stylclick/modules/wallet/wallet.dart';
import 'package:stylclick/shared/widgets/nav.dart';
import 'package:stylclick/shared/constants/colors.dart';
import 'package:stylclick/shared/constants/images.dart';
import 'package:stylclick/modules/settings.dart';
import 'package:stylclick/modules/share_earn.dart';
import 'package:stylclick/shared/constants/strings.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:stylclick/shared/utils/helpers.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  void _openEndDrawer() {
    _scaffoldKey.currentState?.openEndDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: buildDrawer(context),
      endDrawer: buildNotificationDrawer(context),
      backgroundColor: cream, // Pure white
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Header (Original Navigation Trigger & Brand Title)
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 16.h),
                decoration: const BoxDecoration(gradient: brandGradient),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    Text(
                      'StyClick',
                      style: TextStyle(
                        fontFamily: 'Cinta',
                        fontSize: 22.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -1.0,
                      ),
                    ),
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
              8.height,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 17.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Welcome Profile Row (From Original Screen)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${getStringAsync('fName', defaultValue: 'Mayokun')}\n${getStringAsync('lName', defaultValue: 'Adeoti')}',
                      style: TextStyle(
                        fontFamily: 'Cinta',
                        color: ink,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Container(
                      height: 56.h,
                      width: 56.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: sand, width: 1),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30.r),
                        child: Image.asset(
                          defaultUserImage,
                          height: 56.h,
                          width: 56.w,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                8.height,
                // Star Rating Container (From Original Screen)
                Container(
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(22.r),
                    border: Border.all(color: sand),
                  ),
                  height: 24.h,
                  width: 56.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 12.sp,
                      ),
                      4.width,
                      Text(
                        '4.8',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: cinta,
                          color: ink,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                24.height,
                // 3 Quick Action Cards Row (From Original Screen - Clean white cards with NO background images!)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildQuickActionCard(
                      'Help',
                      helpIcon,
                      () {},
                    ),
                    _buildQuickActionCard(
                      'Wallet',
                      wallet,
                      () => const WalletPage().launch(context),
                    ),
                    _buildQuickActionCard(
                      'Activity',
                      activity,
                      () => const TransactionHistory().launch(context),
                    ),
                  ],
                ),
                24.height,
                // Divider Line
                Container(
                  height: 1.h,
                  width: double.infinity,
                  color: sand,
                ),
                16.height,
                // Menu List Items with original icons (From Original Screen)
                _buildMenuItem(context, 'My Orders', orders, () => const SavedOrderPage().launch(context)),
                _buildMenuItem(context, 'Saved Items', savedIcon, () => const SavedItemsPage().launch(context)),
                _buildMenuItem(context, 'Chats', chats, () {}),
                _buildMenuItem(context, 'Become a Vendor', becomeVendor, () => VendorPage().launch(context)),
                _buildMenuItem(context, 'Share and Earn', shareEarn, () => const ShareEarnPage().launch(context)),
                _buildMenuItem(context, 'Settings', settings, () => const SettingsPage().launch(context)),
                _buildMenuItem(context, 'Supports', support, () {}),
                _buildMenuItem(context, 'Logout', logoutIcon, () {
                  setValue('home', false);
                  LoginScreen().launch(context, isNewTask: true);
                }),
                120.height,
              ],
            ),
          ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuickActionCard(String title, String iconAsset, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 100.h,
        width: 100.w,
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: sand),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              iconAsset,
              height: 32.h,
              width: 32.w,
              color: primary,
            ),
            12.height,
            Text(
              title,
              style: GoogleFonts.montserrat(
                fontSize: 14.sp,
                color: ink,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, String title, String iconAsset, VoidCallback onTap) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 14.h),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Image.asset(
              iconAsset,
              height: 24.h,
              width: 24.w,
              color: ink,
            ),
            16.width,
            Text(
              title,
              style: TextStyle(
                fontFamily: cinta,
                fontSize: 16.sp,
                color: ink,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            Icon(Icons.arrow_forward_ios, color: sand, size: 14.sp),
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
                        '${getStringAsync('fName', defaultValue: 'Mayokun')} ${getStringAsync('lName', defaultValue: 'Adeoti')}',
                        style: TextStyle(
                          fontFamily: 'Cinta',
                          color: ink,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      4.height,
                      InkWell(
                        onTap: () => const EditProfile().launch(context),
                        child: Text(
                          'Update Profile',
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
                  _buildDrawerItem(context, 'Become a Vendor', () => VendorPage().launch(context)),
                  _buildDrawerItem(context, 'Share & Earn', () => const ShareEarnPage().launch(context)),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    child: Divider(color: sand, thickness: 1),
                  ),
                  _buildDrawerItem(context, 'Settings', () => const SettingsPage().launch(context)),
                  _buildDrawerItem(context, 'Help & Support', () {
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
              style: TextStyle(
                fontFamily: cinta,
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
                style: TextStyle(
                  fontFamily: 'Cinta',
                  fontSize: 24.sp,
                  color: primary,
                  fontWeight: FontWeight.w700,
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
                        style: TextStyle(
                          fontFamily: cinta,
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
                  style: TextStyle(
                    fontFamily: cinta,
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
