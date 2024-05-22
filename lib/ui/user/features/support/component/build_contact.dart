import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:icons_plus/icons_plus.dart';

import 'contact_us_item.dart';

class BuildContactUsScreen extends StatelessWidget {
  const BuildContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Gap(15.h),
          const ContactUsItem(icon: EvaIcons.facebook, title: 'facebook'),
          Gap(15.h),
          const ContactUsItem(icon: EvaIcons.google, title: 'gmail'),
          Gap(15.h),
          const ContactUsItem(icon: EvaIcons.linkedin, title: 'linkedIn'),
          Gap(15.h),
          const ContactUsItem(icon: EvaIcons.twitter, title: 'twitter'),
        ],
      ),
    );
  }
}
