import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:stylclick/shared/constants/colors.dart';
import 'package:stylclick/shared/constants/strings.dart';

class CustomTextField extends StatelessWidget {
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final Function(String?)? onSaved;
  final String? hintText;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final TextAlign? textAlign;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  // final bool? readOnly;
  final bool obscureText;
  final String? obscuringCharacter;

  // final String? labelText;
  final bool? enabled;
  final Function()? onTap;
  final String? initialVlaue;
  final List<TextInputFormatter>? inputFormmater;
  final AutovalidateMode? autovalidateMode;
  final BorderRadius? borderRadius;
  String? label;
  Color? labelColor;
  Color? hintTextColor;
  Color? filledColor;
  Color? borderColor;
  Color? focusedBorderColor;
  Color? enabledBorderColor;
  int? maxLines;
  FontWeight? fontWeight;
  // ignore: use_key_in_widget_constructors
  CustomTextField(
      {this.borderColor,
      this.focusedBorderColor,
      this.enabledBorderColor,
      this.prefixIcon,
      this.suffixIcon,
      this.validator,
      this.onSaved,
      this.hintText,
      this.textInputAction,
      this.textInputType,
      this.textAlign,
      this.onChanged,
      this.controller,
      // this.readOnly,
      this.obscureText = false,
      this.obscuringCharacter,
      // this.labelText,
      this.enabled = true,
      this.onTap,
      this.initialVlaue,
      this.inputFormmater,
      this.autovalidateMode,
      this.borderRadius,
      this.label = '',
      this.hintTextColor,
      this.filledColor,
      this.maxLines,
      this.fontWeight,
      this.labelColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label!,
          style: TextStyle(
              fontSize: 14.sp,
              color: labelColor,
              fontFamily: cinta,
              fontWeight: fontWeight ?? FontWeight.w500),
        ),
        8.height,
        TextFormField(
          initialValue: initialVlaue,
          onTap: onTap,
          // cursorColor: AppColors.color18.withOpacity(0.4),
          maxLines: maxLines ?? 1,
          enabled: enabled,
          textInputAction: textInputAction,
          inputFormatters: inputFormmater,
          style: const TextStyle(
            // color: AppColors.color5,
            fontWeight: FontWeight.w500,
            fontSize: 15,
            letterSpacing: 0.4,
          ),
          // readOnly: readOnly!,
          autovalidateMode: autovalidateMode,
          decoration: InputDecoration(
            counterText: '',
            contentPadding: EdgeInsets.symmetric(
              vertical: 15.h,
              horizontal: 15.w,
            ),
            hintText: hintText,
            hintStyle: TextStyle(
              fontFamily: cinta,
              color: hintTextColor,
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
            ),

            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            filled: true,
            fillColor: filledColor ?? textfieldFilledColor,
            border: OutlineInputBorder(
              borderSide:
                  BorderSide(color: borderColor ?? textfieldFilledColor),
              borderRadius: borderRadius ?? BorderRadius.circular(5.r),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: focusedBorderColor ?? textfieldFilledColor),
              borderRadius: borderRadius ?? BorderRadius.circular(5.r),
            ),
            // errorBorder: OutlineInputBorder(
            //   borderSide:
            //       const BorderSide(color: AppColors.color6, width: 0.5),
            //   borderRadius: BorderRadius.circular(4.h),
            // ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: enabledBorderColor ?? textfieldFilledColor,
              ),
              borderRadius: borderRadius ?? BorderRadius.circular(5.r),
            ),
          ),
          obscureText: obscureText,
          // obscuringCharacter: '*',
          controller: controller,
          textAlign: textAlign ?? TextAlign.start,
          keyboardType: textInputType,
          onFieldSubmitted: onSaved,
          onSaved: onSaved,
          validator: validator,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
