import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_indicator/loading_indicator.dart';
import '../../config/colors/app_colors.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: SizedBox(
        width: 50.w,
        height: 50.h,
        child: LoadingIndicator(
          indicatorType: Indicator.ballRotateChase,
          colors: [
            ColorsManager.semiGreen,
          ],
        ),
      ),
    );
  }
}
