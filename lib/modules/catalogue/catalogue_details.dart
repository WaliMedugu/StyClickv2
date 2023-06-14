import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:stylclick/shared/constants/colors.dart';
import 'package:stylclick/shared/constants/images.dart';
import 'package:stylclick/shared/constants/strings.dart';
import 'package:stylclick/shared/utils/helpers.dart';
import 'package:stylclick/shared/widgets/custom_textfield.dart';

class CatalogueDetails extends StatelessWidget {
  final String? imageFile;
  final String? title;
  final String? storeName;

  CatalogueDetails({Key? key, this.imageFile, this.title, this.storeName})
      : super(key: key);

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
      // extendBodyBehindAppBar: true,
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
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    backIcon,
                    width: 24.w,
                    color: white,
                  ),
                ),
                8.width,
                Text(
                  'e-Catalogue',
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
      backgroundColor: homeBgColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SizedBox(
              height: logicalHeight(),
              width: logicalWidth(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 17.0, right: 17, top: 16),
              child: Container(
                height: 246.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: AssetImage(imageFile ?? ''),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    // color: Colors.black.withOpacity(0.5),
                    child: Text(
                      title ?? '',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontFamily: cinta,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: 280.0, left: 17.w, right: 17.w),
                child: SizedBox(
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: signinTextColor,
                        child: Image.asset(profileIcon),
                      ),
                      8.width,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            storeName ?? '',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
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
                      Spacer(),
                      InkWell(
                        onTap: () {
                          chatStylist(context);
                        },
                        child: CircleAvatar(
                          backgroundColor: signinTextColor,
                          child: Image.asset(
                            chatIcon,
                            height: 16,
                            width: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
            Positioned(
              top: 340,
              child: Padding(
                padding:  EdgeInsets.only(left:17.0.w),
                child: Text(
                  'Specialized Stylist',
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: cinta,
                      fontWeight: FontWeight.w700,
                      color: black),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 370),
              child: SizedBox(
                height: logicalHeight(),
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(left:17.0,right: 17,top: 8,bottom: 8),
                      child: SizedBox(
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: signinTextColor,
                              child: Image.asset(profileAvatar),
                            ),
                            8.width,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  storeName ?? '',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
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
                            Spacer(),
                            InkWell(
                              onTap: () {
                                chatStylist(context);
                              },
                              child: CircleAvatar(
                                backgroundColor: signinTextColor,
                                child: Image.asset(
                                  chatIcon,
                                  height: 16,
                                  width: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
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

  chatStylist(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.r), topRight: Radius.circular(25.r)),
        ),
        builder: (BuildContext context) {
          return Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Chat Stylist',
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  16.height,
                  CustomTextField(
                    label: 'Style Description',
                    labelColor: black,
                    hintTextColor: const Color.fromRGBO(0, 0, 0, 0.5),
                    hintText: 'blue green dress with a touch of red',
                    maxLines: 5,
                  ),
                  16.height,
                  Text(
                    'Upload Image',
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: black,
                        fontFamily: cinta,
                        fontWeight: FontWeight.w500),
                  ),8.height,
                  DottedBorder(
                    borderType: BorderType.RRect,
                    radius: Radius.circular(12),
                    dashPattern: [8, 4],
                    // padding: EdgeInsets.all(6),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      child: Container(
                        decoration: BoxDecoration(
                            color: uploadBtnColor
                        ),
                        height: 48.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            24.width,
                            Image.asset(uploadIcon,height: 24.h,width: 46.w,),
                            // 4.width,
                            Text(
                              'Upload image',
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  color: uploadTextColor,
                                  fontFamily: cinta,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  24.height,
                  InkWell(
                    onTap: () async {},
                    child: Container(
                      height: 48.h,
                      decoration: BoxDecoration(
                        // color: white,
                          borderRadius: BorderRadius.circular(9),
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [primary, primaryGradient],
                          )),
                      child: Center(
                          child: Text('Send message',
                              style: TextStyle(
                                  fontFamily: cinta,
                                  fontSize: 16.sp,
                                  color: white,
                                  fontWeight: FontWeight.bold))),
                    ),
                  ),

                  24.height,
                ],
              ));
        });
  }
}
