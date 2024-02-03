import 'package:flutter/material.dart';

import '../../config/colors/app_colors.dart';

class CustomOutlineButton extends StatelessWidget {
  const CustomOutlineButton(
      {super.key, required this.text, required this.onPressed});
  final String text;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed(),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: const Color(AppColors.kPrimaryColor),
            ),
      ),
    );
  }
}
