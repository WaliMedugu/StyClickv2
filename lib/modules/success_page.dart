import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:stylclick/shared/constants/colors.dart';
import 'package:stylclick/shared/constants/strings.dart';

class SuccessPage extends StatelessWidget {
  final String? message;
  final String? medium;

  const SuccessPage({Key? key, this.message, this.medium}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          350.height,
          Center(
            child: Text('Successful',
                style: TextStyle(
                    fontFamily: cinta,
                    fontSize: 24.sp,
                    color: successColor,
                    fontWeight: FontWeight.bold)),
          ),
          8.height,
          Center(
            child: Text(
              message ?? '',
              style: TextStyle(
                  fontFamily: cinta,
                  fontSize: 14.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            ),
          ),
          8.height,
          Text(
            medium != null ? 'View email' : '',
            style: TextStyle(
                fontFamily: cinta,
                fontSize: 14.sp,
                color: medium != null ? categoryColor : Colors.black,
                fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
        ],
      )),
    );
  }
}
