import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../config/colors/app_colors.dart';
import '../../../../../core/constant/app_constant.dart';
import '../../../../../core/methods/pass_validate/pass_validate.dart';
import '../../../../../core/methods/validate_email/vaildate_email.dart';
import '../../../../../core/widgets/custom_text_form_feild.dart';

class CustomTwoTextFromField extends StatelessWidget {
  CustomTwoTextFromField({
    super.key,
    required this.controller1,
    required this.controller2,
    required this.label1,
    this.hint1,
    this.hint2,
    required this.label2,
    required this.isPass,
    required this.isPass2,
    this.prefixIcon1,
    this.prefixIcon2,
  });
  final TextEditingController controller1;
  final TextEditingController controller2;
  final String label1;
  final String label2;
  final String? hint1;
  final String? hint2;
  final bool isPass;
  final bool isPass2;
  IconData? prefixIcon1;
  IconData? prefixIcon2;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: AppConstant.deviceWidth(context),
          height: 47.h,
          decoration: BoxDecoration(
            color: ColorsManager.lighterGray,
            borderRadius: BorderRadius.circular(15),
          ),
          child: CustomTextFormField(
            isPassword: isPass,
            maxLine: 1,
            controller: controller1,
            border: InputBorder.none,
            label: label1,
            hint: hint1,
            type: TextInputType.emailAddress,
            validate: (value) {
              if (value!.isEmpty) {
                return "should enter $label2";
              } else if (!isEmailValid(value)) {
                return 'email should contain @ & .com';
              } else {
                return null;
              }
            },
            prefixIcon: prefixIcon1,
            edgeInsetsGeometry: const EdgeInsets.symmetric(
              vertical: 15,
            ),
          ),
        ),
        const Gap(20),
        Container(
          width: AppConstant.deviceWidth(context),
          height: 47.h,
          decoration: BoxDecoration(
            color: ColorsManager.lighterGray,
            borderRadius: BorderRadius.circular(15),
          ),
          child: CustomTextFormField(
            isPassword: isPass2,
            maxLine: 5,
            type: TextInputType.visiblePassword,
            controller: controller2,
            validate: (value) {
              if (value!.isEmpty) {
                return "should enter $label2";
              } else if (!isPasswordValid(value)) {
                return 'Password must include: 0-9, A-Z, a-z, and special characters';
              } else {
                return null;
              }
            },
            border: InputBorder.none,
            label: label2,
            hint: hint2,
            prefixIcon: prefixIcon2,
            edgeInsetsGeometry: const EdgeInsets.symmetric(
              vertical: 15,
            ),
          ),
        ),
      ],
    );
  }
}
