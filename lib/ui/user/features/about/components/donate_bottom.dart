import 'package:charity/core/helpers/exetinsions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/routes/routes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DonateBottom extends StatelessWidget {
  const DonateBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: double.infinity,
      color: Colors.white,
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 19.w),
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: const MaterialStatePropertyAll(Colors.white),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(19.r),
                side: const BorderSide(
                  color: Colors.green,
                ),
              ),
            ),
          ),
          onPressed: () {
            context.pushNamed(AppRoutes.home);
          },
          child: Text(
            AppLocalizations.of(context)!.donatenow,
            style: TextStyle(color: Colors.green),
          ),
        ),
      ),
    );
  }
}
