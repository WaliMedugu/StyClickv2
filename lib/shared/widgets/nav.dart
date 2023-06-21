import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:stylclick/modules/account.dart';
import 'package:stylclick/modules/catalogue/catalogue.dart';
import 'package:stylclick/modules/home.dart';
import 'package:stylclick/shared/constants/images.dart';
import 'package:stylclick/shared/utils/helpers.dart';

class Nav extends StatefulWidget {
  const Nav({Key? key}) : super(key: key);

  @override
  _NavState createState() => _NavState();
}

int _currentIndex = 0;
List<Widget> _children = [];

final tabs = [const HomePage(), const CataloguePage(), const AccountPage()];

class _NavState extends State<Nav> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 48.0),
        child: FloatingActionButton(
          onPressed: () {
            setState(() {
              _currentIndex = 0;
            });
          },
          backgroundColor: const Color(0xff7d8083),
          child: const Icon(
            Icons.home,
            color: white,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Stack(
        children: [
          tabs[_currentIndex],
          Positioned(
            left: 0,
            right: 0,
            bottom: 4,
            child: Container(
              color: const Color(0xff4f5052),
              height: 64.h,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 24.0,right: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                        onTap: () {
                          setState(() {
                            _currentIndex = 1;
                          });
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              catalogue,
                              height: 24.h,
                              width: 24.w,
                              color: _currentIndex == 1
                                  ? const Color(0xffff7755)
                                  : const Color(0xffffffff),
                            ),
                            4.height,
                            Center(
                              child: Text(
                                'Catalogue',
                                style: TextStyle(
                                    color: _currentIndex == 1
                                        ? const Color(0xffff7755)
                                        : Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500
                                ),
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        )),
                    Padding(
                      padding: const EdgeInsets.only(top: 24.0),
                      child: Text(
                        'Home',
                        style: TextStyle(
                            color: _currentIndex == 0
                                ? const Color(0xffff7755)
                                : Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    InkWell(
                        onTap: () {
                          setState(() {
                            _currentIndex = 2;
                          });
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,

                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              account,
                              height: 24.h,
                              width: 24.w,
                              color: _currentIndex == 2
                                  ? const Color(0xffff7755)
                                  : Colors.white,
                            ),
                            4.height,
                            Center(
                              child: Text(
                                'Account',
                                style: TextStyle(
                                  color: _currentIndex == 2
                                      ? const Color(0xffff7755)
                                      : Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500
                                ),
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        )),
                  ],
                ),
              ),
            )
                .cornerRadiusWithClipRRect(30)
                .paddingOnly(left: 17, right: 17, bottom: 8),
          )
        ],
      ),
    );
  }

  void tabItem(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
