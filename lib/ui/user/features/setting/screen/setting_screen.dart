import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../config/colors/app_colors.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '15% OFF',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: const Color(AppColors.kPrimaryColor),
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
      ),
    );
  }
}
