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

class FabricSellerDetails extends StatefulWidget {
  final int? selectedIndex;
  final String businessName;
  FabricSellerDetails(
      {Key? key, required this.businessName, this.selectedIndex = 0})
      : super(key: key);

  @override
  State<FabricSellerDetails> createState() => _FabricSellerDetailsState();
}

class _FabricSellerDetailsState extends State<FabricSellerDetails>
    with SingleTickerProviderStateMixin {
  TabController? tabcontroller;

  @override
  void initState() {
    tabcontroller = TabController(length: 4, vsync: this);
    tabcontroller!.animateTo(widget.selectedIndex!);
    super.initState();
  }

  Gradient gradient = const LinearGradient(
    colors: [
      Color(0xFFEF3F53),
      Color(0xFFF25E38),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              SizedBox(
                height: logicalHeight(),
                width: logicalWidth(),
              ),
              Container(
                decoration: const BoxDecoration(color: white),
                // height: 160.h,
                child: Padding(
                  padding: EdgeInsets.only(left: 17.0.w, right: 17.w),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Image.asset(
                          backIcon,
                          width: 24.w,
                          color: selectTailorColor,
                        ),
                      ),
                      8.width,
                      Text(
                        widget.businessName ?? '',
                        style: TextStyle(
                          color: selectTailorColor,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 17.w, right: 17.w, top: 60.h),
                child: Image.asset(bizImage),
              ),
              Padding(
                padding: EdgeInsets.only(left: 26.w, right: 17.w, top: 140.h),
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                  child: Stack(
                    children: const [
                      Align(
                        alignment: Alignment.center,
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage(profileIcon),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 250,
                left: 310,
                child: InkWell(
                  onTap: () {
                    chatStylist(context);
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: signinTextColor),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        chatIcon,
                        height: 16.h,
                        width: 16.w,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 250,
                child: Padding(
                  padding: EdgeInsets.only(left: 17.0.w, right: 17.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.businessName ?? '',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: cinta,
                          color: const Color(0xff313131),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      4.height,
                      Row(
                        children: [
                          const Icon(
                            (Icons.location_on),
                            color: locationIconColor,
                            size: 14,
                          ),
                          4.width,
                          Text(
                            'Garki, Abuja',
                            style: TextStyle(
                              fontSize: 14.sp,
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
                          Image.asset(
                            clock,
                            height: 16,
                            width: 16,
                          ),
                          4.width,
                          Text(
                            '3y 3m on Stylclick',
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontFamily: cinta,
                                fontWeight: FontWeight.w500,
                                color: signinTextColor),
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
                      16.height,
                      ShaderMask(
                        blendMode: BlendMode.srcIn,
                        shaderCallback: (bounds) {
                          return gradient.createShader(bounds);
                        },
                        child: Text(
                          'Product',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontFamily: cinta,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      8.height,
                      Container(
                        height: 41.h,
                        width: logicalWidth() / 1.1,
                        // decoration: BoxDecoration(
                        //     color: Color(0xffe4e4e4),
                        //     // border: Border.all(color: black, width: 2.5.w),
                        //     borderRadius: BorderRadius.circular(12.r)),
                        child: TabBar(
                          unselectedLabelStyle: TextStyle(
                              fontFamily: cinta,
                              color: black,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500),
                          labelStyle: TextStyle(
                              fontFamily: cinta,
                              color: black,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500),
                          unselectedLabelColor: black,
                          labelColor: white,
                          indicatorColor: const Color(0xffe4e4e4),
                          indicatorWeight: 2,
                          indicator: BoxDecoration(
                              gradient: gradient,
                              borderRadius: BorderRadius.circular(12)),
                          controller: tabcontroller,
                          tabs: const [
                            Tab(
                              text: 'All',
                            ),
                            Tab(
                              text: 'Ankara',
                            ),
                            Tab(
                              text: 'Lace',
                            ),
                            Tab(
                              text: 'Aso-oke',
                            ),
                          ],
                        ),
                      ),
                      8.height,
                      SizedBox(
                        height: logicalHeight(),
                        width: logicalWidth(),
                        child: TabBarView(controller: tabcontroller, children: [
                          SizedBox(
                            height: logicalHeight(),
                            child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 20,
                                      mainAxisSpacing: 16,
                                      childAspectRatio: 9 / 14
                              ),
                              itemCount: 3,
                              itemBuilder: (BuildContext context, int index) {
                                return SizedBox(
                                  width: context.width() * 0.25,
                                  height: 250,
                                  child: Wrap(
                                    crossAxisAlignment: WrapCrossAlignment.start,
                                    children: [
                                      AspectRatio(
                                        aspectRatio: 9 / 11,
                                        child: Stack(
                                          children: [
                                            Image.asset(
                                              maleAsoebi,
                                              fit: BoxFit.cover,
                                                height: 200,
                                                width: 200
                                            ),
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
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Image.asset(
                                                      favoriteIcon,
                                                      height: 16.h,
                                                      width: 16.w),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        'Image $index',
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          color: storeNameColor,
                                          fontFamily: cinta,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      4.height,
                                      Row(
                                        children: [
                                          const Icon(
                                            (Icons.location_on),
                                            color: locationIconColor,
                                            size: 14,
                                          ),
                                          4.width,
                                          Text(
                                            'Swiss Ankara',
                                            style: TextStyle(
                                              fontSize: 14.sp,
                                              fontFamily: cinta,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                      4.height,
                                      Text(
                                        'NGN 3500/yard',
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontFamily: cinta,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                          Container(
                            child: const Text('data'),
                          ),
                          Container(
                            child: const Text('data'),
                          ),
                          Container(
                            child: const Text('data'),
                          )
                        ]),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
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
                      color: const Color(0xffef4a47),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  16.height,
                  Text(
                    'Upload Image',
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: black,
                        fontFamily: cinta,
                        fontWeight: FontWeight.w500),
                  ),
                  8.height,
                  DottedBorder(
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(12),
                    dashPattern: [8, 4],
                    // padding: EdgeInsets.all(6),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      child: Container(
                        decoration: const BoxDecoration(color: uploadBtnColor),
                        height: 48.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            24.width,
                            Image.asset(
                              uploadIcon,
                              height: 24.h,
                              width: 46.w,
                            ),
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
                  16.height,
                  CustomTextField(
                    label: 'Style Description',
                    labelColor: black,
                    hintTextColor: const Color.fromRGBO(0, 0, 0, 0.5),
                    hintText: 'blue green dress with a touch of red',
                    maxLines: 5,
                  ),
                  24.height,
                  InkWell(
                    onTap: () async {},
                    child: Container(
                      height: 56.h,
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
