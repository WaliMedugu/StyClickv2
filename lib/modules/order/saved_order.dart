import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:stylclick/shared/constants/colors.dart';
import 'package:stylclick/shared/constants/images.dart';
import 'package:stylclick/modules/settings.dart';
import 'package:stylclick/modules/share_earn.dart';
import 'package:stylclick/shared/widgets/nav.dart';
import 'package:stylclick/modules/order/saved_items.dart';
import 'package:stylclick/modules/wallet/transaction_history.dart';
import 'package:stylclick/modules/wallet/wallet.dart';
import 'package:stylclick/modules/vendor/index.dart';
import 'package:stylclick/modules/auth/login.dart';

class SavedOrderPage extends StatefulWidget {
  const SavedOrderPage({Key? key}) : super(key: key);

  @override
  State<SavedOrderPage> createState() => _SavedOrderPageState();
}

class _SavedOrderPageState extends State<SavedOrderPage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController _searchController = TextEditingController();
  String _searchQuery = "";

  final List<Map<String, dynamic>> _allOrders = [
    {
      'id': '#SC-4290',
      'title': 'Premium Swiss Ankara',
      'price': 'NGN 120,000',
      'date': '28 Apr 2024',
      'status': 'Processing',
      'image': maleAsoebi,
      'items': '4 Items'
    },
    {
      'id': '#SC-4285',
      'title': 'Lace Asoebi Set',
      'price': 'NGN 85,000',
      'date': '25 Apr 2024',
      'status': 'Delivered',
      'image': maleAsoebi,
      'items': '2 Items'
    },
    {
      'id': '#SC-4280',
      'title': 'Senator Style - Navy',
      'price': 'NGN 45,000',
      'date': '20 Apr 2024',
      'status': 'Delivered',
      'image': maleAsoebi,
      'items': '1 Item'
    },
    {
      'id': '#SC-4275',
      'title': 'Corporate Suit Bundle',
      'price': 'NGN 210,000',
      'date': '15 Apr 2024',
      'status': 'Cancelled',
      'image': maleAsoebi,
      'items': '3 Items'
    },
    {
      'id': '#SC-4268',
      'title': 'Agbada Embroidery',
      'price': 'NGN 150,000',
      'date': '10 Apr 2024',
      'status': 'Delivered',
      'image': maleAsoebi,
      'items': '2 Items'
    },
  ];

  List<Map<String, dynamic>> get _filteredOrders {
    if (_searchQuery.isEmpty) return _allOrders;
    return _allOrders.where((order) {
      return order['title'].toLowerCase().contains(_searchQuery.toLowerCase()) ||
          order['id'].toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();
  }

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
                    'Order History',
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
            // Search Bar
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 17.w),
              child: Container(
                height: 52.h,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(color: sand),
                ),
                child: Row(
                  children: [
                    Icon(FeatherIcons.search, color: sand, size: 20.sp),
                    12.width,
                    Expanded(
                      child: TextField(
                        controller: _searchController,
                        onChanged: (value) => setState(() => _searchQuery = value),
                        style: TextStyle(fontFamily: 'Cinta', fontSize: 14.sp, color: ink),
                        decoration: InputDecoration(
                          hintText: 'Search by ID or product...',
                          hintStyle: TextStyle(fontFamily: 'Cinta', color: ink.withOpacity(0.3)),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            24.height,
            // List Header
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 17.w),
              child: Text(
                'YOUR TRANSACTIONS',
                style: GoogleFonts.montserrat(
                  fontSize: 12.sp,
                  color: textLight,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.5,
                ),
              ),
            ),
            16.height,
            // History List
            Expanded(
              child: _filteredOrders.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(FeatherIcons.package, size: 48.sp, color: sand),
                          16.height,
                          Text('No orders found', style: TextStyle(fontFamily: 'Cinta', fontSize: 16.sp, color: textLight)),
                        ],
                      ),
                    )
                  : ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 17.w),
                      itemCount: _filteredOrders.length,
                      itemBuilder: (context, index) {
                        return _buildHistoryTile(_filteredOrders[index]);
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHistoryTile(Map<String, dynamic> order) {
    Color statusColor;
    IconData statusIcon;

    switch (order['status']) {
      case 'Delivered':
        statusColor = successColor;
        statusIcon = FeatherIcons.checkCircle;
        break;
      case 'Processing':
        statusColor = primary;
        statusIcon = FeatherIcons.clock;
        break;
      case 'Cancelled':
        statusColor = textLight;
        statusIcon = FeatherIcons.xCircle;
        break;
      default:
        statusColor = primary;
        statusIcon = FeatherIcons.package;
    }

    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: sand),
        boxShadow: [
          BoxShadow(
            color: ink.withOpacity(0.01),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Order Image
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Image.asset(
              order['image'],
              height: 80.h,
              width: 80.w,
              fit: BoxFit.cover,
            ),
          ),
          16.width,
          // Order Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      order['id'],
                      style: GoogleFonts.montserrat(
                        fontSize: 11.sp,
                        color: primary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      order['date'],
                      style: GoogleFonts.montserrat(
                        fontSize: 10.sp,
                        color: textLight.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
                8.height,
                Text(
                  order['title'],
                  style: TextStyle(fontFamily: 'Cinta', 
                    fontSize: 15.sp,
                    color: ink,
                    fontWeight: FontWeight.w700,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                4.height,
                Text(
                  order['items'],
                  style: TextStyle(fontFamily: 'Cinta', 
                    fontSize: 12.sp,
                    color: textLight,
                  ),
                ),
                12.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      order['price'],
                      style: GoogleFonts.montserrat(
                        fontSize: 14.sp,
                        color: ink,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                      decoration: BoxDecoration(
                        color: statusColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(statusIcon, color: statusColor, size: 10.sp),
                          6.width,
                          Text(
                            order['status'],
                            style: GoogleFonts.montserrat(
                              color: statusColor,
                              fontSize: 9.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
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
                  _buildDrawerItem(context, 'Become a vendor', () {}),
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
