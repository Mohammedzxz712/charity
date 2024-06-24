import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const InfoRow({Key? key, required this.icon, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Determine text direction based on the localization
    final bool isRTL = Directionality.of(context) == TextDirection.rtl;

    return Row(
      textDirection: TextDirection.rtl,
      children: [
        Icon(
          icon,
          color: Colors.black,
          size: 24.0,
        ),
        SizedBox(width: 8.0.w),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0.sp,
            ),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }
}
