import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:stylclick/shared/constants/colors.dart';
import 'package:stylclick/shared/constants/images.dart';
import 'package:stylclick/shared/constants/strings.dart';
import 'package:stylclick/shared/utils/helpers.dart';
import 'package:stylclick/shared/widgets/custom_textfield.dart';

class SavedOrderPage extends StatefulWidget {
  const SavedOrderPage({Key? key}) : super(key: key);

  @override
  State<SavedOrderPage> createState() => _SavedOrderPageState();
}

class _SavedOrderPageState extends State<SavedOrderPage> {
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
    return Scaffold(
      backgroundColor: homeBgColor,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          height: 100.h,
          decoration: BoxDecoration(gradient: gradient),
          child: Padding(
            padding: EdgeInsets.only(left: 17.0.w, right: 17.w),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    pop();
                  },
                  child: Image.asset(
                    backIcon,
                    width: 24.w,
                    color: white,
                  ),
                ),
                8.width,
                Text(
                  'Saved',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                Container(
                  height: logicalHeight() * 0.07,
                  margin: const EdgeInsets.only(bottom: 20 * 2.5),
                  decoration: BoxDecoration(gradient: gradient),
                ),
                Positioned(
                  top: 25,
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
              ],
            ),
            SizedBox(
              height: logicalHeight(),
              child: Padding(
                padding: EdgeInsets.only(left: 17.0.w, right: 17.w),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 8,
                      childAspectRatio: 9 / 14),
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      width: context.width() * 0.4,
                      height: 200,
                      decoration: const BoxDecoration(
                        // borderRadius: BorderRadius.circular(8),
                        color: homeBgColor,
                      ),
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.start,
                        children: [
                          Image.asset(
                            maleAsoebi,
                            fit: BoxFit.cover,
                            height: 184.h,
                            width: 184.w,
                          ),
                          8.height,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              8.height,
                              Text(
                                'Gloss Ankara',
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  color: storeNameColor,
                                  fontFamily: cinta,
                                  fontWeight: FontWeight.w700,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              4.height,
                              Text(
                                'NGN 100000',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontFamily: cinta,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              4.height,
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
}
