import 'package:charity/core/helpers/exetinsions.dart';
import 'package:charity/core/helpers/spacing.dart';
import 'package:charity/core/widgets/app_text_bottom.dart';
import 'package:charity/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../config/colors/app_colors.dart';
import '../../../../../../config/routes/routes.dart';
import '../../../../../core/widgets/build_rich_text.dart';

class ChoiseScreen extends StatelessWidget {
  const ChoiseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Image(
            image: AssetImage(Assets.imagesFirist),
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  customRichText(
                    context: context,
                    textPartOne: 'Chari',
                    textPartTwo: 'ty',
                  ),
                  verticalSpace(30),
                  AppTextButton(
                    buttonText: 'LOGIN',
                    borderSide: const BorderSide(color: ColorsManager.black),
                    textStyle: const TextStyle(
                      color: ColorsManager.black,
                    ),
                    onPressed: () => context.pushNamed(AppRoutes.login),
                    buttonWidth: 307.w,
                    buttonHeight: 44.h,
                    backgroundColor: ColorsManager.semiGray,
                  ),
                  verticalSpace(20),
                  AppTextButton(
                    buttonText: 'SIGN UP',
                    textStyle: const TextStyle(
                      color: ColorsManager.white,
                    ),
                    onPressed: () => context.pushNamed(AppRoutes.signup),
                    buttonWidth: 307.w,
                    buttonHeight: 44.h,
                    backgroundColor: ColorsManager.mainColor,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
