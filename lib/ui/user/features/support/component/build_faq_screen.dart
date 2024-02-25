import 'package:charity/core/helpers/spacing.dart';
import 'package:charity/core/widgets/app_text_bottom.dart';
import 'package:charity/core/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../config/colors/app_colors.dart';

import '../../../../../core/constant/app_constant.dart';
import '../../../../../core/widgets/custom_button.dart';
import 'build_two_text_form_field.dart';

class BuildFaqScreen extends StatelessWidget {
  const BuildFaqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();
    var emailController = TextEditingController();
    var problemController = TextEditingController();
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            verticalSpace(20),
            AppTextFormField(
                hintText: 'Name',
                backgroundColor: ColorsManager.lighterGray,
                controller: nameController,
                inputTextStyle: const TextStyle(color: ColorsManager.black),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                }),
            verticalSpace(20),
            AppTextFormField(
                backgroundColor: ColorsManager.lighterGray,
                controller: emailController,
                inputTextStyle: const TextStyle(color: ColorsManager.black),
                hintText: 'Email Address',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email address';
                  }
                  return null;
                }),
            verticalSpace(20),
            AppTextFormField(
                backgroundColor: ColorsManager.lighterGray,
                inputTextStyle: const TextStyle(color: ColorsManager.black),
                maxLines: 4,
                controller: problemController,
                hintText: 'Review',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your review';
                  }
                  return null;
                }),
            verticalSpace(20),
            AppTextButton(
                buttonText: 'SEND',
                textStyle: const TextStyle(
                  color: ColorsManager.white,
                ),
                buttonHeight: 44.h,
                onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
