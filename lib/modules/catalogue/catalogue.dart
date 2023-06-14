import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:stylclick/modules/catalogue/catalogue_details.dart';
import 'package:stylclick/shared/constants/colors.dart';
import 'package:stylclick/shared/constants/images.dart';
import 'package:stylclick/shared/constants/strings.dart';
import 'package:stylclick/shared/utils/helpers.dart';
import 'package:stylclick/shared/widgets/custom_textfield.dart';

class CataloguePage extends StatefulWidget {
  const CataloguePage({Key? key}) : super(key: key);

  @override
  State<CataloguePage> createState() => _CataloguePageState();
}

class _CataloguePageState extends State<CataloguePage> {
  Gradient gradient = const LinearGradient(
    colors: [
      Color(0xFFEA4262),
      Color(0xFFDD6140),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  final List<String> images = [
    'image1.jpg',
    'image2.jpg',
    'image3.jpg',
    'image4.jpg',
    'image5.jpg',
    'image6.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: homeBgColor,
      body: Stack(
        children: [
          SizedBox(
            height: logicalHeight(),
            width: logicalWidth(),
          ),
          Container(
            decoration: BoxDecoration(gradient: gradient),
            height: 160.h,
            child: Padding(
              padding: EdgeInsets.only(left: 17.0.w, right: 17.w),
              child: Row(
                children: [
                  InkWell(
                    onTap: (){
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
          Padding(
            padding: EdgeInsets.only(left: 17.w, right: 75.w, top: 110),
            child: CustomTextField(
                hintTextColor: homeSearchHintColor,
                hintText: 'Search for a style',
                filledColor: Colors.white,
                borderRadius: BorderRadius.circular(15.r),
                prefixIcon: const Icon(Icons.search)),
          ),
          Positioned(
            top: 133,
            left: 290,
            child: InkWell(
              onTap: () {
                filterCategories(context);
              },
              child: Container(
                height: 48.h,
                width: 48.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    color: white),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset(filterIcon, height: 24, width: 24,),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 17.w, right: 17.w, top: 170),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: logicalHeight(),
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                      ),
                      itemCount: images.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            CatalogueDetails(
                              imageFile: femaleAsoebi,
                              title: 'Item $index',
                              storeName: 'Moralake Store',
                            ).launch(context);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              // borderRadius: BorderRadius.circular(8),
                              image: const DecorationImage(
                                image: AssetImage(femaleAsoebi),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Container(
                                padding: EdgeInsets.all(8),
                                // color: Colors.black.withOpacity(0.5),
                                child: Text(
                                  'Item $index',
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
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  filterCategories(BuildContext context) {
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
              padding: const EdgeInsets.all(17),
              height: logicalHeight() * 0.7,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  8.height,
                  Text(
                    'Select the category(ies) of wears to filter',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: filterTitleColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  16.height,
                  Expanded(
                    child: ListView.separated(
                      itemCount: 5,
                      separatorBuilder: (BuildContext context, int index) =>
                          Divider(),
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          child: ListTile(
                            contentPadding: EdgeInsets.zero,
                            horizontalTitleGap: 0,
                            leading: Radio(
                              value: index,
                              focusColor: Color(0xfff04a41),

                              groupValue:
                                  null, // Provide a value for groupValue
                              onChanged: (value) {},
                            ),
                            title: Text(
                              'Option $index',
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  // 8.height,
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
                          child: Text('Filter',
                              style: TextStyle(
                                  fontFamily: cinta,
                                  fontSize: 16.sp,
                                  color: white,
                                  fontWeight: FontWeight.bold))),
                    ),
                  ),
                ],
              ));
        });
  }
}
