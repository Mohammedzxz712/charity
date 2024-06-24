import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../config/colors/app_colors.dart';

class ContactUsItem extends StatelessWidget {
  const ContactUsItem({super.key, required this.icon, required this.title});
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
            side: const BorderSide(
              color: Color(0xff1DD56C),
            ),
          ),
        ),
        overlayColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              // Return transparent color when pressed
              return ColorsManager.black.withOpacity(0.1);
            }
            // Return null to use default color
            return Colors.black;
          },
        ),
      ),
      onPressed: () {},
      child: SizedBox(
        height: 40.h,
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.black,
              size: 28,
            ),
            const Gap(10),
            Text(
              title,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 18.sp,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
