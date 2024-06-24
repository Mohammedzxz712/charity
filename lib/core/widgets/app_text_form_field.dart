import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/colors/app_colors.dart';
import '../../config/style/styles.dart';

class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final String hintText;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;

  final int? maxLines;
  final Color? backgroundColor;
  final Color? borderColor;
  final TextEditingController? controller;
  final Function(String?) validator;
  const AppTextFormField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.borderColor,
    this.inputTextStyle,
    this.maxLines,
    this.inputFormatters,
    this.keyboardType,
    this.hintStyle,
    required this.hintText,
    this.isObscureText,
    this.suffixIcon,
    this.prefixIcon,
    this.backgroundColor,
    this.controller,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        controller: controller,
        obscureText: isObscureText ?? false,
        keyboardType: keyboardType,
        cursorColor: ColorsManager.gray,
        inputFormatters: inputFormatters,
        maxLines: maxLines ?? 1,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: contentPadding ??
              EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          focusedBorder: focusedBorder ??
              OutlineInputBorder(
                borderSide: BorderSide(
                  color: borderColor ?? ColorsManager.gray,
                  width: 1.3.w,
                ),
                borderRadius: BorderRadius.circular(16.0.r),
              ),
          enabledBorder: enabledBorder ??
              OutlineInputBorder(
                borderSide: BorderSide(
                  color: borderColor ?? ColorsManager.lightGray,
                  width: 1.3.w,
                ),
                borderRadius: BorderRadius.circular(16.0.r),
              ),
          errorBorder: OutlineInputBorder(
            borderSide:  BorderSide(
              color: Colors.red,
              width: 1.3.w,
            ),
            borderRadius: BorderRadius.circular(16.0.r),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide:  BorderSide(
              color: Colors.red,
              width: 1.3.w,
            ),
            borderRadius: BorderRadius.circular(16.0.r),
          ),
          hintStyle: hintStyle ?? TextStyles.font14GrayRegular,
          hintText: hintText,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          fillColor: backgroundColor ?? ColorsManager.moreLightGray,
          filled: true,
        ),
        style: inputTextStyle ?? TextStyles.font14GrayRegular,
        validator: (value) {
          return validator(value);
        },
      ),
    );
  }
}
