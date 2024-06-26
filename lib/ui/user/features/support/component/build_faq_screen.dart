import 'package:charity/core/api/api_constant.dart';
import 'package:charity/core/helpers/spacing.dart';
import 'package:charity/core/widgets/app_text_bottom.dart';
import 'package:charity/core/widgets/app_text_form_field.dart';
import 'package:charity/ui/user/features/support/logic/support_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../config/colors/app_colors.dart';
import '../screen/review_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BuildFaqScreen extends StatelessWidget {
  const BuildFaqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SupportCubit, SupportState>(
      listener: (context, state) {
        if (state is GetReviewsSuccessState) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ReviewsScreen(),
              ));
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                verticalSpace(20.h),
                AppTextFormField(
                    backgroundColor: ColorsManager.lighterGray,
                    inputTextStyle: const TextStyle(color: ColorsManager.black),
                    maxLines: 4,
                    controller: SupportCubit.get(context).problemController,
                    hintText: AppLocalizations.of(context)!.writeyourreview,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppLocalizations.of(context)!
                            .pleaseenteryourreview;
                      }
                      return null;
                    }),
                verticalSpace(20.h),
                AppTextButton(
                    buttonText: AppLocalizations.of(context)!.send,
                    textStyle: const TextStyle(
                      color: ColorsManager.white,
                    ),
                    buttonHeight: 44.h,
                    onPressed: () {
                      SupportCubit.get(context).support(
                          text:
                              SupportCubit.get(context).problemController.text,
                          useId: ApiConstant.id ?? 0);
                    }),
                verticalSpace(20),
                AppTextButton(
                    buttonText: AppLocalizations.of(context)!.reviews,
                    textStyle: const TextStyle(
                      color: ColorsManager.white,
                    ),
                    buttonHeight: 44.h,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ReviewsScreen(),
                          ));
                    }),
              ],
            ),
          ),
        );
      },
    );
  }
}
