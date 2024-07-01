import 'package:charity/core/helpers/exetinsions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/routes/routes.dart';
import '../../../../../core/helpers/spacing.dart';

class ActionAppBar extends StatelessWidget {
  const ActionAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.pushNamed(AppRoutes.profile),
      child: Row(
        children: [
          const Text('..Mohammed Ali', style: TextStyle(color: Colors.white)),
          horizontalSpace(5.w),
          const Icon(
            Icons.person_pin,
            color: Colors.white,
          ),
          horizontalSpace(5.w),
        ],
      ),
    );
  }
}
