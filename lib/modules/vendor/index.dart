import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:stylclick/modules/vendor/become_rider.dart';
import 'package:stylclick/modules/vendor/become_vendor.dart';
import 'package:stylclick/modules/vendor/become_seller.dart';
import 'package:stylclick/modules/order/saved_order.dart';
import 'package:stylclick/modules/order/saved_items.dart';
import 'package:stylclick/modules/wallet/transaction_history.dart';
import 'package:stylclick/modules/wallet/wallet.dart';
import 'package:stylclick/shared/constants/colors.dart';
import 'package:stylclick/shared/constants/images.dart';
import 'package:stylclick/modules/settings.dart';
import 'package:stylclick/modules/share_earn.dart';
import 'package:stylclick/shared/widgets/nav.dart';
import 'package:stylclick/modules/auth/login.dart';

class VendorPage extends StatefulWidget {
  const VendorPage({Key? key}) : super(key: key);

  @override
  State<VendorPage> createState() => _VendorPageState();
}

class _VendorPageState extends State<VendorPage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
                      'Partnership',
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
              32.height,
              // Welcome Text
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 17.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Grow with Styclick',
                      style: TextStyle(fontFamily: 'Cinta', 
                        fontSize: 32.sp,
                        color: ink,
                        fontWeight: FontWeight.w700,
                        height: 1.1,
                      ),
                    ),
                    12.height,
                    Text(
                      'Join our curated ecosystem of creators, suppliers, and logistics experts. Select your path below.',
                      style: TextStyle(fontFamily: 'Cinta', 
                        fontSize: 15.sp,
                        color: textLight,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              40.height,
              // Options
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 17.w),
                child: Column(
                  children: [
                    _buildPartnerCard(
                      title: 'Fashion Designer',
                      desc: 'Showcase your craftsmanship to a global audience.',
                      image: 'assets/images/userRoles/fashionDesigner.png',
                      onTap: () => const BecomeVendor().launch(context),
                    ),
                    24.height,
                    _buildPartnerCard(
                      title: 'Fabrics Seller',
                      desc: 'Supply premium materials to top designers.',
                      image: 'assets/images/userRoles/fashionSeller.png',
                      onTap: () => const BecomeSeller().launch(context),
                    ),
                    24.height,
                    _buildPartnerCard(
                      title: 'Dispatch Rider',
                      desc: 'Be the bridge between fashion and the customer.',
                      image: 'assets/images/userRoles/dispatchRider.png',
                      onTap: () => const BecomeRider().launch(context),
                    ),
                    40.height,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPartnerCard({required String title, required String desc, required String image, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(24.r),
          border: Border.all(color: sand),
          boxShadow: [
            BoxShadow(
              color: ink.withOpacity(0.03),
              blurRadius: 15,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
              child: Image.asset(
                image,
                height: 160.h,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(24.w),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(fontFamily: 'Cinta', 
                            fontSize: 20.sp,
                            color: ink,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        4.height,
                        Text(
                          desc,
                          style: TextStyle(fontFamily: 'Cinta', 
                            fontSize: 13.sp,
                            color: textLight,
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                  16.width,
                  Container(
                    padding: EdgeInsets.all(10.w),
                    decoration: BoxDecoration(
                      color: primary.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(FeatherIcons.arrowRight, color: primary, size: 18.sp),
                  ),
                ],
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
            60.height,
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
                      Text(
                        'DASHBOARD',
                        style: GoogleFonts.montserrat(
                          color: primary,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.2,
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
                  _buildDrawerItem(context, 'Become a vendor', () => const VendorPage().launch(context)),
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
                  _buildNotificationItem('Order Confirmed', 'Your Aso-ebi order #4290 has been received.', '2m ago', FeatherIcons.checkCircle),
                  _buildNotificationItem('Promotion', 'Get 20% off on all Ankara materials this weekend!', '1h ago', FeatherIcons.tag),
                  _buildNotificationItem('Update', 'Your measurements have been successfully updated.', '5h ago', FeatherIcons.user),
                  _buildNotificationItem('Payment Successful', 'Wallet top-up of NGN 50,000 successful.', 'Yesterday', FeatherIcons.creditCard),
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
                        style: TextStyle(fontFamily: 'Cinta', fontSize: 14.sp, color: ink, fontWeight: FontWeight.w700),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    8.width,
                    Text(time, style: GoogleFonts.montserrat(fontSize: 10.sp, color: textLight)),
                  ],
                ),
                4.height,
                Text(sub, style: TextStyle(fontFamily: 'Cinta', fontSize: 12.sp, color: textLight)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
