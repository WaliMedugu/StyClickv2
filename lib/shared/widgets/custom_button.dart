// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:nb_utils/nb_utils.dart';
// import 'package:stylclick/shared/constants/colors.dart';
// import 'package:stylclick/shared/constants/strings.dart';

// class CustomButton extends StatefulWidget {
//   // final Widget? icon;
//   final String? title;
//   final Function()? onPress;
//   final Color? color;
//   final Color? txtColor;
//   final double? width;
//   final double? height;
//   final bool? hasElevation;
//   final double? txtSize;
//   final bool isActive;

//   const CustomButton(
//       {Key? key,
//       // this.icon,
//       required this.title,
//       required this.onPress,
//       this.color,
//       this.txtColor,
//       this.txtSize,
//       this.width,
//       this.height,
//       this.isActive = false,
//       this.hasElevation})
//       : super(key: key);
//   @override
//   _CustomButtonState createState() => _CustomButtonState();
// }

// class _CustomButtonState extends State<CustomButton> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(12.sp),
//       ),
//       width: widget.width ?? 321.w, //double.infinity,
//       height: widget.height ?? 56.h,
//       child: ElevatedButton(
//         onPressed: widget.onPress,
//         style: ButtonStyle(
//             padding: MaterialStateProperty.all(const EdgeInsets.all(6)),
//             backgroundColor: MaterialStateProperty.all<Color>(
//                 //widget.color ?? Color(0xffF2902F)
//                 widget.isActive ? primary : decoratorInactiveColor),
//             shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                 RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(12.r),
//               // side: BorderSide(color: Colors.red)
//             ))),
//         child: Text(
//           widget.title ?? '',
//           style: primaryTextStyle(
//             fontFamily: cinta,
//             size: 16,
//             weight: FontWeight.w400,
//             // color: white
//           ),
//           textAlign: TextAlign.left,
//         ),
//       ),
//     );
//   }
// }
