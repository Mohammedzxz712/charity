import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginElevated extends StatelessWidget {
  final Function onPress; // Make sure to declare onPress as final
  LoginElevated({Key? key, required this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPress(),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          const Color(0xff1DD56C),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
          ),
        ),
      ),
      child: Text(AppLocalizations.of(context)!.login,
          style: TextStyle(color: Colors.white)),
    );
  }
}
