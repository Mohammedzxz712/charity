import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../generated/assets.dart';

class SocialRow extends StatelessWidget {
  const SocialRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         CircleAvatar(
          backgroundColor: Colors.white,
          backgroundImage: AssetImage(
            Assets.imagesFacebook,
          ),
          radius: 15.r,
        ),
        horizontalSpace(12.w),
         CircleAvatar(
          backgroundColor: Colors.white,
          backgroundImage: AssetImage(
            Assets.imagesLinkedin,
          ),
          radius: 15.r,
        ),
        horizontalSpace(12.w),
         CircleAvatar(
          backgroundImage: AssetImage(
            Assets.imagesTwitter,
          ),
          radius: 15.r,
        ),
      ],
    );
  }
}
