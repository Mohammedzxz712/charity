import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/spacing.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RichText(
          text: TextSpan(
            text: AppLocalizations.of(context)!.cha,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.bold,
                ),
            children: [
              TextSpan(
                text: AppLocalizations.of(context)!.rity,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 30.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
              )
            ],
          ),
        ),
         Text(
          AppLocalizations.of(context)!.categories,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        verticalSpace(20.h),
      ],
    );
  }
}
