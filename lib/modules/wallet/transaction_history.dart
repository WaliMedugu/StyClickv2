import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:stylclick/shared/constants/colors.dart';
import 'package:stylclick/shared/constants/images.dart';
import 'package:stylclick/modules/settings.dart';
import 'package:stylclick/modules/share_earn.dart';
import 'package:stylclick/modules/order/saved_order.dart';
import 'package:stylclick/modules/order/saved_items.dart';
import 'package:stylclick/modules/wallet/wallet.dart';
import 'package:stylclick/shared/widgets/nav.dart';

class TransactionHistory extends StatefulWidget {
  const TransactionHistory({Key? key}) : super(key: key);

  @override
  State<TransactionHistory> createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State<TransactionHistory> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController _searchController = TextEditingController();
  String _searchQuery = "";
  String _filterType = "All"; // All, Credits, Debits

  final List<Map<String, dynamic>> _allTransactions = [
    {'title': 'Wallet Funding', 'subtitle': 'via Bank Transfer', 'time': 'Apr 28, 09:23 AM', 'amount': '+ NGN 20,000', 'isCredit': true, 'status': 'Successful'},
    {'title': 'Aso-ebi Payment', 'subtitle': 'Order #4290', 'time': 'Apr 27, 02:15 PM', 'amount': '- NGN 15,500', 'isCredit': false, 'status': 'Successful'},
    {'title': 'Fabric Purchase', 'subtitle': 'Order #4288', 'time': 'Apr 26, 11:40 AM', 'amount': '- NGN 45,000', 'isCredit': false, 'status': 'Successful'},
    {'title': 'Wallet Funding', 'subtitle': 'via Card', 'time': 'Apr 25, 08:10 PM', 'amount': '+ NGN 50,000', 'isCredit': true, 'status': 'Successful'},
    {'title': 'Tailor Deposit', 'subtitle': 'Order #4285', 'time': 'Apr 24, 01:05 PM', 'amount': '- NGN 10,000', 'isCredit': false, 'status': 'Successful'},
    {'title': 'Wallet Funding', 'subtitle': 'via Transfer', 'time': 'Apr 23, 10:30 AM', 'amount': '+ NGN 5,000', 'isCredit': true, 'status': 'Successful'},
    {'title': 'Logistics Fee', 'subtitle': 'Order #4280', 'time': 'Apr 22, 04:50 PM', 'amount': '- NGN 2,500', 'isCredit': false, 'status': 'Successful'},
    {'title': 'Refund', 'subtitle': 'Order #4275', 'time': 'Apr 21, 12:00 PM', 'amount': '+ NGN 12,000', 'isCredit': true, 'status': 'Successful'},
  ];

  List<Map<String, dynamic>> get _filteredTransactions {
    return _allTransactions.where((tx) {
      final matchesSearch = tx['title'].toLowerCase().contains(_searchQuery.toLowerCase()) ||
          tx['subtitle'].toLowerCase().contains(_searchQuery.toLowerCase());
      final matchesFilter = _filterType == "All" ||
          (_filterType == "Credits" && tx['isCredit']) ||
          (_filterType == "Debits" && !tx['isCredit']);
      return matchesSearch && matchesFilter;
    }).toList();
  }

  void _openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  void _openEndDrawer() {
    _scaffoldKey.currentState?.openEndDrawer();
  }

  void _showFilterModal() {
    showModalBottomSheet(
      context: context,
      backgroundColor: cream,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(32.r))),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Container(
              padding: EdgeInsets.all(24.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Filter by Type', style: GoogleFonts.montserrat(fontSize: 20.sp, fontWeight: FontWeight.w900, color: primary)),
                  20.height,
                  _buildFilterOption(setModalState, 'All'),
                  _buildFilterOption(setModalState, 'Credits'),
                  _buildFilterOption(setModalState, 'Debits'),
                  30.height,
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildFilterOption(StateSetter setModalState, String type) {
    bool isSelected = _filterType == type;
    return InkWell(
      onTap: () {
        setState(() => _filterType = type);
        setModalState(() {});
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.h),
        child: Row(
          children: [
            Text(type, style: TextStyle(fontFamily: 'Cinta', fontSize: 16.sp, color: isSelected ? primary : ink, fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500)),
            const Spacer(),
            if (isSelected) Icon(Icons.check_circle_rounded, color: primary, size: 20.sp),
          ],
        ),
      ),
    );
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
                    'My Invoices',
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
                          hintText: 'Search invoices...',
                          hintStyle: TextStyle(fontFamily: 'Cinta', color: ink.withOpacity(0.3)),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: _showFilterModal,
                      child: Icon(FeatherIcons.sliders, color: _filterType == "All" ? primary : successColor, size: 18.sp),
                    ),
                  ],
                ),
              ),
            ),
            24.height,
            // Section Title
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 17.w),
              child: Row(
                children: [
                  Text(
                    'RECENT TRANSACTIONS',
                    style: GoogleFonts.montserrat(
                      fontSize: 12.sp,
                      color: textLight,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.5,
                    ),
                  ),
                  const Spacer(),
                  if (_filterType != "All")
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                      decoration: BoxDecoration(color: primary.withOpacity(0.1), borderRadius: BorderRadius.circular(4.r)),
                      child: Text(_filterType, style: GoogleFonts.montserrat(fontSize: 9.sp, color: primary, fontWeight: FontWeight.w700)),
                    ),
                ],
              ),
            ),
            16.height,
            // Transaction List
            Expanded(
              child: _filteredTransactions.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(FeatherIcons.fileText, size: 48.sp, color: sand),
                          16.height,
                          Text('No results found', style: TextStyle(fontFamily: 'Cinta', fontSize: 16.sp, color: textLight)),
                        ],
                      ),
                    )
                  : ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 17.w),
                      itemCount: _filteredTransactions.length,
                      itemBuilder: (context, index) {
                        final tx = _filteredTransactions[index];
                        return _buildTransactionItem(
                          title: tx['title'],
                          subtitle: tx['subtitle'],
                          time: tx['time'],
                          amount: tx['amount'],
                          isCredit: tx['isCredit'],
                          status: tx['status'],
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionItem({
    required String title,
    required String subtitle,
    required String time,
    required String amount,
    required bool isCredit,
    required String status,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(16.w),
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
        children: [
          Container(
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              color: isCredit ? const Color(0xffe8ffed) : const Color(0xfffff3e8),
              shape: BoxShape.circle,
            ),
            child: Icon(
              isCredit ? FeatherIcons.arrowDownLeft : FeatherIcons.arrowUpRight,
              color: isCredit ? successColor : primary,
              size: 20.sp,
            ),
          ),
          16.width,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontFamily: 'Cinta', 
                    fontSize: 14.sp,
                    color: ink,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                4.height,
                Text(
                  subtitle,
                  style: TextStyle(fontFamily: 'Cinta', 
                    fontSize: 12.sp,
                    color: textLight,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                amount,
                style: GoogleFonts.montserrat(
                  fontSize: 14.sp,
                  color: isCredit ? successColor : ink,
                  fontWeight: FontWeight.w700,
                ),
              ),
              4.height,
              Text(
                time,
                style: GoogleFonts.montserrat(
                  fontSize: 9.sp,
                  color: textLight.withOpacity(0.5),
                ),
              ),
            ],
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
                    // LoginScreen().launch(context, isNewTask: true);
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
