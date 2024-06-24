import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../generated/assets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WelcomeAndImageAndTextAndDivider extends StatelessWidget {
  const WelcomeAndImageAndTextAndDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(15.h),
        RichText(
          text: TextSpan(
            text: AppLocalizations.of(context)!.welcometo,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                ),
            children: [
              TextSpan(
                text: AppLocalizations.of(context)!.ourcharity,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
              )
            ],
          ),
        ),
        verticalSpace(15.h),
        const Image(
          image: AssetImage(Assets.imagesKrakenimagesY5bvRlcCx8kUnsplash),
        ),
        Text(
            textAlign: TextAlign.center,
            style: TextStyle(height: 1.9.h),
            AppLocalizations.of(context)!
                .weareapassionateanddedicatedteamworkingrelentlesslytomakeapositiveimpactintheworldourmissionistoupliftcommunitiesprovideessentialresourcesandpromoteequalityforalltogetherwecancreatepositivechangebysupportingthoseinneed),
        verticalSpace(17.5.h),
        const Divider(
          color: Colors.black,
          thickness: 2,
          indent: 140,
          endIndent: 140,
        ),
        verticalSpace(12.h),
      ],
    );
  }
}
