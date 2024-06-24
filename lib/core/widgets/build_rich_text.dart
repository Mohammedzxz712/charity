import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../config/colors/app_colors.dart';

Widget customRichText({
  required BuildContext context,
  required String textPartOne,
  required String textPartTwo,
}) =>
    RichText(
      text: TextSpan(
        text: textPartOne,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 35.sp,
              fontWeight: FontWeight.bold,
            ),
        children: [
          TextSpan(
            text: textPartTwo,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 35.sp,
                fontWeight: FontWeight.bold,
                color: ColorsManager.semiGreen),
          )
        ],
      ),
      locale: Locale('ar'),
    );
